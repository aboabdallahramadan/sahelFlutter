import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../l10n/app_localizations.dart';
import '../widgets/ad_images_gallery.dart';
import '../widgets/ad_info_section.dart';
import '../widgets/user_profile_card.dart';
import '../widgets/similar_ads_section.dart';
import '../widgets/comments_section.dart';
import '../../providers/ad_details_provider.dart';
import '../../../auth/providers/auth_provider.dart';
import '../../../chat/services/chat_service.dart';

class AdDetailsScreen extends ConsumerWidget {
  final String adId;

  const AdDetailsScreen({super.key, required this.adId});

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      // Handle error - show snackbar or dialog
      debugPrint('Could not launch phone call to $phoneNumber');
    }
  }

  Future<void> _navigateToChat(
      BuildContext context, WidgetRef ref, int providerId) async {
    // Check if user is authenticated
    final authState = ref.read(authProvider);
    if (!authState.isAuthenticated) {
      context.goNamed('login');
      return;
    }

    try {
      final chatService = ref.read(chatServiceProvider);
      final response = await chatService.createOrGetChat(providerId);

      if (response.success && response.data != null && context.mounted) {
        context.goNamed('chat', pathParameters: {
          'chatId': response.data!.id.toString(),
        });
      } else if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(response.message),
            backgroundColor: AppColors.error,
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: ${e.toString()}'),
            backgroundColor: AppColors.error,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final authState = ref.watch(authProvider);
    final adDetailsAsync = ref.watch(adDetailsProvider(int.parse(adId)));
    final isFavorite = ref.watch(favoriteNotifierProvider(int.parse(adId)));

    return Scaffold(
      backgroundColor: AppColors.primaryBg,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        actions: adDetailsAsync.maybeWhen(
          data: (adDetails) {
            if (adDetails == null) return [];
            final isMyAd = authState.user?.id == adDetails.providerId;
            if (isMyAd) return [];

            return [
              IconButton(
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite ? AppColors.error : null,
                ),
                onPressed: () async {
                  // Check if user is authenticated first
                  final authState = ref.read(authProvider);
                  if (!authState.isAuthenticated) {
                    context.goNamed('login');
                    return;
                  }

                  try {
                    await ref
                        .read(
                            favoriteNotifierProvider(int.parse(adId)).notifier)
                        .toggleFavorite();
                  } catch (e) {
                    // If we get here with a 401, the interceptor should have redirected
                    // but just in case, let's handle it
                    if (e.toString().contains('401')) {
                      if (context.mounted) {
                        context.goNamed('login');
                      }
                    }
                  }
                },
              ),
            ];
          },
          orElse: () => [],
        ),
      ),
      body: adDetailsAsync.when(
        data: (adDetails) {
          if (adDetails == null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    size: 64,
                    color: AppColors.textTertiary,
                  ),
                  const SizedBox(height: AppConstants.spacing16),
                  Text(
                    l10n.commonAdNotFound,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
            );
          }

          return SingleChildScrollView(
            child: Column(
              children: [
                // Image Gallery
                AdImagesGallery(adDetails: adDetails),

                Container(
                  color: AppColors.backgroundWhite,
                  child: Column(
                    children: [
                      // Ad Information
                      AdInfoSection(adDetails: adDetails),

                      const Divider(),

                      // User Profile Card
                      UserProfileCard(adDetails: adDetails),

                      const Divider(),

                      // Similar Ads
                      SimilarAdsSection(categoryId: adDetails.categoryId),

                      const Divider(),

                      // Comments Section
                      CommentsSection(offerId: adDetails.id),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(
            color: AppColors.primaryAccent,
          ),
        ),
        error: (error, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline,
                size: 64,
                color: AppColors.error,
              ),
              const SizedBox(height: AppConstants.spacing16),
              Text(
                l10n.commonErrorLoadingAd,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: AppConstants.spacing8),
              Text(
                error.toString(),
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.textSecondary,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppConstants.spacing24),
              ElevatedButton.icon(
                onPressed: () {
                  ref.invalidate(adDetailsProvider(int.parse(adId)));
                },
                icon: const Icon(Icons.refresh),
                label: Text(l10n.commonRetry),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: adDetailsAsync.maybeWhen(
        data: (adDetails) {
          if (adDetails == null) return null;

          final isMyAd = authState.user?.id == adDetails.providerId;
          if (isMyAd) return null; // Hide buttons for own ads

          return Container(
            padding: const EdgeInsets.all(AppConstants.spacing16),
            decoration: BoxDecoration(
              color: AppColors.backgroundWhite,
              boxShadow: [
                BoxShadow(
                  color: AppColors.shadowLight,
                  blurRadius: 10,
                  offset: const Offset(0, -5),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () =>
                        _makePhoneCall(adDetails.providerPhoneNumber),
                    icon: const Icon(Icons.phone),
                    label: Text(l10n.commonCall),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.primaryAccent,
                      side: const BorderSide(color: AppColors.primaryAccent),
                      padding: const EdgeInsets.symmetric(
                        vertical: AppConstants.spacing12,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: AppConstants.spacing12),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () =>
                        _navigateToChat(context, ref, adDetails.providerId),
                    icon: const Icon(Icons.chat_bubble_outline),
                    label: Text(l10n.commonChat),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryAccent,
                      padding: const EdgeInsets.symmetric(
                        vertical: AppConstants.spacing12,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        orElse: () => null,
      ),
    );
  }
}
