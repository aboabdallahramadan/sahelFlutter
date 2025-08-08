import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../services/ads_service.dart';
import '../models/comment_model.dart';

part 'replies_provider.freezed.dart';

@freezed
class RepliesState with _$RepliesState {
  const factory RepliesState({
    @Default([]) List<CommentModel> replies,
    @Default(false) bool isLoading,
    @Default(false) bool hasMore,
    int? nextCursor,
    String? error,
  }) = _RepliesState;
}

class RepliesNotifier extends StateNotifier<RepliesState> {
  final Ref _ref;
  final int _commentId;

  RepliesNotifier(this._ref, this._commentId) : super(const RepliesState()) {
    loadReplies();
  }

  Future<void> loadReplies() async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final service = _ref.read(adsServiceProvider);
      final response = await service.getReplies(
        commentId: _commentId,
      );

      if (response.success && response.data != null) {
        state = state.copyWith(
          isLoading: false,
          replies: response.data!.items,
          hasMore: response.data!.hasMore,
          nextCursor: response.data!.nextCursor,
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

  Future<void> loadMoreReplies() async {
    if (state.isLoading || !state.hasMore || state.nextCursor == null) return;

    state = state.copyWith(isLoading: true);

    try {
      final service = _ref.read(adsServiceProvider);
      final response = await service.getReplies(
        commentId: _commentId,
        cursor: state.nextCursor,
      );

      if (response.success && response.data != null) {
        state = state.copyWith(
          isLoading: false,
          replies: [...state.replies, ...response.data!.items],
          hasMore: response.data!.hasMore,
          nextCursor: response.data!.nextCursor,
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

  Future<void> refresh() async {
    state = const RepliesState();
    await loadReplies();
  }
}

// Provider family for managing replies per comment
final repliesProvider =
    StateNotifierProvider.family<RepliesNotifier, RepliesState, int>(
  (ref, commentId) => RepliesNotifier(ref, commentId),
);
