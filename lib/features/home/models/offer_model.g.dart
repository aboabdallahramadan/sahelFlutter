// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OfferModelImpl _$$OfferModelImplFromJson(Map<String, dynamic> json) =>
    _$OfferModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      categoryId: (json['categoryId'] as num).toInt(),
      categoryName: json['categoryName'] as String,
      regionId: (json['regionId'] as num).toInt(),
      regionName: json['regionName'] as String,
      mainImageUrl: json['mainImageUrl'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      numberOfFavorites: (json['numberOfFavorites'] as num).toInt(),
      numberOfViews: (json['numberOfViews'] as num).toInt(),
      numberOfComments: (json['numberOfComments'] as num).toInt(),
    );

Map<String, dynamic> _$$OfferModelImplToJson(_$OfferModelImpl instance) =>
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
      'createdAt': instance.createdAt.toIso8601String(),
      'numberOfFavorites': instance.numberOfFavorites,
      'numberOfViews': instance.numberOfViews,
      'numberOfComments': instance.numberOfComments,
    };
