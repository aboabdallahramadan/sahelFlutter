// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ad.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdImpl _$$AdImplFromJson(Map<String, dynamic> json) => _$AdImpl(
      id: json['id'] as String,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      adDetails: AdDetails.fromJson(json['adDetails'] as Map<String, dynamic>),
      user: AdUser.fromJson(json['user'] as Map<String, dynamic>),
      comments: (json['comments'] as List<dynamic>)
          .map((e) => AdComment.fromJson(e as Map<String, dynamic>))
          .toList(),
      similarAds: (json['similarAds'] as List<dynamic>)
          .map((e) => AdSmall.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$AdImplToJson(_$AdImpl instance) => <String, dynamic>{
      'id': instance.id,
      'images': instance.images,
      'adDetails': instance.adDetails,
      'user': instance.user,
      'comments': instance.comments,
      'similarAds': instance.similarAds,
    };
