import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/models/chat.dart';
import '../../../../l10n/app_localizations.dart';

class ChatsScreen extends ConsumerStatefulWidget {
  const ChatsScreen({super.key});

  @override
  ConsumerState<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends ConsumerState<ChatsScreen> {
  String _searchQuery = '';
  
  // Mock data - in real app this would come from a provider
  final List<ChatPreview> _mockChats = [
    ChatPreview(
      id: '1',
      otherUser: const ChatUser(
        id: '2',
        name: 'Ahmed Mohammed',
        avatar: 'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=50&h=50&fit=crop&crop=face',
      ),
      lastMessage: 'Is this item still available? I am interested in buying it.',
      lastMessageTime: DateTime.now().subtract(const Duration(minutes: 5)),
      unreadCount: 2,
    ),
    ChatPreview(
      id: '2',
      otherUser: const ChatUser(
        id: '3',
        name: 'Sara Al-Rashid',
        avatar: 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=50&h=50&fit=crop&crop=face',
      ),
      lastMessage: 'Thank you for the information. I will contact you tomorrow.',
      lastMessageTime: DateTime.now().subtract(const Duration(hours: 2)),
      unreadCount: 0,
    ),
    ChatPreview(
      id: '3',
      otherUser: const ChatUser(
        id: '4',
        name: 'Khaled Ibrahim',
        avatar: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=50&h=50&fit=crop&crop=face',
      ),
      lastMessage: 'Can we meet at 3 PM today?',
      lastMessageTime: DateTime.now().subtract(const Duration(days: 1)),
      unreadCount: 1,
    ),
  ];

  List<ChatPreview> get filteredChats {
    if (_searchQuery.isEmpty) return _mockChats;
    
    return _mockChats.where((chat) {
      return chat.otherUser.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          (chat.lastMessage?.toLowerCase().contains(_searchQuery.toLowerCase()) ?? false);
    }).toList();
  }

  int get totalUnreadCount {
    return _mockChats.fold(0, (sum, chat) => sum + chat.unreadCount);
  }

  String _formatTime(DateTime date) {
    final now = DateTime.now();
    final diff = now.difference(date);
    
    if (diff.inMinutes < 1) return 'Now';
    if (diff.inMinutes < 60) return '${diff.inMinutes}m ago';
    if (diff.inHours < 24) return '${diff.inHours}h ago';
    if (diff.inDays == 1) return 'Yesterday';
    return '${diff.inDays} days ago';
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: AppColors.primaryBg,
      appBar: AppBar(
        title: Text(l10n.chatTitle),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: Column(
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
                            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          if (totalUnreadCount > 0)
                            Text(
                              '$totalUnreadCount ${l10n.chatNewMessage}',
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: AppColors.textSecondary,
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
                      borderRadius: BorderRadius.circular(AppConstants.radiusLarge),
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
            child: filteredChats.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.message_outlined,
                          size: 64,
                          color: AppColors.textTertiary,
                        ),
                        const SizedBox(height: AppConstants.spacing16),
                        Text(
                          _searchQuery.isEmpty 
                              ? l10n.chatNoChats 
                              : 'No chats found',
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                        const SizedBox(height: AppConstants.spacing8),
                        Text(
                          _searchQuery.isEmpty
                              ? l10n.chatNoChatsDesc
                              : 'Try adjusting your search',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColors.textTertiary,
                          ),
                        ),
                        if (_searchQuery.isEmpty) ...[
                          const SizedBox(height: AppConstants.spacing24),
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
                    itemCount: filteredChats.length,
                    separatorBuilder: (context, index) => const Divider(height: 1),
                    itemBuilder: (context, index) {
                      final chat = filteredChats[index];
                      return _buildChatItem(chat);
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildChatItem(ChatPreview chat) {
    return InkWell(
      onTap: () {
        context.goNamed('chat', pathParameters: {'chatId': chat.id});
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
              backgroundImage: chat.otherUser.avatar != null
                  ? NetworkImage(chat.otherUser.avatar!)
                  : null,
              child: chat.otherUser.avatar == null
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
                        chat.otherUser.name,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        _formatTime(chat.lastMessageTime),
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.textTertiary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppConstants.spacing4),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          chat.lastMessage ?? '',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColors.textSecondary,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (chat.unreadCount > 0) ...[
                        const SizedBox(width: AppConstants.spacing8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppConstants.spacing8,
                            vertical: AppConstants.spacing4,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primaryAccent,
                            borderRadius: BorderRadius.circular(AppConstants.radiusCircular),
                          ),
                          child: Text(
                            '${chat.unreadCount}',
                            style: const TextStyle(
                              color: AppColors.textWhite,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ],
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