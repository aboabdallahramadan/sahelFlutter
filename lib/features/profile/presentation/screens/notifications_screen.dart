import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../l10n/app_localizations.dart';

enum NotificationType { message, like, comment, system }

class NotificationItem {
  final String id;
  final String title;
  final String body;
  final NotificationType type;
  final DateTime timestamp;
  final bool isRead;
  final String? actionId;

  NotificationItem({
    required this.id,
    required this.title,
    required this.body,
    required this.type,
    required this.timestamp,
    this.isRead = false,
    this.actionId,
  });
}

class NotificationsScreen extends ConsumerWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);

    // Mock data - in real app this would come from a provider
    final notifications = _getMockNotifications();

    return Scaffold(
      backgroundColor: AppColors.primaryBg,
      appBar: AppBar(
        title: Text(l10n.profileNotifications),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        actions: [
          if (notifications.any((n) => !n.isRead))
            TextButton(
              onPressed: () {
                // TODO: Mark all as read
              },
              child: Text(l10n.profileMarkAllRead),
            ),
        ],
      ),
      body: notifications.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.notifications_none,
                    size: 64,
                    color: AppColors.textTertiary,
                  ),
                  const SizedBox(height: AppConstants.spacing16),
                  Text(
                    l10n.profileNoNotifications,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: AppColors.textSecondary,
                        ),
                  ),
                  const SizedBox(height: AppConstants.spacing8),
                  Text(
                    l10n.profileYoullSeeNotificationsHereWhenYouGetThem,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.textTertiary,
                        ),
                  ),
                ],
              ),
            )
          : ListView.separated(
              itemCount: notifications.length,
              separatorBuilder: (context, index) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final notification = notifications[index];
                return _buildNotificationItem(context, notification);
              },
            ),
    );
  }

  Widget _buildNotificationItem(
      BuildContext context, NotificationItem notification) {
    return InkWell(
      onTap: () {
        // TODO: Handle notification tap based on type and actionId
      },
      child: Container(
        color: notification.isRead
            ? AppColors.backgroundWhite
            : AppColors.primaryAccent.withOpacity(0.05),
        padding: const EdgeInsets.all(AppConstants.spacing16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icon
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color:
                    _getNotificationColor(notification.type).withOpacity(0.1),
                borderRadius:
                    BorderRadius.circular(AppConstants.radiusCircular),
              ),
              child: Icon(
                _getNotificationIcon(notification.type),
                color: _getNotificationColor(notification.type),
                size: 24,
              ),
            ),
            const SizedBox(width: AppConstants.spacing12),

            // Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    notification.title,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: notification.isRead
                              ? FontWeight.w500
                              : FontWeight.w700,
                        ),
                  ),
                  const SizedBox(height: AppConstants.spacing4),
                  Text(
                    notification.body,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.textSecondary,
                        ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: AppConstants.spacing8),
                  Text(
                    _formatTime(context, notification.timestamp),
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.textTertiary,
                        ),
                  ),
                ],
              ),
            ),

            // Unread indicator
            if (!notification.isRead)
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: AppColors.primaryAccent,
                  shape: BoxShape.circle,
                ),
              ),
          ],
        ),
      ),
    );
  }

  IconData _getNotificationIcon(NotificationType type) {
    switch (type) {
      case NotificationType.message:
        return Icons.chat_bubble_outline;
      case NotificationType.like:
        return Icons.favorite_border;
      case NotificationType.comment:
        return Icons.comment_outlined;
      case NotificationType.system:
        return Icons.info_outline;
    }
  }

  Color _getNotificationColor(NotificationType type) {
    switch (type) {
      case NotificationType.message:
        return AppColors.primaryAccent;
      case NotificationType.like:
        return AppColors.error;
      case NotificationType.comment:
        return AppColors.secondary;
      case NotificationType.system:
        return AppColors.info;
    }
  }

  String _formatTime(BuildContext context, DateTime date) {
    final now = DateTime.now();
    final diff = now.difference(date);
    final l10n = AppLocalizations.of(context);
    if (diff.inMinutes < 1) return l10n.commonJustNow;
    if (diff.inMinutes < 60)
      return '${diff.inMinutes} ${l10n.commonMinutesAgo}';
    if (diff.inHours < 24) return '${diff.inHours} ${l10n.commonHoursAgo}';
    if (diff.inDays == 1) return l10n.commonYesterday;
    return '${diff.inDays} ${l10n.commonDaysAgo}';
  }

  List<NotificationItem> _getMockNotifications() {
    return [
      NotificationItem(
        id: '1',
        title: 'New message',
        body: 'Ahmed Mohammed sent you a message about your Toyota Camry ad',
        type: NotificationType.message,
        timestamp: DateTime.now().subtract(const Duration(minutes: 5)),
        isRead: false,
        actionId: 'chat_1',
      ),
      NotificationItem(
        id: '2',
        title: 'Someone liked your ad',
        body: '15 people liked your "iPhone 14 Pro Max" ad',
        type: NotificationType.like,
        timestamp: DateTime.now().subtract(const Duration(hours: 2)),
        isRead: false,
        actionId: 'ad_1',
      ),
      NotificationItem(
        id: '3',
        title: 'New comment',
        body: 'Sara commented on your apartment rental ad',
        type: NotificationType.comment,
        timestamp: DateTime.now().subtract(const Duration(days: 1)),
        isRead: true,
        actionId: 'ad_3',
      ),
      NotificationItem(
        id: '4',
        title: 'Welcome to Mzad Qatar!',
        body: 'Start posting ads and connect with buyers in your area',
        type: NotificationType.system,
        timestamp: DateTime.now().subtract(const Duration(days: 3)),
        isRead: true,
      ),
    ];
  }
}
