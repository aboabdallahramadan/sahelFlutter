import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/models/ad_small.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/widgets/refresh_wrapper.dart';
import '../../../home/presentation/widgets/ad_card.dart';
import '../../providers/my_ads_provider.dart';
import '../../../auth/providers/auth_provider.dart';

class MyAdsScreen extends ConsumerWidget {
  const MyAdsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final authState = ref.watch(authProvider);

    // Redirect to login if not authenticated
    if (!authState.isAuthenticated) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.goNamed('login');
      });
      return const Center(child: CircularProgressIndicator());
    }

    final myAdsAsync = ref.watch(myAdsProvider);

    return Scaffold(
      backgroundColor: AppColors.primaryBg,
      appBar: AppBar(
        title: Text(l10n.profileMyAds),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.goNamed('profile'),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              context.goNamed('postAd');
            },
            tooltip: l10n.navPostAd,
          ),
        ],
      ),
      body: myAdsAsync.when(
        data: (ads) {
          if (ads.isEmpty) {
            return _buildEmptyState(context, l10n);
          }

          return RefreshWrapper(
            onRefresh: () async {
              // Refresh the my ads list by invalidating the profile provider
              // This will cascade and refresh myAdsProvider as it depends on userProfileProvider
              ref.invalidate(userProfileProvider);
            },
            child: _buildAdsList(ads),
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline,
                size: 64.r,
                color: AppColors.textTertiary,
              ),
              SizedBox(height: AppConstants.spacing16),
              Text(
                'Error loading ads',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: AppConstants.spacing8),
              Text(
                error.toString(),
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColors.textTertiary,
                    ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: AppConstants.spacing16),
              ElevatedButton(
                onPressed: () => ref.invalidate(userProfileProvider),
                child: Text('Try Again'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context, AppLocalizations l10n) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(AppConstants.spacing24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.post_add_outlined,
              size: 80.r,
              color: AppColors.textTertiary,
            ),
            SizedBox(height: AppConstants.spacing24),
            Text(
              'No Ads Yet',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(height: AppConstants.spacing8),
            Text(
              'You haven\'t posted any ads yet. Start sharing your items with the community!',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.textSecondary,
                  ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: AppConstants.spacing32),
            ElevatedButton.icon(
              onPressed: () {
                context.goNamed('postAd');
              },
              icon: const Icon(Icons.add),
              label: Text(l10n.navPostAd),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryAccent,
                padding: EdgeInsets.symmetric(
                  horizontal: AppConstants.spacing24,
                  vertical: AppConstants.spacing12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAdsList(List<AdSmall> ads) {
    return ListView.builder(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: EdgeInsets.all(AppConstants.spacing16),
      itemCount: ads.length,
      itemBuilder: (context, index) {
        final ad = ads[index];
        return Padding(
          padding: EdgeInsets.only(bottom: AppConstants.spacing16),
          child: _buildMyAdCard(ad),
        );
      },
    );
  }

  Widget _buildMyAdCard(AdSmall ad) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.backgroundWhite,
        borderRadius: BorderRadius.circular(AppConstants.radiusLargeR),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowLight,
            blurRadius: 4.r,
            offset: Offset(0, 2.h),
          ),
        ],
      ),
      child: Column(
        children: [
          // Ad Card with custom overlay for my ads
          Stack(
            children: [
              AdCard(
                ad: AdSmall(
                  id: ad.id,
                  title: ad.title,
                  price: ad.price,
                  image: ad.image,
                  comments: ad.comments,
                  likes: ad.likes,
                  location: ad.location,
                  timeAgo: ad.timeAgo,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
