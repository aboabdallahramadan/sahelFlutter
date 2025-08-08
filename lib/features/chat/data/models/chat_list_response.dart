import 'package:equatable/equatable.dart';

class ChatListResponse extends Equatable {
  final List<ChatListItem> data;
  final bool success;
  final String message;
  final String? exception;
  final String? stackTrace;

  const ChatListResponse({
    required this.data,
    required this.success,
    required this.message,
    this.exception,
    this.stackTrace,
  });

  factory ChatListResponse.fromJson(Map<String, dynamic> json) {
    return ChatListResponse(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => ChatListItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      success: json['success'] as bool? ?? false,
      message: json['message'] as String? ?? '',
      exception: json['exception'] as String? ?? '',
      stackTrace: json['stackTrace'] as String? ?? '',
    );
  }

  @override
  List<Object?> get props => [data, success, message, exception, stackTrace];
}

class ChatListItem extends Equatable {
  final int id;
  final ChatUserInfo user;

  const ChatListItem({
    required this.id,
    required this.user,
  });

  factory ChatListItem.fromJson(Map<String, dynamic> json) {
    return ChatListItem(
      id: json['id'] as int,
      user: ChatUserInfo.fromJson(json['user'] as Map<String, dynamic>),
    );
  }

  @override
  List<Object?> get props => [id, user];
}

class ChatUserInfo extends Equatable {
  final int id;
  final String name;
  final String phoneNumber;
  final String profilePhotoUrl;

  const ChatUserInfo({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.profilePhotoUrl,
  });

  factory ChatUserInfo.fromJson(Map<String, dynamic> json) {
    return ChatUserInfo(
      id: json['id'] as int,
      name: json['name'] as String,
      phoneNumber: json['phoneNumber'] as String,
      profilePhotoUrl: json['profilePhotoUrl'] as String,
    );
  }

  @override
  List<Object?> get props => [id, name, phoneNumber, profilePhotoUrl];
}
