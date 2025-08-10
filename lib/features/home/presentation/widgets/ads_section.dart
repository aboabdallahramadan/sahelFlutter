import 'package:Sahel/core/providers/locale_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/models/ad_small.dart';
import '../../../../core/services/api_service.dart';
import '../../../../l10n/app_localizations.dart';
import '../../providers/offers_provider.dart';
import '../../models/offer_model.dart';
import 'ad_card.dart';

class AdsSection extends ConsumerStatefulWidget {
  const AdsSection({super.key});

  @override
  ConsumerState<AdsSection> createState() => _AdsSectionState();
}

class _AdsSectionState extends ConsumerState<AdsSection> {
  AdSmall _convertOfferToAdSmall(OfferModel offer) {
    return AdSmall(
      id: offer.id.toString(),
      title: offer.name,
      price: offer.price,
      image: '${ApiService.baseUrl}/uploads/${offer.mainImageUrl}',
      comments: offer.numberOfComments,
      likes: offer.numberOfFavorites,
      location: offer.regionName,
      timeAgo: timeago.format(offer.createdAt,
          locale: ref.watch(localeProvider).languageCode),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final offersState = ref.watch(offersProvider);

    return Container(
      color: AppColors.backgroundWhite,
      padding: EdgeInsets.all(AppConstants.spacing16R),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                l10n.commonLatestAds,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                    ),
              ),
              TextButton(
                onPressed: () {
                  context.goNamed('categories');
                },
                child: Text(
                  l10n.commonViewAll,
                  style: TextStyle(fontSize: 14.sp),
                ),
              ),
            ],
          ),
          SizedBox(height: AppConstants.spacing16R),
          if (offersState.error != null)
            Center(
              child: Column(
                children: [
                  Icon(
                    Icons.error_outline,
                    size: 48.sp,
                    color: AppColors.error,
                  ),
                  SizedBox(height: AppConstants.spacing8R),
                  Text(
                    offersState.error!,
                    style: TextStyle(
                      color: AppColors.error,
                      fontSize: 14.sp,
                    ),
                  ),
                  SizedBox(height: AppConstants.spacing16R),
                  OutlinedButton(
                    onPressed: () {
                      ref.read(offersProvider.notifier).refresh();
                    },
                    child: Text(l10n.commonRetry),
                  ),
                ],
              ),
            )
          else if (offersState.offers.isEmpty && offersState.isLoading)
            const Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryAccent,
              ),
            )
          else if (offersState.offers.isEmpty)
            Center(
              child: Text(
                'No ads available',
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 16.sp,
                ),
              ),
            )
          else ...[
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: AppConstants.spacing12R,
                mainAxisSpacing: AppConstants.spacing12R,
                childAspectRatio: 0.85,
              ),
              itemCount: offersState.offers.length,
              itemBuilder: (context, index) {
                final ad = _convertOfferToAdSmall(offersState.offers[index]);
                return AdCard(ad: ad);
              },
            ),
            if (offersState.hasMore) ...[
              SizedBox(height: AppConstants.spacing16R),
              Center(
                child: offersState.isLoading
                    ? const CircularProgressIndicator(
                        color: AppColors.primaryAccent,
                      )
                    : OutlinedButton(
                        onPressed: () {
                          ref.read(offersProvider.notifier).loadMoreOffers();
                        },
                        style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                            horizontal: 32.w,
                            vertical: 12.h,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                        ),
                        child: Text(
                          l10n.commonSeeMore,
                          style: TextStyle(fontSize: 14.sp),
                        ),
                      ),
              ),
            ],
          ],
        ],
      ),
    );
  }
}
