// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommentRequestImpl _$$CommentRequestImplFromJson(Map<String, dynamic> json) =>
    _$CommentRequestImpl(
      comment: json['comment'] as String,
      replyToCommentId: (json['replyToCommentId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$CommentRequestImplToJson(
        _$CommentRequestImpl instance) =>
    <String, dynamic>{
      'comment': instance.comment,
      'replyToCommentId': instance.replyToCommentId,
    };
