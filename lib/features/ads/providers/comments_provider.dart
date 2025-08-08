import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../services/ads_service.dart';
import '../models/comment_model.dart';
import '../models/comment_request.dart';
import '../../../features/auth/providers/auth_provider.dart';
import 'package:go_router/go_router.dart';
import '../../../app.dart';
import 'replies_provider.dart';

part 'comments_provider.freezed.dart';

@freezed
class CommentsState with _$CommentsState {
  const factory CommentsState({
    @Default([]) List<CommentModel> comments,
    @Default(false) bool isLoading,
    @Default(false) bool hasMore,
    int? nextCursor,
    String? error,
    int? replyingToCommentId,
  }) = _CommentsState;
}

final commentsProvider =
    StateNotifierProvider.family<CommentsNotifier, CommentsState, int>(
        (ref, offerId) {
  return CommentsNotifier(ref, offerId);
});

class CommentsNotifier extends StateNotifier<CommentsState> {
  final Ref _ref;
  final int _offerId;

  CommentsNotifier(this._ref, this._offerId) : super(const CommentsState()) {
    loadComments();
  }

  Future<void> loadComments() async {
    if (state.isLoading) return;

    state = state.copyWith(isLoading: true, error: null);

    try {
      final service = _ref.read(adsServiceProvider);
      final response = await service.getComments(offerId: _offerId);

      if (response.success && response.data != null) {
        state = state.copyWith(
          comments: response.data!.items,
          hasMore: response.data!.hasMore,
          nextCursor: response.data!.nextCursor,
          isLoading: false,
        );
      } else {
        state = state.copyWith(
          isLoading: false,
          error: response.message,
        );
      }
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  Future<void> loadMoreComments() async {
    if (state.isLoading || !state.hasMore || state.nextCursor == null) return;

    state = state.copyWith(isLoading: true);

    try {
      final service = _ref.read(adsServiceProvider);
      final response = await service.getComments(
        offerId: _offerId,
        cursor: state.nextCursor,
      );

      if (response.success && response.data != null) {
        state = state.copyWith(
          comments: [...state.comments, ...response.data!.items],
          hasMore: response.data!.hasMore,
          nextCursor: response.data!.nextCursor,
          isLoading: false,
        );
      } else {
        state = state.copyWith(
          isLoading: false,
          error: response.message,
        );
      }
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  void setReplyingTo(int? commentId) {
    state = state.copyWith(replyingToCommentId: commentId);
  }

  Future<bool> postComment(String comment) async {
    // Check if user is authenticated
    final authState = _ref.read(authProvider);
    if (!authState.isAuthenticated) {
      // Redirect to login
      final context = App.navigatorKey.currentContext;
      if (context != null && context.mounted) {
        context.goNamed('login');
      }
      return false;
    }

    try {
      final service = _ref.read(adsServiceProvider);
      final request = CommentRequest(
        comment: comment,
        replyToCommentId: state.replyingToCommentId,
      );

      final response = await service.postComment(
        offerId: _offerId,
        request: request,
      );

      if (response.success && response.data != null) {
        // Check if this is a reply or a regular comment
        if (state.replyingToCommentId != null) {
          // It's a reply - update the parent comment's reply count
          final updatedComments = state.comments.map((comment) {
            if (comment.id == state.replyingToCommentId) {
              // Increment the replies count for the parent comment
              return comment.copyWith(
                repliesCount: comment.repliesCount + 1,
              );
            }
            return comment;
          }).toList();

          state = state.copyWith(
            comments: updatedComments,
            replyingToCommentId: null,
          );

          // Also add the reply to the replies provider if it's already loaded
          final parentCommentId = response.data!.replyToCommentId!;
          final repliesNotifier =
              _ref.read(repliesProvider(parentCommentId).notifier);
          // Add the new reply to the beginning of the replies list
          final currentRepliesState =
              _ref.read(repliesProvider(parentCommentId));
          if (currentRepliesState.replies.isNotEmpty) {
            // Only update if replies are already loaded
            repliesNotifier.state = currentRepliesState.copyWith(
              replies: [response.data!, ...currentRepliesState.replies],
            );
          }
        } else {
          // It's a regular comment - add to the beginning of the list
          state = state.copyWith(
            comments: [response.data!, ...state.comments],
            replyingToCommentId: null,
          );
        }
        return true;
      } else {
        state = state.copyWith(
          error: response.message,
        );
        return false;
      }
    } catch (e) {
      // If it's a 401 error, the interceptor will handle the redirect
      if (e.toString().contains('401')) {
        // The user will be redirected to login
        return false;
      }
      state = state.copyWith(
        error: e.toString(),
      );
      return false;
    }
  }

  Future<void> refresh() async {
    state = const CommentsState();
    await loadComments();
  }
}
