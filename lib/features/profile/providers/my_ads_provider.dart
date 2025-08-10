import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/config/app_config.dart';
import '../../../core/models/ad_small.dart';
import '../services/profile_service.dart';
import '../models/user_profile.dart';

// Provider for user profile data
final userProfileProvider = FutureProvider<UserProfile?>((ref) async {
  final profileService = ref.watch(profileServiceProvider);
  final result = await profileService.getCurrentUserProfile();

  if (result.success && result.data != null) {
    return result.data;
  }

  throw Exception(result.message);
});

// Provider for managing user's ads
final myAdsProvider = FutureProvider<List<AdSmall>>((ref) async {
  final userProfileAsync = await ref.watch(userProfileProvider.future);

  if (userProfileAsync == null) {
    return [];
  }

  // Convert ProfileOffer to AdSmall
  return userProfileAsync.offers.map((offer) {
    return AdSmall(
      id: offer.id.toString(),
      title: offer.name,
      price: offer.price,
      image: '${AppConfig.apiBaseUrl}/uploads/${offer.mainImageUrl}',
      comments: 0, // These values are not provided in the profile API
      likes: 0,
      location: offer.regionName,
      timeAgo: _formatTimeAgo(offer.createdAt),
    );
  }).toList();
});

String _formatTimeAgo(String dateString) {
  try {
    final date = DateTime.parse(dateString);
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays > 365) {
      final years = (difference.inDays / 365).floor();
      return '$years ${years == 1 ? 'year' : 'years'} ago';
    } else if (difference.inDays > 30) {
      final months = (difference.inDays / 30).floor();
      return '$months ${months == 1 ? 'month' : 'months'} ago';
    } else if (difference.inDays > 7) {
      final weeks = (difference.inDays / 7).floor();
      return '$weeks ${weeks == 1 ? 'week' : 'weeks'} ago';
    } else if (difference.inDays > 0) {
      return '${difference.inDays} ${difference.inDays == 1 ? 'day' : 'days'} ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} ${difference.inHours == 1 ? 'hour' : 'hours'} ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} ${difference.inMinutes == 1 ? 'minute' : 'minutes'} ago';
    } else {
      return 'Just now';
    }
  } catch (e) {
    return 'Recently';
  }
}

// Provider for ad statistics (could be used for dashboard)
final myAdsStatsProvider = Provider<Map<String, int>>((ref) {
  final adsAsyncValue = ref.watch(myAdsProvider);

  return adsAsyncValue.when(
    data: (ads) {
      int totalViews = 0;
      int totalLikes = 0;
      int totalComments = 0;

      for (final ad in ads) {
        totalLikes += ad.likes;
        totalComments += ad.comments;
        // Mock view count (in real app this would come from backend)
        totalViews += (ad.likes + ad.comments) * 3;
      }

      return {
        'totalAds': ads.length,
        'totalViews': totalViews,
        'totalLikes': totalLikes,
        'totalComments': totalComments,
      };
    },
    loading: () => {
      'totalAds': 0,
      'totalViews': 0,
      'totalLikes': 0,
      'totalComments': 0,
    },
    error: (_, __) => {
      'totalAds': 0,
      'totalViews': 0,
      'totalLikes': 0,
      'totalComments': 0,
    },
  );
});

// Provider for refreshing ads
final refreshMyAdsProvider = Provider<void Function()>((ref) {
  return () {
    ref.invalidate(myAdsProvider);
  };
});
