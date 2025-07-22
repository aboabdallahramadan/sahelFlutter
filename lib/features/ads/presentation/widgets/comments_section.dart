import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/models/ad_comment.dart';
import '../../../../l10n/app_localizations.dart';

class CommentsSection extends StatefulWidget {
  final List<AdComment> comments;

  const CommentsSection({super.key, required this.comments});

  @override
  State<CommentsSection> createState() => _CommentsSectionState();
}

class _CommentsSectionState extends State<CommentsSection> {
  final _commentController = TextEditingController();

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  void _handleAddComment() {
    final comment = _commentController.text.trim();
    if (comment.isEmpty) return;

    // TODO: Implement add comment
    _commentController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Container(
      padding: const EdgeInsets.all(AppConstants.spacing16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${l10n.adComments} (${widget.comments.length})',
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
                  decoration: InputDecoration(
                    hintText: l10n.adAddComment,
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
                  onSubmitted: (_) => _handleAddComment(),
                ),
              ),
              const SizedBox(width: AppConstants.spacing8),
              IconButton(
                onPressed: _handleAddComment,
                icon: const Icon(Icons.send),
                color: AppColors.primaryAccent,
              ),
            ],
          ),
          const SizedBox(height: AppConstants.spacing24),
          
          // Comments List
          if (widget.comments.isEmpty)
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
            ...widget.comments.map((comment) => _buildCommentItem(comment)),
        ],
      ),
    );
  }

  Widget _buildCommentItem(AdComment comment) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppConstants.spacing16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Avatar
          CircleAvatar(
            radius: 20,
            backgroundColor: AppColors.backgroundGray,
            backgroundImage: comment.user.avatar != null
                ? NetworkImage(comment.user.avatar!)
                : null,
            child: comment.user.avatar == null
                ? const Icon(
                    Icons.person,
                    size: 20,
                    color: AppColors.textSecondary,
                  )
                : null,
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
                      comment.user.name,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: AppConstants.spacing8),
                    Text(
                      comment.timeAgo,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
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
              ],
            ),
          ),
        ],
      ),
    );
  }
} 