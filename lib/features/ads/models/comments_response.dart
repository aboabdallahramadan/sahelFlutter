import 'package:freezed_annotation/freezed_annotation.dart';
import 'comment_model.dart';

part 'comments_response.freezed.dart';
part 'comments_response.g.dart';

@freezed
class CommentsResponse with _$CommentsResponse {
  const factory CommentsResponse({
    required List<CommentModel> items,
    required bool hasMore,
    int? nextCursor,
  }) = _CommentsResponse;

  factory CommentsResponse.fromJson(Map<String, dynamic> json) =>
      _$CommentsResponseFromJson(json);
}
