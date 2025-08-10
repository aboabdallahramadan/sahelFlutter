import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/user_profile.dart';
import '../services/profile_service.dart';

// Provider for individual user profile
final individualUserProfileProvider =
    FutureProvider.family<UserProfile?, int>((ref, userId) async {
  final profileService = ref.watch(profileServiceProvider);
  final result = await profileService.getUserProfile(userId);

  if (result.success && result.data != null) {
    return result.data;
  }

  throw Exception(result.message);
});
