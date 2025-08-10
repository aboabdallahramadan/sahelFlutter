import 'package:freezed_annotation/freezed_annotation.dart';
import 'followed_user.dart';
import 'profile_offer.dart';

part 'user_profile.freezed.dart';
part 'user_profile.g.dart';

@freezed
class UserProfile with _$UserProfile {
  const factory UserProfile({
    required int id,
    required String name,
    required String phoneNumber,
    int? userType,
    required String profilePhotoUrl,
    String? memberSince,
    int? offersCount,
    int? followersCount,
    int? followingCount,
    @Default([]) List<FollowedUser> followedUsers,
    @Default([]) List<ProfileOffer> offers,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);
}
