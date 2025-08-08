import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_creation_response.freezed.dart';
part 'chat_creation_response.g.dart';

@freezed
class ChatCreationResponse with _$ChatCreationResponse {
  const factory ChatCreationResponse({
    required int id,
    required ChatUser user,
  }) = _ChatCreationResponse;

  factory ChatCreationResponse.fromJson(Map<String, dynamic> json) =>
      _$ChatCreationResponseFromJson(json);
}

@freezed
class ChatUser with _$ChatUser {
  const factory ChatUser({
    required int id,
    required String name,
    required String phoneNumber,
    required String profilePhotoUrl,
  }) = _ChatUser;

  factory ChatUser.fromJson(Map<String, dynamic> json) =>
      _$ChatUserFromJson(json);
}
