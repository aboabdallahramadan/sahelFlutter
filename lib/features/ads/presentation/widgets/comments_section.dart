import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/services/api_service.dart';
import '../../../../l10n/app_localizations.dart';
import '../../providers/comments_provider.dart';
import '../../providers/replies_provider.dart';
import '../../models/comment_model.dart';

class CommentsSection extends ConsumerStatefulWidget {
  final int offerId;

  const CommentsSection({super.key, required this.offerId});

  @override
  ConsumerState<CommentsSection> createState() => _CommentsSectionState();
}

class _CommentsSectionState extends ConsumerState<CommentsSection> {
  final _commentController = TextEditingController();
  final _replyControllers = <int, TextEditingController>{};
  final _expandedComments = <int>{};
  bool _isSubmitting = false;

  @override
  void dispose() {
    _commentController.dispose();
    for (final controller in _replyControllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  TextEditingController _getReplyController(int commentId) {
    return _replyControllers.putIfAbsent(
      commentId,
      () => TextEditingController(),
    );
  }

  Future<void> _handleAddComment({int? replyToId}) async {
    final controller =
        replyToId != null ? _getReplyController(replyToId) : _commentController;
    final comment = controller.text.trim();

    if (comment.isEmpty || _isSubmitting) return;

    setState(() {
      _isSubmitting = true;
    });

    try {
      final notifier = ref.read(commentsProvider(widget.offerId).notifier);
      notifier.setReplyingTo(replyToId);

      final success = await notifier.postComment(comment);

      if (success) {
        controller.clear();

        // If this was a reply, expand the replies section to show the new reply
        if (replyToId != null && mounted) {
          setState(() {
            _expandedComments.add(replyToId);
          });
        }

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Comment posted successfully'),
              backgroundColor: Colors.green,
            ),
          );
        }
      }
    } finally {
      if (mounted) {
        setState(() {
          _isSubmitting = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final commentsState = ref.watch(commentsProvider(widget.offerId));

    return Container(
      padding: const EdgeInsets.all(AppConstants.spacing16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${l10n.adComments} (${commentsState.comments.length})',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: AppConstants.spacing16),

          // Add Comment
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _commentController,
                  enabled: !_isSubmitting,
                  decoration: InputDecoration(
                    hintText: l10n.adAddComment,
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
                  onSubmitted: (_) => _handleAddComment(),
                ),
              ),
              const SizedBox(width: AppConstants.spacing8),
              IconButton(
                onPressed: _isSubmitting ? null : () => _handleAddComment(),
                icon: _isSubmitting
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: AppColors.primaryAccent,
                        ),
                      )
                    : const Icon(Icons.send),
                color: AppColors.primaryAccent,
              ),
            ],
          ),
          const SizedBox(height: AppConstants.spacing24),

          // Comments List
          if (commentsState.isLoading && commentsState.comments.isEmpty)
            const Center(
              child: Padding(
                padding: EdgeInsets.all(AppConstants.spacing32),
                child: CircularProgressIndicator(
                  color: AppColors.primaryAccent,
                ),
              ),
            )
          else if (commentsState.error != null)
            Center(
              child: Padding(
                padding: const EdgeInsets.all(AppConstants.spacing32),
                child: Column(
                  children: [
                    Icon(
                      Icons.error_outline,
                      size: 48,
                      color: AppColors.error,
                    ),
                    const SizedBox(height: AppConstants.spacing12),
                    Text(
                      'Error loading comments',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: AppColors.textSecondary,
                          ),
                    ),
                    const SizedBox(height: AppConstants.spacing8),
                    ElevatedButton(
                      onPressed: () {
                        ref
                            .read(commentsProvider(widget.offerId).notifier)
                            .refresh();
                      },
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              ),
            )
          else if (commentsState.comments.isEmpty)
            Center(
              child: Padding(
                padding: const EdgeInsets.all(AppConstants.spacing32),
                child: Column(
                  children: [
                    Icon(
                      Icons.chat_bubble_outline,
                      size: 48,
                      color: AppColors.textTertiary,
                    ),
                    const SizedBox(height: AppConstants.spacing12),
                    Text(
                      'No comments yet',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: AppColors.textSecondary,
                          ),
                    ),
                    const SizedBox(height: AppConstants.spacing4),
                    Text(
                      'Be the first to comment',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColors.textTertiary,
                          ),
                    ),
                  ],
                ),
              ),
            )
          else
            ...commentsState.comments
                .map((comment) => _buildCommentItem(comment)),

          // Load more button
          if (commentsState.hasMore)
            Center(
              child: Padding(
                padding: const EdgeInsets.all(AppConstants.spacing16),
                child: commentsState.isLoading
                    ? const CircularProgressIndicator(
                        color: AppColors.primaryAccent,
                      )
                    : OutlinedButton(
                        onPressed: () {
                          ref
                              .read(commentsProvider(widget.offerId).notifier)
                              .loadMoreComments();
                        },
                        child: Text(l10n.commonSeeMore),
                      ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildCommentItem(CommentModel comment) {
    final isReplying = ref.watch(
      commentsProvider(widget.offerId)
          .select((state) => state.replyingToCommentId == comment.id),
    );
    final l10n = AppLocalizations.of(context);
    return Container(
      margin: const EdgeInsets.only(bottom: AppConstants.spacing16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Avatar
              CircleAvatar(
                radius: 20,
                backgroundColor: AppColors.backgroundGray,
                child: comment.userProfilePhotoUrl != 'placeholder.png'
                    ? ClipOval(
                        child: CachedNetworkImage(
                          imageUrl:
                              '${ApiService.baseUrl}/uploads/${comment.userProfilePhotoUrl}',
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                          errorWidget: (context, url, error) => const Icon(
                            Icons.person,
                            size: 20,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      )
                    : const Icon(
                        Icons.person,
                        size: 20,
                        color: AppColors.textSecondary,
                      ),
              ),
              const SizedBox(width: AppConstants.spacing12),

              // Comment Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          comment.userName,
                          style:
                              Theme.of(context).textTheme.titleSmall?.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        const SizedBox(width: AppConstants.spacing8),
                        Text(
                          timeago.format(comment.createdAt),
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: AppColors.textTertiary,
                                  ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppConstants.spacing4),
                    Text(
                      comment.comment,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: AppConstants.spacing8),
                    Row(
                      children: [
                        TextButton(
                          onPressed: () {
                            ref
                                .read(commentsProvider(widget.offerId).notifier)
                                .setReplyingTo(isReplying ? null : comment.id);
                          },
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: const Size(0, 0),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: Text(
                            isReplying ? l10n.commonCancel : l10n.commonReply,
                            style: TextStyle(
                              color: AppColors.primaryAccent,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        if (comment.repliesCount > 0) ...[
                          const SizedBox(width: AppConstants.spacing16),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                if (_expandedComments.contains(comment.id)) {
                                  _expandedComments.remove(comment.id);
                                } else {
                                  _expandedComments.add(comment.id);
                                }
                              });
                            },
                            style: TextButton.styleFrom(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              minimumSize: const Size(0, 0),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  _expandedComments.contains(comment.id)
                                      ? Icons.expand_less
                                      : Icons.expand_more,
                                  size: 16,
                                  color: AppColors.primaryAccent,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  '${comment.repliesCount} ${comment.repliesCount == 1 ? l10n.commonReply : l10n.commonReplies}',
                                  style: TextStyle(
                                    color: AppColors.primaryAccent,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
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

          // Reply input
          if (isReplying)
            Padding(
              padding: const EdgeInsets.only(
                left: 52, // Avatar width + spacing
                top: AppConstants.spacing8,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _getReplyController(comment.id),
                      enabled: !_isSubmitting,
                      autofocus: true,
                      decoration: InputDecoration(
                        hintText: l10n.commonAddReply,
                        filled: true,
                        fillColor: AppColors.backgroundGray,
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(AppConstants.radiusLarge),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: AppConstants.spacing16,
                          vertical: AppConstants.spacing8,
                        ),
                      ),
                      onSubmitted: (_) =>
                          _handleAddComment(replyToId: comment.id),
                    ),
                  ),
                  const SizedBox(width: AppConstants.spacing8),
                  IconButton(
                    onPressed: _isSubmitting
                        ? null
                        : () => _handleAddComment(replyToId: comment.id),
                    icon: _isSubmitting
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: AppColors.primaryAccent,
                            ),
                          )
                        : const Icon(Icons.send, size: 20),
                    color: AppColors.primaryAccent,
                  ),
                ],
              ),
            ),

          // Replies section
          if (_expandedComments.contains(comment.id) &&
              comment.repliesCount > 0)
            _buildRepliesSection(comment.id),
        ],
      ),
    );
  }

  Widget _buildRepliesSection(int commentId) {
    final repliesState = ref.watch(repliesProvider(commentId));
    final l10n = AppLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.only(
        left: 52, // Avatar width + spacing
        top: AppConstants.spacing8,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (repliesState.isLoading && repliesState.replies.isEmpty)
            const Padding(
              padding: EdgeInsets.all(AppConstants.spacing8),
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: AppColors.primaryAccent,
              ),
            )
          else if (repliesState.error != null)
            Padding(
              padding: const EdgeInsets.all(AppConstants.spacing8),
              child: Text(
                l10n.commonFailedToLoadReplies,
                style: TextStyle(
                  color: AppColors.error,
                  fontSize: 12,
                ),
              ),
            )
          else
            ...repliesState.replies.map((reply) => _buildReplyItem(reply)),

          // Load more button for replies
          if (repliesState.hasMore)
            Padding(
              padding: const EdgeInsets.only(top: AppConstants.spacing8),
              child: repliesState.isLoading
                  ? const SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: AppColors.primaryAccent,
                      ),
                    )
                  : TextButton(
                      onPressed: () {
                        ref
                            .read(repliesProvider(commentId).notifier)
                            .loadMoreReplies();
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: const Size(0, 0),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: Text(
                        l10n.commonLoadMoreReplies,
                        style: TextStyle(
                          color: AppColors.primaryAccent,
                          fontSize: 12,
                        ),
                      ),
                    ),
            ),
        ],
      ),
    );
  }

  Widget _buildReplyItem(CommentModel reply) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppConstants.spacing8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Avatar
          CircleAvatar(
            radius: 16,
            backgroundColor: AppColors.backgroundGray,
            child: reply.userProfilePhotoUrl != 'placeholder.png'
                ? ClipOval(
                    child: CachedNetworkImage(
                      imageUrl:
                          '${ApiService.baseUrl}/uploads/${reply.userProfilePhotoUrl}',
                      width: 32,
                      height: 32,
                      fit: BoxFit.cover,
                      errorWidget: (context, url, error) => const Icon(
                        Icons.person,
                        size: 16,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  )
                : const Icon(
                    Icons.person,
                    size: 16,
                    color: AppColors.textSecondary,
                  ),
          ),
          const SizedBox(width: AppConstants.spacing8),

          // Reply Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      reply.userName,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    const SizedBox(width: AppConstants.spacing8),
                    Text(
                      timeago.format(reply.createdAt),
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: AppColors.textTertiary,
                            fontSize: 11,
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: AppConstants.spacing4),
                Text(
                  reply.comment,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
