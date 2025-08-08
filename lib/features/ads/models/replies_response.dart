import 'package:freezed_annotation/freezed_annotation.dart';
import 'comment_model.dart';

part 'replies_response.freezed.dart';
part 'replies_response.g.dart';

@freezed
class RepliesResponse with _$RepliesResponse {
  const factory RepliesResponse({
    required List<CommentModel> items,
    required bool hasMore,
    int? nextCursor,
  }) = _RepliesResponse;

  factory RepliesResponse.fromJson(Map<String, dynamic> json) =>
      _$RepliesResponseFromJson(json);
}
