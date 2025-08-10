// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'followed_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FollowedUserImpl _$$FollowedUserImplFromJson(Map<String, dynamic> json) =>
    _$FollowedUserImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      phoneNumber: json['phoneNumber'] as String,
      profilePhotoUrl: json['profilePhotoUrl'] as String,
    );

Map<String, dynamic> _$$FollowedUserImplToJson(_$FollowedUserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'profilePhotoUrl': instance.profilePhotoUrl,
    };
