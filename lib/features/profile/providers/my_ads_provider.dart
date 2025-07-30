import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/models/ad_small.dart';

// Provider for managing user's ads
final myAdsProvider = FutureProvider<List<AdSmall>>((ref) async {
  // Simulate network delay
  await Future.delayed(const Duration(milliseconds: 800));

  // Mock data for user's ads
  return [
    const AdSmall(
      id: 'user_ad_1',
      title: 'iPhone 14 Pro Max - Excellent Condition',
      price: 3500.0,
      image:
          'https://images.unsplash.com/photo-1592750475338-74b7b21085ab?w=400',
      comments: 12,
      likes: 25,
      location: 'Doha, Qatar',
      timeAgo: '2 days ago',
    ),
    const AdSmall(
      id: 'user_ad_2',
      title: 'MacBook Air M2 - Like New',
      price: 4200.0,
      image: 'https://images.unsplash.com/photo-1541807084-5c52b6b3adef?w=400',
      comments: 8,
      likes: 18,
      location: 'Al Rayyan, Qatar',
      timeAgo: '5 days ago',
    ),
    const AdSmall(
      id: 'user_ad_3',
      title: 'Toyota Camry 2023 - Low Mileage',
      price: 85000.0,
      image: 'https://images.unsplash.com/photo-1549924231-f129b911e442?w=400',
      comments: 15,
      likes: 32,
      location: 'Lusail, Qatar',
      timeAgo: '1 week ago',
    ),
    const AdSmall(
      id: 'user_ad_4',
      title: 'Samsung 75" Smart TV - Perfect for Home',
      price: 2800.0,
      image:
          'https://images.unsplash.com/photo-1593359677879-a4bb92f829d1?w=400',
      comments: 6,
      likes: 14,
      location: 'West Bay, Qatar',
      timeAgo: '2 weeks ago',
    ),
    const AdSmall(
      id: 'user_ad_5',
      title: 'Gaming Setup - RTX 4080, i9 Processor',
      price: 12000.0,
      image:
          'https://images.unsplash.com/photo-1587831990711-23ca6441447b?w=400',
      comments: 22,
      likes: 45,
      location: 'Al Wakrah, Qatar',
      timeAgo: '3 weeks ago',
    ),
  ];
});

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
