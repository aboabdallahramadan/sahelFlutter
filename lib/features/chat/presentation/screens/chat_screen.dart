import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../auth/providers/auth_provider.dart';
import '../providers/chat_provider.dart';
import '../../data/models/chat_messages_response.dart';
import '../../data/models/chat_list_response.dart';

class ChatScreen extends ConsumerStatefulWidget {
  final String chatId;

  const ChatScreen({super.key, required this.chatId});

  @override
  ConsumerState<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen> {
  final _messageController = TextEditingController();
  final _scrollController = ScrollController();
  ChatListItem? _otherUser;

  int get _chatId => int.parse(widget.chatId);

  @override
  void initState() {
    super.initState();
    // Load messages when screen initializes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadChatInfo();
      _loadMessages().then((_) {
        // Scroll to bottom after messages are loaded
        Future.delayed(const Duration(milliseconds: 300), () {
          if (mounted && _scrollController.hasClients) {
            _scrollToBottom();
          }
        });
      });
    });
  }

  void _loadChatInfo() {
    // Find chat info from the chat list
    final chatListState = ref.read(chatListProvider);
    final chat = chatListState.chats.firstWhere(
      (chat) => chat.id == _chatId,
      orElse: () => ChatListItem(
          id: _chatId,
          user: const ChatUserInfo(
            id: 0,
            name: 'Unknown',
            phoneNumber: '',
            profilePhotoUrl: '',
          )),
    );
    setState(() {
      _otherUser = chat;
    });
  }

  Future<void> _loadMessages() async {
    await ref.read(chatMessagesProvider(_chatId).notifier).loadMessages();
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  void _sendMessage() async {
    final text = _messageController.text.trim();
    if (text.isEmpty) return;

    _messageController.clear();

    await ref.read(chatMessagesProvider(_chatId).notifier).sendMessage(text);

    // Scroll to bottom after sending message
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted && _scrollController.hasClients) {
        _scrollToBottom();
      }
    });
  }

  String _formatTime(DateTime date) {
    final hour = date.hour.toString().padLeft(2, '0');
    final minute = date.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final authState = ref.watch(authProvider);
    final messagesState = ref.watch(chatMessagesProvider(_chatId));
    final currentUserId = authState.user?.id;

    // Check if user is authenticated
    if (!authState.isAuthenticated || currentUserId == null) {
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
        backgroundColor: AppColors.backgroundWhite,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        title: _otherUser != null
            ? Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: AppColors.backgroundGray,
                    backgroundImage:
                        _otherUser!.user.profilePhotoUrl.isNotEmpty &&
                                _otherUser!.user.profilePhotoUrl !=
                                    'placeholder.png'
                            ? NetworkImage(_otherUser!.user.profilePhotoUrl)
                            : null,
                    child: _otherUser!.user.profilePhotoUrl.isEmpty ||
                            _otherUser!.user.profilePhotoUrl ==
                                'placeholder.png'
                        ? const Icon(
                            Icons.person,
                            size: 20,
                            color: AppColors.textSecondary,
                          )
                        : null,
                  ),
                  const SizedBox(width: AppConstants.spacing12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _otherUser!.user.name,
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            : const Text('Chat'),
      ),
      body: Column(
        children: [
          // Messages list
          Expanded(
            child: messagesState.isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : messagesState.error != null
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
                              'Error loading messages',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                    color: AppColors.textSecondary,
                                  ),
                            ),
                            const SizedBox(height: AppConstants.spacing8),
                            Text(
                              messagesState.error!,
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
                              onPressed: _loadMessages,
                              child: const Text('Retry'),
                            ),
                          ],
                        ),
                      )
                    : messagesState.messages.isEmpty
                        ? Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.chat_bubble_outline,
                                  size: 80,
                                  color:
                                      AppColors.textTertiary.withOpacity(0.5),
                                ),
                                const SizedBox(height: AppConstants.spacing16),
                                Text(
                                  l10n.chatNoMessages ?? 'No messages yet',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(
                                        color: AppColors.textSecondary,
                                      ),
                                ),
                                const SizedBox(height: AppConstants.spacing8),
                                Text(
                                  l10n.chatStartConversation ??
                                      'Start a conversation!',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        color: AppColors.textTertiary,
                                      ),
                                ),
                                const SizedBox(height: AppConstants.spacing32),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: AppConstants.spacing24,
                                    vertical: AppConstants.spacing12,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.backgroundGray,
                                    borderRadius: BorderRadius.circular(
                                        AppConstants.radiusXLarge),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.arrow_downward,
                                        size: 16,
                                        color: AppColors.textSecondary,
                                      ),
                                      const SizedBox(
                                          width: AppConstants.spacing8),
                                      Text(
                                        l10n.chatTypeToStart ??
                                            'Type a message below to start',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                              color: AppColors.textSecondary,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        : ListView.builder(
                            controller: _scrollController,
                            padding:
                                const EdgeInsets.all(AppConstants.spacing16),
                            itemCount: messagesState.messages.length,
                            itemBuilder: (context, index) {
                              final message = messagesState.messages[index];
                              final isMe = message.senderId == currentUserId;

                              // Check if this is the first unread message for the current user
                              bool showUnreadDivider = false;
                              if (index > 0 && !isMe && !message.isRead) {
                                final previousMessage =
                                    messagesState.messages[index - 1];
                                if (previousMessage.receiverId !=
                                        currentUserId ||
                                    previousMessage.isRead) {
                                  showUnreadDivider = true;
                                }
                              } else if (index == 0 &&
                                  !isMe &&
                                  !message.isRead) {
                                showUnreadDivider = true;
                              }

                              return Column(
                                children: [
                                  if (showUnreadDivider)
                                    _buildUnreadDivider(context),
                                  _buildMessageBubble(
                                      message, isMe, currentUserId),
                                ],
                              );
                            },
                          ),
          ),

          // Message input
          Container(
            padding: EdgeInsets.only(
              left: AppConstants.spacing16,
              right: AppConstants.spacing16,
              bottom: MediaQuery.of(context).viewInsets.bottom +
                  AppConstants.spacing16,
              top: AppConstants.spacing16,
            ),
            decoration: BoxDecoration(
              color: AppColors.backgroundWhite,
              boxShadow: [
                BoxShadow(
                  color: AppColors.shadowLight,
                  blurRadius: 10,
                  offset: const Offset(0, -5),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    maxLines: null,
                    textInputAction: TextInputAction.send,
                    onSubmitted: (_) => _sendMessage(),
                    enabled: !messagesState.isSending,
                    decoration: InputDecoration(
                      hintText: l10n.chatTypeMessage,
                      filled: true,
                      fillColor: AppColors.backgroundGray,
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(AppConstants.radiusXLarge),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: AppConstants.spacing16,
                        vertical: AppConstants.spacing12,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: AppConstants.spacing8),
                CircleAvatar(
                  backgroundColor: messagesState.isSending
                      ? AppColors.textSecondary
                      : AppColors.primaryAccent,
                  radius: 24,
                  child: messagesState.isSending
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            color: AppColors.textWhite,
                            strokeWidth: 2,
                          ),
                        )
                      : IconButton(
                          onPressed: _sendMessage,
                          icon: const Icon(
                            Icons.send,
                            color: AppColors.textWhite,
                          ),
                        ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUnreadDivider(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: AppConstants.spacing16),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 1,
              color: AppColors.textTertiary.withOpacity(0.3),
            ),
          ),
          Container(
            margin:
                const EdgeInsets.symmetric(horizontal: AppConstants.spacing12),
            padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.spacing16,
              vertical: AppConstants.spacing8,
            ),
            decoration: BoxDecoration(
              color: AppColors.primaryAccent.withOpacity(0.1),
              borderRadius: BorderRadius.circular(AppConstants.radiusLarge),
              border: Border.all(
                color: AppColors.primaryAccent.withOpacity(0.3),
              ),
            ),
            child: Text(
              'Unread messages',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.primaryAccent,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
          Expanded(
            child: Container(
              height: 1,
              color: AppColors.textTertiary.withOpacity(0.3),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageBubble(
      ChatMessage message, bool isMe, int currentUserId) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppConstants.spacing12),
      child: Row(
        mainAxisAlignment:
            isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.7,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.spacing16,
              vertical: AppConstants.spacing12,
            ),
            decoration: BoxDecoration(
              color: isMe ? AppColors.primaryAccent : AppColors.backgroundWhite,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(AppConstants.radiusLarge),
                topRight: const Radius.circular(AppConstants.radiusLarge),
                bottomLeft:
                    Radius.circular(isMe ? AppConstants.radiusLarge : 0),
                bottomRight:
                    Radius.circular(isMe ? 0 : AppConstants.radiusLarge),
              ),
              border: !isMe && !message.isRead
                  ? Border.all(
                      color: AppColors.primaryAccent.withOpacity(0.5),
                      width: 2,
                    )
                  : null,
              boxShadow: [
                BoxShadow(
                  color: AppColors.shadowLight,
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  message.message,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color:
                            isMe ? AppColors.textWhite : AppColors.textPrimary,
                      ),
                ),
                const SizedBox(height: AppConstants.spacing4),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      _formatTime(message.date),
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: isMe
                                ? AppColors.textWhite.withOpacity(0.7)
                                : AppColors.textTertiary,
                          ),
                    ),
                    if (isMe) ...[
                      const SizedBox(width: AppConstants.spacing4),
                      Icon(
                        message.isRead ? Icons.done_all : Icons.done,
                        size: 14,
                        color: message.isRead
                            ? AppColors.textWhite
                            : AppColors.textWhite.withOpacity(0.7),
                      ),
                    ],
                    if (!isMe && !message.isRead) ...[
                      const SizedBox(width: AppConstants.spacing4),
                      Container(
                        width: 6,
                        height: 6,
                        decoration: BoxDecoration(
                          color: AppColors.primaryAccent,
                          shape: BoxShape.circle,
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
    );
  }
}
