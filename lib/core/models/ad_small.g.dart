// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ad_small.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdSmallImpl _$$AdSmallImplFromJson(Map<String, dynamic> json) =>
    _$AdSmallImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      price: (json['price'] as num).toDouble(),
      image: json['image'] as String,
      comments: (json['comments'] as num).toInt(),
      likes: (json['likes'] as num).toInt(),
      location: json['location'] as String?,
      timeAgo: json['timeAgo'] as String?,
    );

Map<String, dynamic> _$$AdSmallImplToJson(_$AdSmallImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'price': instance.price,
      'image': instance.image,
      'comments': instance.comments,
      'likes': instance.likes,
      'location': instance.location,
      'timeAgo': instance.timeAgo,
    };
