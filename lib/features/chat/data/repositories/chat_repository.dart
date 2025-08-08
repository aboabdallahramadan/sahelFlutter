import 'dart:convert';
import 'package:dio/dio.dart';
import '../../../../core/services/api_service.dart';
import '../models/chat_list_response.dart';
import '../models/chat_messages_response.dart';
import '../models/send_message_request.dart';
import '../models/send_message_response.dart';

abstract class ChatRepository {
  Future<ChatListResponse> getMyChats();
  Future<ChatMessagesResponse> getChatMessages(int chatId);
  Future<SendMessageResponse> sendMessage(
    int chatId,
    SendMessageRequest request,
  );
}

class ChatRepositoryImpl implements ChatRepository {
  final ApiService _apiService;

  ChatRepositoryImpl(this._apiService);

  @override
  Future<ChatListResponse> getMyChats() async {
    try {
      final response = await _apiService.dio.get('/api/Chat/my-chats');

      if (response.statusCode == 200) {
        return ChatListResponse.fromJson(response.data);
      }

      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
        message: 'Failed to fetch chats',
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ChatMessagesResponse> getChatMessages(int chatId) async {
    try {
      final response = await _apiService.dio.get('/api/Chat/$chatId/messages');

      if (response.statusCode == 200) {
        return ChatMessagesResponse.fromJson(response.data);
      }

      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
        message: 'Failed to fetch messages',
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<SendMessageResponse> sendMessage(
    int chatId,
    SendMessageRequest request,
  ) async {
    try {
      final response = await _apiService.dio.post(
        '/api/Chat/$chatId/send',
        data: json.encode(request.toJson()),
      );

      if (response.statusCode == 200) {
        return SendMessageResponse.fromJson(response.data);
      }

      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
        message: 'Failed to send message',
      );
    } catch (e) {
      rethrow;
    }
  }
}
