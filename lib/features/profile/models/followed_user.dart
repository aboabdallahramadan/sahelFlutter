import 'package:freezed_annotation/freezed_annotation.dart';

part 'followed_user.freezed.dart';
part 'followed_user.g.dart';

@freezed
class FollowedUser with _$FollowedUser {
  const factory FollowedUser({
    required int id,
    required String name,
    required String phoneNumber,
    required String profilePhotoUrl,
  }) = _FollowedUser;

  factory FollowedUser.fromJson(Map<String, dynamic> json) =>
      _$FollowedUserFromJson(json);
}
