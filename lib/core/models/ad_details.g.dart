// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ad_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdDetailsImpl _$$AdDetailsImplFromJson(Map<String, dynamic> json) =>
    _$AdDetailsImpl(
      title: json['title'] as String,
      price: (json['price'] as num).toDouble(),
      category: json['category'] as String,
      subcategory: json['subcategory'] as String,
      location: json['location'] as String,
      timeAgo: json['timeAgo'] as String,
      extraInfo: (json['extraInfo'] as List<dynamic>)
          .map((e) => ExtraInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      likes: (json['likes'] as num).toInt(),
      views: (json['views'] as num).toInt(),
      description: json['description'] as String,
    );

Map<String, dynamic> _$$AdDetailsImplToJson(_$AdDetailsImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'price': instance.price,
      'category': instance.category,
      'subcategory': instance.subcategory,
      'location': instance.location,
      'timeAgo': instance.timeAgo,
      'extraInfo': instance.extraInfo,
      'likes': instance.likes,
      'views': instance.views,
      'description': instance.description,
    };
