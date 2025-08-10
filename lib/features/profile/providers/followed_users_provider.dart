import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/followed_user.dart';
import '../services/profile_service.dart';
import 'my_ads_provider.dart';

// Provider for followed users
final followedUsersProvider = FutureProvider<List<FollowedUser>>((ref) async {
  final userProfileAsync = await ref.watch(userProfileProvider.future);

  if (userProfileAsync == null) {
    return [];
  }

  return userProfileAsync.followedUsers;
});

// Provider for managing follow state - only stores loading/error states
final followStateProvider =
    StateProvider.family<AsyncValue<bool>, int>((ref, userId) {
  return const AsyncValue.data(false);
});

// Provider to check if a user is being followed
final isFollowingProvider = Provider.family<bool, int>((ref, userId) {
  final followedUsersAsync = ref.watch(followedUsersProvider);

  return followedUsersAsync.maybeWhen(
    data: (users) => users.any((user) => user.id == userId),
    orElse: () => false,
  );
});

// Function to toggle follow state - this is called manually
Future<void> toggleFollowUser(WidgetRef ref, int userId) async {
  final stateController = ref.read(followStateProvider(userId).notifier);

  // Set loading state
  stateController.state = const AsyncValue.loading();

  try {
    final profileService = ref.read(profileServiceProvider);
    final result = await profileService.toggleFollowUser(userId);

    if (result.success) {
      // Refresh the user profile to get updated followed users list
      ref.invalidate(userProfileProvider);
      stateController.state = const AsyncValue.data(true);
    } else {
      stateController.state = AsyncValue.error(
        Exception(result.message),
        StackTrace.current,
      );
    }
  } catch (e, stack) {
    stateController.state = AsyncValue.error(e, stack);
  }
}
