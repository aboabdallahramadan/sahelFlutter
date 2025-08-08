// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_creation_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatCreationResponseImpl _$$ChatCreationResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ChatCreationResponseImpl(
      id: (json['id'] as num).toInt(),
      user: ChatUser.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ChatCreationResponseImplToJson(
        _$ChatCreationResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
    };

_$ChatUserImpl _$$ChatUserImplFromJson(Map<String, dynamic> json) =>
    _$ChatUserImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      phoneNumber: json['phoneNumber'] as String,
      profilePhotoUrl: json['profilePhotoUrl'] as String,
    );

Map<String, dynamic> _$$ChatUserImplToJson(_$ChatUserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'profilePhotoUrl': instance.profilePhotoUrl,
    };
