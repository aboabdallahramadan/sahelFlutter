import 'package:freezed_annotation/freezed_annotation.dart';

part 'ad_comment.freezed.dart';
part 'ad_comment.g.dart';

@freezed
class AdComment with _$AdComment {
  const factory AdComment({
    required String id,
    required CommentUser user,
    required String comment,
    required String timeAgo,
  }) = _AdComment;

  factory AdComment.fromJson(Map<String, dynamic> json) =>
      _$AdCommentFromJson(json);
}

@freezed
class CommentUser with _$CommentUser {
  const factory CommentUser({
    required String name,
    String? avatar,
  }) = _CommentUser;

  factory CommentUser.fromJson(Map<String, dynamic> json) =>
      _$CommentUserFromJson(json);
} 