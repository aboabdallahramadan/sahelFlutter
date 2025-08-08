// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ad_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdDetailResponseImpl _$$AdDetailResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$AdDetailResponseImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      categoryId: (json['categoryId'] as num).toInt(),
      categoryName: json['categoryName'] as String,
      regionId: (json['regionId'] as num).toInt(),
      regionName: json['regionName'] as String,
      mainImageUrl: json['mainImageUrl'] as String,
      additionalImages: (json['additionalImages'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      createdAt: DateTime.parse(json['createdAt'] as String),
      isActive: json['isActive'] as bool,
      providerId: (json['providerId'] as num).toInt(),
      providerName: json['providerName'] as String,
      providerPhoneNumber: json['providerPhoneNumber'] as String,
      providerProfilePhotoUrl: json['providerProfilePhotoUrl'] as String,
      providerCreatedAt: json['providerCreatedAt'] as String,
      isFavorite: json['isFavorite'] as bool,
      numberOfFavorites: (json['numberOfFavorites'] as num).toInt(),
      numberOfViews: (json['numberOfViews'] as num).toInt(),
      providerIsFollowed: json['providerIsFollowed'] as bool,
    );

Map<String, dynamic> _$$AdDetailResponseImplToJson(
        _$AdDetailResponseImpl instance) =>
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
      'additionalImages': instance.additionalImages,
      'createdAt': instance.createdAt.toIso8601String(),
      'isActive': instance.isActive,
      'providerId': instance.providerId,
      'providerName': instance.providerName,
      'providerPhoneNumber': instance.providerPhoneNumber,
      'providerProfilePhotoUrl': instance.providerProfilePhotoUrl,
      'providerCreatedAt': instance.providerCreatedAt,
      'isFavorite': instance.isFavorite,
      'numberOfFavorites': instance.numberOfFavorites,
      'numberOfViews': instance.numberOfViews,
      'providerIsFollowed': instance.providerIsFollowed,
    };
