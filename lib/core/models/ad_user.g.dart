// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ad_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdUserImpl _$$AdUserImplFromJson(Map<String, dynamic> json) => _$AdUserImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      avatar: json['avatar'] as String?,
      memberSince: json['memberSince'] as String,
      phoneNumber: json['phoneNumber'] as String?,
    );

Map<String, dynamic> _$$AdUserImplToJson(_$AdUserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'avatar': instance.avatar,
      'memberSince': instance.memberSince,
      'phoneNumber': instance.phoneNumber,
    };
