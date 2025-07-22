// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CategoryImpl _$$CategoryImplFromJson(Map<String, dynamic> json) =>
    _$CategoryImpl(
      id: json['id'] as String,
      nameKey: json['nameKey'] as String,
      icon: json['icon'] as String,
      color: json['color'] as String?,
      subcategoryKeys: (json['subcategoryKeys'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$CategoryImplToJson(_$CategoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nameKey': instance.nameKey,
      'icon': instance.icon,
      'color': instance.color,
      'subcategoryKeys': instance.subcategoryKeys,
    };
