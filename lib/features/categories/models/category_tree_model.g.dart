// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_tree_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CategoryTreeModelImpl _$$CategoryTreeModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CategoryTreeModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String,
      subCategories: (json['subCategories'] as List<dynamic>?)
              ?.map((e) => SubCategoryModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$CategoryTreeModelImplToJson(
        _$CategoryTreeModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'subCategories': instance.subCategories,
    };

_$SubCategoryModelImpl _$$SubCategoryModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SubCategoryModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String,
    );

Map<String, dynamic> _$$SubCategoryModelImplToJson(
        _$SubCategoryModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
    };
