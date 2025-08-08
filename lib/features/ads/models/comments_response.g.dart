// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comments_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommentsResponseImpl _$$CommentsResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$CommentsResponseImpl(
      items: (json['items'] as List<dynamic>)
          .map((e) => CommentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      hasMore: json['hasMore'] as bool,
      nextCursor: (json['nextCursor'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$CommentsResponseImplToJson(
        _$CommentsResponseImpl instance) =>
    <String, dynamic>{
      'items': instance.items,
      'hasMore': instance.hasMore,
      'nextCursor': instance.nextCursor,
    };
