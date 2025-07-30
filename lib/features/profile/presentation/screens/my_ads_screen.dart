import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/models/ad_small.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../home/presentation/widgets/ad_card.dart';
import '../../providers/my_ads_provider.dart';

class MyAdsScreen extends ConsumerWidget {
  const MyAdsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
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

          return _buildAdsList(ads);
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
                onPressed: () => ref.refresh(myAdsProvider),
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
    return RefreshIndicator(
      onRefresh: () async {
        // Refresh the ads list
        // In a real app, this would trigger a network request
      },
      child: ListView.builder(
        padding: EdgeInsets.all(AppConstants.spacing16),
        itemCount: ads.length,
        itemBuilder: (context, index) {
          final ad = ads[index];
          return Padding(
            padding: EdgeInsets.only(bottom: AppConstants.spacing16),
            child: _buildMyAdCard(ad),
          );
        },
      ),
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
              AdCard(ad: ad),
            ],
          ),
          // Action buttons
          Padding(
            padding: EdgeInsets.all(AppConstants.spacing12),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {
                      // Edit ad functionality
                    },
                    icon: Icon(Icons.edit, size: 16.r),
                    label: Text('Edit'),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: AppColors.primaryAccent),
                      foregroundColor: AppColors.primaryAccent,
                    ),
                  ),
                ),
                SizedBox(width: AppConstants.spacing8),
                SizedBox(width: AppConstants.spacing8),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {
                      // Delete ad functionality
                      _showDeleteDialog(ad);
                    },
                    icon: Icon(Icons.delete, size: 16.r),
                    label: Text('Delete'),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.red),
                      foregroundColor: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showDeleteDialog(AdSmall ad) {
    // Implementation for delete confirmation dialog
    // This would be implemented when delete functionality is added
  }
}
