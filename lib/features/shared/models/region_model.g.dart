// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'region_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RegionModelImpl _$$RegionModelImplFromJson(Map<String, dynamic> json) =>
    _$RegionModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      parentId: (json['parentId'] as num?)?.toInt(),
      parentName: json['parentName'] as String?,
      hasSubRegions: json['hasSubRegions'] as bool,
    );

Map<String, dynamic> _$$RegionModelImplToJson(_$RegionModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'parentId': instance.parentId,
      'parentName': instance.parentName,
      'hasSubRegions': instance.hasSubRegions,
    };
