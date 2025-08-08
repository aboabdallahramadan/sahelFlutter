import 'package:equatable/equatable.dart';

class SendMessageRequest extends Equatable {
  final String message;

  const SendMessageRequest({
    required this.message,
  });

  Map<String, dynamic> toJson() {
    return {
      'message': message,
    };
  }

  @override
  List<Object?> get props => [message];
}
