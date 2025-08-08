import 'package:equatable/equatable.dart';

class ChatMessagesResponse extends Equatable {
  final ChatMessagesData data;
  final bool success;
  final String message;
  final String? exception;
  final String? stackTrace;

  const ChatMessagesResponse({
    required this.data,
    required this.success,
    required this.message,
    this.exception,
    this.stackTrace,
  });

  factory ChatMessagesResponse.fromJson(Map<String, dynamic> json) {
    return ChatMessagesResponse(
      data: ChatMessagesData.fromJson(json['data'] as Map<String, dynamic>),
      success: json['success'] as bool? ?? false,
      message: json['message'] as String? ?? '',
      exception: json['exception'] as String? ?? '',
      stackTrace: json['stackTrace'] as String? ?? '',
    );
  }

  @override
  List<Object?> get props => [data, success, message, exception, stackTrace];
}

class ChatMessagesData extends Equatable {
  final List<ChatMessage> messages;
  final bool hasMore;
  final int? lastMessageId;

  const ChatMessagesData({
    required this.messages,
    required this.hasMore,
    this.lastMessageId,
  });

  factory ChatMessagesData.fromJson(Map<String, dynamic> json) {
    return ChatMessagesData(
      messages: (json['messages'] as List<dynamic>?)
              ?.map((e) => ChatMessage.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      hasMore: json['hasMore'] as bool? ?? false,
      lastMessageId: json['lastMessageId'] as int?,
    );
  }

  @override
  List<Object?> get props => [messages, hasMore, lastMessageId];
}

class ChatMessage extends Equatable {
  final int id;
  final String message;
  final DateTime date;
  final int senderId;
  final int receiverId;
  final bool isRead;
  final DateTime? readDate;

  const ChatMessage({
    required this.id,
    required this.message,
    required this.date,
    required this.senderId,
    required this.receiverId,
    required this.isRead,
    this.readDate,
  });

  factory ChatMessage.fromJson(Map<String, dynamic> json) {
    return ChatMessage(
      id: json['id'] as int,
      message: json['message'] as String,
      date: DateTime.parse(json['date'] as String),
      senderId: json['senderId'] as int,
      receiverId: json['receiverId'] as int,
      isRead: json['isRead'] as bool,
      readDate: json['readDate'] != null
          ? DateTime.parse(json['readDate'] as String)
          : null,
    );
  }

  @override
  List<Object?> get props =>
      [id, message, date, senderId, receiverId, isRead, readDate];
}
