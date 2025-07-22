import 'package:freezed_annotation/freezed_annotation.dart';

part 'ad_user.freezed.dart';
part 'ad_user.g.dart';

@freezed
class AdUser with _$AdUser {
  const factory AdUser({
    required String id,
    required String name,
    String? avatar,
    required String memberSince,
    String? phoneNumber,
  }) = _AdUser;

  factory AdUser.fromJson(Map<String, dynamic> json) =>
      _$AdUserFromJson(json);
} 