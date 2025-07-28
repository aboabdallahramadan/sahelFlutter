import 'package:flutter/material.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/models/ad_small.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../home/presentation/widgets/ad_card.dart';

class SimilarAdsSection extends StatelessWidget {
  final List<AdSmall> ads;

  const SimilarAdsSection({super.key, required this.ads});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    if (ads.isEmpty) {
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
                  // TODO: Navigate to category
                },
                child: const Text('View All'),
              ),
            ],
          ),
          const SizedBox(height: AppConstants.spacing16),
          SizedBox(
            height: 220, // Reduced height to match the more compact card design
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: ads.length,
              separatorBuilder: (context, index) => const SizedBox(
                width: AppConstants.spacing12,
              ),
              itemBuilder: (context, index) {
                final ad = ads[index];
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
  }
}
