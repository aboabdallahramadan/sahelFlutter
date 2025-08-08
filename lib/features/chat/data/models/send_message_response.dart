import 'package:equatable/equatable.dart';
import 'chat_messages_response.dart';

class SendMessageResponse extends Equatable {
  final ChatMessage data;
  final bool success;
  final String message;
  final String? exception;
  final String? stackTrace;

  const SendMessageResponse({
    required this.data,
    required this.success,
    required this.message,
    this.exception,
    this.stackTrace,
  });

  factory SendMessageResponse.fromJson(Map<String, dynamic> json) {
    return SendMessageResponse(
      data: ChatMessage.fromJson(json['data'] as Map<String, dynamic>),
      success: json['success'] as bool? ?? false,
      message: json['message'] as String? ?? '',
      exception: json['exception'] as String? ?? '',
      stackTrace: json['stackTrace'] as String? ?? '',
    );
  }

  @override
  List<Object?> get props => [data, success, message, exception, stackTrace];
}
