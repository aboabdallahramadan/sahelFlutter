import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/models/ad_small.dart';
import '../../../../core/services/api_service.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../home/presentation/widgets/ad_card.dart';
import '../../../home/models/offer_model.dart';
import '../../providers/similar_ads_provider.dart';

class SimilarAdsSection extends ConsumerWidget {
  final int categoryId;

  const SimilarAdsSection({super.key, required this.categoryId});

  AdSmall _convertOfferToAdSmall(OfferModel offer) {
    return AdSmall(
      id: offer.id.toString(),
      title: offer.name,
      price: offer.price,
      image: '${ApiService.baseUrl}/uploads/${offer.mainImageUrl}',
      comments: offer.numberOfComments,
      likes: offer.numberOfFavorites,
      location: offer.regionName,
      timeAgo: timeago.format(offer.createdAt),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);

    // Fetch similar ads from the same category
    final similarAdsAsync = ref.watch(similarAdsProvider(categoryId));

    return similarAdsAsync.when(
      data: (offers) {
        if (offers.isEmpty) {
          return const SizedBox.shrink();
        }

        return Container(
          padding: const EdgeInsets.all(AppConstants.spacing16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    l10n.adSimilarAds,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  TextButton(
                    onPressed: () {
                      context.pushNamed('subcategory', pathParameters: {
                        'categoryId': categoryId.toString(),
                      });
                    },
                    child: Text(l10n.commonViewAll),
                  ),
                ],
              ),
              const SizedBox(height: AppConstants.spacing16),
              SizedBox(
                height:
                    220, // Reduced height to match the more compact card design
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: offers.length,
                  separatorBuilder: (context, index) => const SizedBox(
                    width: AppConstants.spacing12,
                  ),
                  itemBuilder: (context, index) {
                    final ad = _convertOfferToAdSmall(offers[index]);
                    return SizedBox(
                      width: 180, // Reduced width for more compact design
                      child: AdCard(ad: ad),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
      loading: () => Container(
        padding: const EdgeInsets.all(AppConstants.spacing16),
        child: const Center(
          child: CircularProgressIndicator(
            color: AppColors.primaryAccent,
          ),
        ),
      ),
      error: (error, stack) => Container(
        padding: const EdgeInsets.all(AppConstants.spacing16),
        child: Center(
          child: Text(
            'Failed to load similar ads',
            style: TextStyle(color: AppColors.textSecondary),
          ),
        ),
      ),
    );
  }
}
