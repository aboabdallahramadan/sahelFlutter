import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment_model.freezed.dart';
part 'comment_model.g.dart';

@freezed
class CommentModel with _$CommentModel {
  const factory CommentModel({
    required int id,
    required String comment,
    required int offerId,
    required int userId,
    required String userName,
    required String userProfilePhotoUrl,
    int? replyToCommentId,
    required DateTime createdAt,
    required int repliesCount,
  }) = _CommentModel;

  factory CommentModel.fromJson(Map<String, dynamic> json) =>
      _$CommentModelFromJson(json);
}
