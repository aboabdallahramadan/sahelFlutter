// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ad_comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdCommentImpl _$$AdCommentImplFromJson(Map<String, dynamic> json) =>
    _$AdCommentImpl(
      id: json['id'] as String,
      user: CommentUser.fromJson(json['user'] as Map<String, dynamic>),
      comment: json['comment'] as String,
      timeAgo: json['timeAgo'] as String,
    );

Map<String, dynamic> _$$AdCommentImplToJson(_$AdCommentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'comment': instance.comment,
      'timeAgo': instance.timeAgo,
    };

_$CommentUserImpl _$$CommentUserImplFromJson(Map<String, dynamic> json) =>
    _$CommentUserImpl(
      name: json['name'] as String,
      avatar: json['avatar'] as String?,
    );

Map<String, dynamic> _$$CommentUserImplToJson(_$CommentUserImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'avatar': instance.avatar,
    };
