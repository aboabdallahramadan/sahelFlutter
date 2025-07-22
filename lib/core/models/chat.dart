import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat.freezed.dart';
part 'chat.g.dart';

@freezed
class Chat with _$Chat {
  const factory Chat({
    required String id,
    required List<Participant> participants,
    String? lastMessage,
    required DateTime lastMessageTime,
    required int unreadCount,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Chat;

  factory Chat.fromJson(Map<String, dynamic> json) => _$ChatFromJson(json);
}

@freezed
class Participant with _$Participant {
  const factory Participant({
    required String id,
    required String name,
    String? avatar,
  }) = _Participant;

  factory Participant.fromJson(Map<String, dynamic> json) =>
      _$ParticipantFromJson(json);
}

@freezed
class Message with _$Message {
  const factory Message({
    required String id,
    required String chatId,
    required String senderId,
    required String content,
    required DateTime timestamp,
    @Default(false) bool isRead,
  }) = _Message;

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);
}

@freezed
class ChatPreview with _$ChatPreview {
  const factory ChatPreview({
    required String id,
    required ChatUser otherUser,
    String? lastMessage,
    required DateTime lastMessageTime,
    required int unreadCount,
  }) = _ChatPreview;

  factory ChatPreview.fromJson(Map<String, dynamic> json) =>
      _$ChatPreviewFromJson(json);
}

@freezed
class ChatUser with _$ChatUser {
  const factory ChatUser({
    required String id,
    required String name,
    String? avatar,
  }) = _ChatUser;

  factory ChatUser.fromJson(Map<String, dynamic> json) =>
      _$ChatUserFromJson(json);
} 