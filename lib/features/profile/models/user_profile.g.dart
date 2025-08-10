// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserProfileImpl _$$UserProfileImplFromJson(Map<String, dynamic> json) =>
    _$UserProfileImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      phoneNumber: json['phoneNumber'] as String,
      userType: (json['userType'] as num?)?.toInt(),
      profilePhotoUrl: json['profilePhotoUrl'] as String,
      memberSince: json['memberSince'] as String?,
      offersCount: (json['offersCount'] as num?)?.toInt(),
      followersCount: (json['followersCount'] as num?)?.toInt(),
      followingCount: (json['followingCount'] as num?)?.toInt(),
      followedUsers: (json['followedUsers'] as List<dynamic>?)
              ?.map((e) => FollowedUser.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      offers: (json['offers'] as List<dynamic>?)
              ?.map((e) => ProfileOffer.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$UserProfileImplToJson(_$UserProfileImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'userType': instance.userType,
      'profilePhotoUrl': instance.profilePhotoUrl,
      'memberSince': instance.memberSince,
      'offersCount': instance.offersCount,
      'followersCount': instance.followersCount,
      'followingCount': instance.followingCount,
      'followedUsers': instance.followedUsers,
      'offers': instance.offers,
    };
