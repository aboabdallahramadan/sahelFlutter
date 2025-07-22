import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/models/ad_details.dart';
import '../../../../l10n/app_localizations.dart';

class AdInfoSection extends StatelessWidget {
  final AdDetails adDetails;

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
            adDetails.title,
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
                adDetails.location,
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
                adDetails.timeAgo,
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
                '${adDetails.views} ${l10n.adViews}',
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
                '${adDetails.likes} ${l10n.adLikes}',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppConstants.spacing24),
          
          // Extra Info
          if (adDetails.extraInfo.isNotEmpty) ...[
            Container(
              padding: const EdgeInsets.all(AppConstants.spacing16),
              decoration: BoxDecoration(
                color: AppColors.backgroundGray,
                borderRadius: BorderRadius.circular(AppConstants.radiusLarge),
              ),
              child: Column(
                children: adDetails.extraInfo.map((info) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: AppConstants.spacing8,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          info.name,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                        Text(
                          info.value,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: AppConstants.spacing24),
          ],
          
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