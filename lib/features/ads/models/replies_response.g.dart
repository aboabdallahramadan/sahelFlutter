// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'replies_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RepliesResponseImpl _$$RepliesResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$RepliesResponseImpl(
      items: (json['items'] as List<dynamic>)
          .map((e) => CommentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      hasMore: json['hasMore'] as bool,
      nextCursor: (json['nextCursor'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$RepliesResponseImplToJson(
        _$RepliesResponseImpl instance) =>
    <String, dynamic>{
      'items': instance.items,
      'hasMore': instance.hasMore,
      'nextCursor': instance.nextCursor,
    };
