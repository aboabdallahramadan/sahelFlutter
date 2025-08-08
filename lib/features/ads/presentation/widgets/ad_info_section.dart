import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../l10n/app_localizations.dart';
import '../../models/ad_detail_response.dart';

class AdInfoSection extends StatelessWidget {
  final AdDetailResponse adDetails;

  const AdInfoSection({super.key, required this.adDetails});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Container(
      padding: const EdgeInsets.all(AppConstants.spacing16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Text(
            adDetails.name,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: AppConstants.spacing12),

          // Price
          Text(
            'QAR ${adDetails.price.toStringAsFixed(0)}',
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  color: AppColors.primaryAccent,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: AppConstants.spacing12),

          // Category
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.spacing12,
              vertical: AppConstants.spacing4,
            ),
            decoration: BoxDecoration(
              color: AppColors.primaryAccent.withOpacity(0.1),
              borderRadius: BorderRadius.circular(AppConstants.radiusSmall),
            ),
            child: Text(
              adDetails.categoryName,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.primaryAccent,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
          const SizedBox(height: AppConstants.spacing12),

          // Location and Time
          Row(
            children: [
              Icon(
                Icons.location_on_outlined,
                size: AppConstants.iconSizeSmall,
                color: AppColors.textSecondary,
              ),
              const SizedBox(width: AppConstants.spacing4),
              Text(
                adDetails.regionName,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.textSecondary,
                    ),
              ),
              const SizedBox(width: AppConstants.spacing16),
              Icon(
                Icons.access_time,
                size: AppConstants.iconSizeSmall,
                color: AppColors.textSecondary,
              ),
              const SizedBox(width: AppConstants.spacing4),
              Text(
                timeago.format(adDetails.createdAt),
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.textSecondary,
                    ),
              ),
            ],
          ),
          const SizedBox(height: AppConstants.spacing12),

          // Views and Likes
          Row(
            children: [
              Icon(
                Icons.remove_red_eye_outlined,
                size: AppConstants.iconSizeSmall,
                color: AppColors.textSecondary,
              ),
              const SizedBox(width: AppConstants.spacing4),
              Text(
                '${adDetails.numberOfViews} ${l10n.adViews}',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColors.textSecondary,
                    ),
              ),
              const SizedBox(width: AppConstants.spacing16),
              Icon(
                Icons.favorite_border,
                size: AppConstants.iconSizeSmall,
                color: AppColors.textSecondary,
              ),
              const SizedBox(width: AppConstants.spacing4),
              Text(
                '${adDetails.numberOfFavorites} ${l10n.adLikes}',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColors.textSecondary,
                    ),
              ),
            ],
          ),
          const SizedBox(height: AppConstants.spacing24),

          // Description
          Text(
            'Description',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: AppConstants.spacing12),
          Text(
            adDetails.description,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  height: 1.5,
                ),
          ),
        ],
      ),
    );
  }
}
