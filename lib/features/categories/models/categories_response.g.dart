// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CategoriesResponseImpl _$$CategoriesResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$CategoriesResponseImpl(
      items: (json['items'] as List<dynamic>)
          .map((e) => CategoryTreeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalCount: (json['totalCount'] as num).toInt(),
      page: (json['page'] as num).toInt(),
      pageSize: (json['pageSize'] as num).toInt(),
      totalPages: (json['totalPages'] as num).toInt(),
    );

Map<String, dynamic> _$$CategoriesResponseImplToJson(
        _$CategoriesResponseImpl instance) =>
    <String, dynamic>{
      'items': instance.items,
      'totalCount': instance.totalCount,
      'page': instance.page,
      'pageSize': instance.pageSize,
      'totalPages': instance.totalPages,
    };
