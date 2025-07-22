import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/models/ad_small.dart';

class AdCard extends StatelessWidget {
  final AdSmall ad;

  const AdCard({super.key, required this.ad});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.goNamed('adDetails', pathParameters: {'adId': ad.id});
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.backgroundWhite,
          borderRadius: BorderRadius.circular(AppConstants.radiusLarge),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadowLight,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(AppConstants.radiusLarge),
              ),
              child: AspectRatio(
                aspectRatio: 1,
                child: CachedNetworkImage(
                  imageUrl: ad.image,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    color: AppColors.backgroundGray,
                    child: const Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: AppColors.primaryAccent,
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) => Container(
                    color: AppColors.backgroundGray,
                    child: const Icon(
                      Icons.image_not_supported,
                      color: AppColors.textTertiary,
                    ),
                  ),
                ),
              ),
            ),
            
            // Content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(AppConstants.spacing12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Text(
                      ad.title,
                      style: Theme.of(context).textTheme.titleSmall,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(),
                    
                    // Price
                    Text(
                      'QAR ${ad.price.toStringAsFixed(0)}',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: AppColors.primaryAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: AppConstants.spacing4),
                    
                    // Location and time
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          size: AppConstants.iconSizeSmall,
                          color: AppColors.textTertiary,
                        ),
                        const SizedBox(width: AppConstants.spacing4),
                        Expanded(
                          child: Text(
                            ad.location ?? '',
                            style: Theme.of(context).textTheme.bodySmall,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppConstants.spacing4),
                    
                    // Stats
                    Row(
                      children: [
                        // Comments
                        Icon(
                          Icons.chat_bubble_outline,
                          size: AppConstants.iconSizeSmall,
                          color: AppColors.textTertiary,
                        ),
                        const SizedBox(width: AppConstants.spacing4),
                        Text(
                          '${ad.comments}',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        const SizedBox(width: AppConstants.spacing12),
                        
                        // Likes
                        Icon(
                          Icons.favorite_border,
                          size: AppConstants.iconSizeSmall,
                          color: AppColors.textTertiary,
                        ),
                        const SizedBox(width: AppConstants.spacing4),
                        Text(
                          '${ad.likes}',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        const Spacer(),
                        
                        // Time
                        Text(
                          ad.timeAgo ?? '',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
} 