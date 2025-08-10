// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_offer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileOfferImpl _$$ProfileOfferImplFromJson(Map<String, dynamic> json) =>
    _$ProfileOfferImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      categoryId: (json['categoryId'] as num).toInt(),
      categoryName: json['categoryName'] as String,
      regionId: (json['regionId'] as num).toInt(),
      regionName: json['regionName'] as String,
      mainImageUrl: json['mainImageUrl'] as String,
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$$ProfileOfferImplToJson(_$ProfileOfferImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'categoryId': instance.categoryId,
      'categoryName': instance.categoryName,
      'regionId': instance.regionId,
      'regionName': instance.regionName,
      'mainImageUrl': instance.mainImageUrl,
      'createdAt': instance.createdAt,
    };
