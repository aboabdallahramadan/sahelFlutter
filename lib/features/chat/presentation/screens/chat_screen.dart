import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/models/chat.dart';
import '../../../../l10n/app_localizations.dart';

class ChatScreen extends ConsumerStatefulWidget {
  final String chatId;

  const ChatScreen({super.key, required this.chatId});

  @override
  ConsumerState<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen> {
  final _messageController = TextEditingController();
  final _scrollController = ScrollController();
  final bool _isTyping = false;

  // Mock data - in real app this would come from a provider
  final List<Message> _messages = [
    Message(
      id: '1',
      chatId: '1',
      senderId: '2',
      content: 'Hello! I saw your ad for the Toyota Camry. Is it still available?',
      timestamp: DateTime.now().subtract(const Duration(hours: 2)),
      isRead: true,
    ),
    Message(
      id: '2',
      chatId: '1',
      senderId: '1',
      content: 'Yes, it is still available. Would you like to know more details?',
      timestamp: DateTime.now().subtract(const Duration(hours: 1, minutes: 30)),
      isRead: true,
    ),
    Message(
      id: '3',
      chatId: '1',
      senderId: '2',
      content: 'Yes, please. What is the condition of the car? Has it been in any accidents?',
      timestamp: DateTime.now().subtract(const Duration(hours: 1)),
      isRead: true,
    ),
    Message(
      id: '4',
      chatId: '1',
      senderId: '1',
      content: 'The car is in excellent condition. No accidents, regular maintenance, and all documents are available.',
      timestamp: DateTime.now().subtract(const Duration(minutes: 45)),
      isRead: true,
    ),
    Message(
      id: '5',
      chatId: '1',
      senderId: '2',
      content: 'That sounds great! Can we schedule a time to see the car?',
      timestamp: DateTime.now().subtract(const Duration(minutes: 30)),
      isRead: true,
    ),
    Message(
      id: '6',
      chatId: '1',
      senderId: '1',
      content: 'Of course! I am free tomorrow after 3 PM. Where would you like to meet?',
      timestamp: DateTime.now().subtract(const Duration(minutes: 5)),
      isRead: false,
    ),
  ];

  final Chat _mockChat = Chat(
    id: '1',
    participants: const [
      Participant(id: '1', name: 'You'),
      Participant(
        id: '2',
        name: 'Ahmed Mohammed',
        avatar: 'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=50&h=50&fit=crop&crop=face',
      ),
    ],
    lastMessage: 'Of course! I am free tomorrow after 3 PM.',
    lastMessageTime: DateTime.now().subtract(const Duration(minutes: 5)),
    unreadCount: 0,
    createdAt: DateTime.now().subtract(const Duration(days: 1)),
    updatedAt: DateTime.now().subtract(const Duration(minutes: 5)),
  );

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToBottom();
    });
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

  void _sendMessage() {
    final text = _messageController.text.trim();
    if (text.isEmpty) return;

    final newMessage = Message(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      chatId: widget.chatId,
      senderId: '1',
      content: text,
      timestamp: DateTime.now(),
      isRead: false,
    );

    setState(() {
      _messages.add(newMessage);
      _messageController.clear();
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToBottom();
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
    final otherUser = _mockChat.participants.firstWhere((p) => p.id != '1');

    return Scaffold(
      backgroundColor: AppColors.primaryBg,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundWhite,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        title: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: AppColors.backgroundGray,
              backgroundImage: otherUser.avatar != null
                  ? NetworkImage(otherUser.avatar!)
                  : null,
              child: otherUser.avatar == null
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
                    otherUser.name,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  if (_isTyping)
                    Text(
                      l10n.chatTyping,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          // Messages list
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.all(AppConstants.spacing16),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                final isMe = message.senderId == '1';
                
                return _buildMessageBubble(message, isMe);
              },
            ),
          ),
          
          // Message input
          Container(
            padding: EdgeInsets.only(
              left: AppConstants.spacing16,
              right: AppConstants.spacing16,
              bottom: MediaQuery.of(context).viewInsets.bottom + AppConstants.spacing16,
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
                    decoration: InputDecoration(
                      hintText: l10n.chatTypeMessage,
                      filled: true,
                      fillColor: AppColors.backgroundGray,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(AppConstants.radiusXLarge),
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
                  backgroundColor: AppColors.primaryAccent,
                  radius: 24,
                  child: IconButton(
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

  Widget _buildMessageBubble(Message message, bool isMe) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppConstants.spacing12),
      child: Row(
        mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
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
                bottomLeft: Radius.circular(isMe ? AppConstants.radiusLarge : 0),
                bottomRight: Radius.circular(isMe ? 0 : AppConstants.radiusLarge),
              ),
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
                  message.content,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: isMe ? AppColors.textWhite : AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: AppConstants.spacing4),
                Text(
                  _formatTime(message.timestamp),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: isMe 
                        ? AppColors.textWhite.withOpacity(0.7)
                        : AppColors.textTertiary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
} 