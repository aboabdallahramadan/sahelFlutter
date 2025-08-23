import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import '../../../../core/services/api_service.dart';
import '../../data/repositories/chat_repository.dart';
import '../../data/models/chat_list_response.dart';
import '../../data/models/chat_messages_response.dart';
import '../../data/models/send_message_request.dart';

// Repository provider
final chatRepositoryProvider = Provider<ChatRepository>((ref) {
  final apiService = ref.watch(apiServiceProvider);
  return ChatRepositoryImpl(apiService);
});

// State for chat list
class ChatListState {
  final bool isLoading;
  final List<ChatListItem> chats;
  final String? error;

  const ChatListState({
    this.isLoading = false,
    this.chats = const [],
    this.error,
  });

  ChatListState copyWith({
    bool? isLoading,
    List<ChatListItem>? chats,
    String? error,
  }) {
    return ChatListState(
      isLoading: isLoading ?? this.isLoading,
      chats: chats ?? this.chats,
      error: error,
    );
  }
}

// Chat list provider
final chatListProvider =
    StateNotifierProvider<ChatListNotifier, ChatListState>((ref) {
  final repository = ref.watch(chatRepositoryProvider);
  return ChatListNotifier(repository);
});

class ChatListNotifier extends StateNotifier<ChatListState> {
  final ChatRepository _repository;

  ChatListNotifier(this._repository) : super(const ChatListState());

  Future<void> loadChats() async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final response = await _repository.getMyChats();

      if (response.success) {
        state = state.copyWith(
          isLoading: false,
          chats: response.data,
        );
      } else {
        state = state.copyWith(
          isLoading: false,
          error: response.message,
        );
      }
    } on DioException catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.response?.data['message'] ?? 'Network error occurred',
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  void clearError() {
    state = state.copyWith(error: null);
  }

  void addOrUpdateChat(ChatListItem chat) {
    // Check if chat already exists
    final existingIndex = state.chats.indexWhere((c) => c.id == chat.id);

    if (existingIndex != -1) {
      // Update existing chat
      final updatedChats = List<ChatListItem>.from(state.chats);
      updatedChats[existingIndex] = chat;
      state = state.copyWith(chats: updatedChats);
    } else {
      // Add new chat at the beginning
      state = state.copyWith(chats: [chat, ...state.chats]);
    }
  }
}

// State for chat messages
class ChatMessagesState {
  final bool isLoading;
  final List<ChatMessage> messages;
  final bool hasMore;
  final int? lastMessageId;
  final String? error;
  final bool isSending;

  const ChatMessagesState({
    this.isLoading = false,
    this.messages = const [],
    this.hasMore = false,
    this.lastMessageId,
    this.error,
    this.isSending = false,
  });

  ChatMessagesState copyWith({
    bool? isLoading,
    List<ChatMessage>? messages,
    bool? hasMore,
    int? lastMessageId,
    String? error,
    bool? isSending,
  }) {
    return ChatMessagesState(
      isLoading: isLoading ?? this.isLoading,
      messages: messages ?? this.messages,
      hasMore: hasMore ?? this.hasMore,
      lastMessageId: lastMessageId ?? this.lastMessageId,
      error: error,
      isSending: isSending ?? this.isSending,
    );
  }
}

// Chat messages provider (family provider for different chat IDs)
final chatMessagesProvider =
    StateNotifierProvider.family<ChatMessagesNotifier, ChatMessagesState, int>(
        (ref, chatId) {
  final repository = ref.watch(chatRepositoryProvider);
  return ChatMessagesNotifier(repository, chatId);
});

class ChatMessagesNotifier extends StateNotifier<ChatMessagesState> {
  final ChatRepository _repository;
  final int _chatId;

  ChatMessagesNotifier(this._repository, this._chatId)
      : super(const ChatMessagesState());

  Future<void> loadMessages() async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final response = await _repository.getChatMessages(_chatId);

      if (response.success) {
        // Sort messages from older to newer (ascending order by date)
        final sortedMessages = List<ChatMessage>.from(response.data.messages)
          ..sort((a, b) => a.date.compareTo(b.date));

        state = state.copyWith(
          isLoading: false,
          messages: sortedMessages,
          hasMore: response.data.hasMore,
          lastMessageId: response.data.lastMessageId,
        );
      } else {
        state = state.copyWith(
          isLoading: false,
          error: response.message,
        );
      }
    } on DioException catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.response?.data['message'] ?? 'Network error occurred',
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  Future<void> sendMessage(String message) async {
    if (message.trim().isEmpty || state.isSending) return;

    state = state.copyWith(isSending: true, error: null);

    try {
      final request = SendMessageRequest(message: message.trim());
      final response = await _repository.sendMessage(_chatId, request);

      if (response.success) {
        // Add the new message to the list and ensure it's sorted
        final updatedMessages = [...state.messages, response.data]
          ..sort((a, b) => a.date.compareTo(b.date));

        state = state.copyWith(
          isSending: false,
          messages: updatedMessages,
        );
      } else {
        state = state.copyWith(
          isSending: false,
          error: response.message,
        );
      }
    } on DioException catch (e) {
      state = state.copyWith(
        isSending: false,
        error: e.response?.data['message'] ?? 'Failed to send message',
      );
    } catch (e) {
      state = state.copyWith(
        isSending: false,
        error: e.toString(),
      );
    }
  }

  void clearError() {
    state = state.copyWith(error: null);
  }
}
