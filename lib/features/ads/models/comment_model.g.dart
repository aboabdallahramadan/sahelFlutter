// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommentModelImpl _$$CommentModelImplFromJson(Map<String, dynamic> json) =>
    _$CommentModelImpl(
      id: (json['id'] as num).toInt(),
      comment: json['comment'] as String,
      offerId: (json['offerId'] as num).toInt(),
      userId: (json['userId'] as num).toInt(),
      userName: json['userName'] as String,
      userProfilePhotoUrl: json['userProfilePhotoUrl'] as String,
      replyToCommentId: (json['replyToCommentId'] as num?)?.toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      repliesCount: (json['repliesCount'] as num).toInt(),
    );

Map<String, dynamic> _$$CommentModelImplToJson(_$CommentModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'comment': instance.comment,
      'offerId': instance.offerId,
      'userId': instance.userId,
      'userName': instance.userName,
      'userProfilePhotoUrl': instance.userProfilePhotoUrl,
      'replyToCommentId': instance.replyToCommentId,
      'createdAt': instance.createdAt.toIso8601String(),
      'repliesCount': instance.repliesCount,
    };
