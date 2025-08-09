import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/widgets/refresh_wrapper.dart';
import '../../../auth/providers/auth_provider.dart';
import '../providers/chat_provider.dart';
import '../../data/models/chat_list_response.dart';

class ChatsScreen extends ConsumerStatefulWidget {
  const ChatsScreen({super.key});

  @override
  ConsumerState<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends ConsumerState<ChatsScreen> {
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    // Load chats when screen initializes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadChats();
    });
  }

  void _loadChats() {
    ref.read(chatListProvider.notifier).loadChats();
  }

  List<ChatListItem> get filteredChats {
    final chatListState = ref.watch(chatListProvider);

    if (_searchQuery.isEmpty) return chatListState.chats;

    return chatListState.chats.where((chat) {
      return chat.user.name.toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final authState = ref.watch(authProvider);
    final chatListState = ref.watch(chatListProvider);

    // Check if user is authenticated
    if (!authState.isAuthenticated) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.goNamed('login');
      });
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
        backgroundColor: AppColors.primaryBg,
        appBar: AppBar(
          title: Text(l10n.chatTitle),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => context.pop(),
          ),
        ),
        body: RefreshWrapper(
          onRefresh: () async {
            // Refresh the chat list
            await ref.read(chatListProvider.notifier).loadChats();
          },
          child: Column(
            children: [
              // Header with search
              Container(
                color: AppColors.backgroundWhite,
                padding: const EdgeInsets.all(AppConstants.spacing16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.message,
                          size: 32,
                          color: AppColors.primaryAccent,
                        ),
                        const SizedBox(width: AppConstants.spacing12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                l10n.chatTitle,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppConstants.spacing16),

                    // Search bar
                    TextField(
                      onChanged: (value) {
                        setState(() {
                          _searchQuery = value;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: l10n.chatSearchChats,
                        prefixIcon: const Icon(Icons.search),
                        filled: true,
                        fillColor: AppColors.backgroundGray,
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(AppConstants.radiusLarge),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: AppConstants.spacing16,
                          vertical: AppConstants.spacing12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Chats list
              Expanded(
                child: chatListState.isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : chatListState.error != null
                        ? Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.error_outline,
                                  size: 64,
                                  color: AppColors.error,
                                ),
                                const SizedBox(height: AppConstants.spacing16),
                                Text(
                                  'Error loading chats',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(
                                        color: AppColors.textSecondary,
                                      ),
                                ),
                                const SizedBox(height: AppConstants.spacing8),
                                Text(
                                  chatListState.error!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        color: AppColors.textTertiary,
                                      ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: AppConstants.spacing24),
                                ElevatedButton(
                                  onPressed: _loadChats,
                                  child: const Text('Retry'),
                                ),
                              ],
                            ),
                          )
                        : filteredChats.isEmpty
                            ? Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.message_outlined,
                                      size: 64,
                                      color: AppColors.textTertiary,
                                    ),
                                    const SizedBox(
                                        height: AppConstants.spacing16),
                                    Text(
                                      _searchQuery.isEmpty
                                          ? l10n.chatNoChats
                                          : 'No chats found',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge
                                          ?.copyWith(
                                            color: AppColors.textSecondary,
                                          ),
                                    ),
                                    const SizedBox(
                                        height: AppConstants.spacing8),
                                    Text(
                                      _searchQuery.isEmpty
                                          ? l10n.chatNoChatsDesc
                                          : 'Try adjusting your search',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                            color: AppColors.textTertiary,
                                          ),
                                    ),
                                    if (_searchQuery.isEmpty) ...[
                                      const SizedBox(
                                          height: AppConstants.spacing24),
                                      ElevatedButton(
                                        onPressed: () {
                                          context.goNamed('categories');
                                        },
                                        child: const Text('Browse Ads'),
                                      ),
                                    ],
                                  ],
                                ),
                              )
                            : ListView.separated(
                                physics: const AlwaysScrollableScrollPhysics(),
                                itemCount: filteredChats.length,
                                separatorBuilder: (context, index) =>
                                    const Divider(height: 1),
                                itemBuilder: (context, index) {
                                  final chat = filteredChats[index];
                                  return _buildChatItem(chat);
                                },
                              ),
              ),
            ],
          ),
        ));
  }

  Widget _buildChatItem(ChatListItem chat) {
    return InkWell(
      onTap: () {
        context.goNamed('chat', pathParameters: {'chatId': chat.id.toString()});
      },
      child: Container(
        color: AppColors.backgroundWhite,
        padding: const EdgeInsets.all(AppConstants.spacing16),
        child: Row(
          children: [
            // Avatar
            CircleAvatar(
              radius: 28,
              backgroundColor: AppColors.backgroundGray,
              backgroundImage: chat.user.profilePhotoUrl.isNotEmpty &&
                      chat.user.profilePhotoUrl != 'placeholder.png'
                  ? NetworkImage(chat.user.profilePhotoUrl)
                  : null,
              child: chat.user.profilePhotoUrl.isEmpty ||
                      chat.user.profilePhotoUrl == 'placeholder.png'
                  ? const Icon(
                      Icons.person,
                      size: 28,
                      color: AppColors.textSecondary,
                    )
                  : null,
            ),
            const SizedBox(width: AppConstants.spacing12),

            // Chat info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        chat.user.name,
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppConstants.spacing4),
                  Text(
                    'Tap to start conversation',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.textSecondary,
                        ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
