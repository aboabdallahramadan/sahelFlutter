import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/models/ad_small.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../home/presentation/widgets/ad_card.dart';

class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    
    // Mock data - in real app this would come from a provider
    final favoriteAds = _getMockFavorites();

    return Scaffold(
      backgroundColor: AppColors.primaryBg,
      appBar: AppBar(
        title: Text(l10n.profileFavorites),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: favoriteAds.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.favorite_border,
                    size: 64,
                    color: AppColors.textTertiary,
                  ),
                  const SizedBox(height: AppConstants.spacing16),
                  Text(
                    'No favorites yet',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: AppConstants.spacing8),
                  Text(
                    'Start adding ads to your favorites',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.textTertiary,
                    ),
                  ),
                  const SizedBox(height: AppConstants.spacing24),
                  ElevatedButton(
                    onPressed: () {
                      context.goNamed('categories');
                    },
                    child: const Text('Browse Ads'),
                  ),
                ],
              ),
            )
          : Container(
              color: AppColors.backgroundWhite,
              child: GridView.builder(
                padding: const EdgeInsets.all(AppConstants.spacing16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: AppConstants.spacing12,
                  mainAxisSpacing: AppConstants.spacing12,
                  childAspectRatio: 0.75,
                ),
                itemCount: favoriteAds.length,
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      AdCard(ad: favoriteAds[index]),
                      Positioned(
                        top: 8,
                        right: 8,
                        child: CircleAvatar(
                          backgroundColor: AppColors.backgroundWhite,
                          radius: 18,
                          child: IconButton(
                            icon: const Icon(
                              Icons.favorite,
                              color: AppColors.error,
                              size: 20,
                            ),
                            onPressed: () {
                              // TODO: Remove from favorites
                            },
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
    );
  }

  List<AdSmall> _getMockFavorites() {
    return [
      const AdSmall(
        id: '1',
        title: 'iPhone 14 Pro Max 256GB',
        price: 4500,
        image: 'https://images.unsplash.com/photo-1696446701796-da61225697cc?w=400&h=400&fit=crop',
        comments: 5,
        likes: 15,
        location: 'Doha',
        timeAgo: '2 hours ago',
      ),
      const AdSmall(
        id: '3',
        title: '2 BHK Apartment for Rent',
        price: 5500,
        image: 'https://images.unsplash.com/photo-1522708323590-d24dbb6b0267?w=400&h=400&fit=crop',
        comments: 8,
        likes: 23,
        location: 'West Bay',
        timeAgo: '1 day ago',
      ),
    ];
  }
} 