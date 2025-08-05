import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/models/ad_small.dart';
import '../../../../l10n/app_localizations.dart';

class AdCard extends StatelessWidget {
  final AdSmall ad;

  const AdCard({super.key, required this.ad});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return GestureDetector(
      onTap: () {
        context.goNamed('adDetails', pathParameters: {'adId': ad.id});
      },
      child: Container(
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
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize
              .min, // This ensures the column only takes needed space
          children: [
            // Image
            ClipRRect(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(AppConstants.radiusLargeR),
              ),
              child: SizedBox(
                height: 100.h, // Reduced height for more compact design
                width: double.infinity,
                child: CachedNetworkImage(
                  imageUrl: ad.image,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    color: AppColors.backgroundGray,
                    child: Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 2.w,
                        color: AppColors.primaryAccent,
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) => Container(
                    color: AppColors.backgroundGray,
                    child: Icon(
                      Icons.image_not_supported,
                      color: AppColors.textTertiary,
                      size: AppConstants.iconSizeLargeR,
                    ),
                  ),
                ),
              ),
            ),

            // Content - Removed Expanded to prevent stretching
            Padding(
              padding: EdgeInsets.all(AppConstants.spacing8R),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min, // Only take needed space
                children: [
                  // Title
                  Text(
                    ad.title,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontSize: 12.sp,
                          height: 1.2,
                        ),
                    maxLines: 2, // Allow 2 lines for better content display
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4.h), // Consistent spacing

                  // Price
                  Text(
                    '${ad.price.toStringAsFixed(0)} ${l10n.commonSAR}',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: AppColors.primaryAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
                          height: 1.2,
                        ),
                  ),
                  SizedBox(height: 4.h), // Consistent spacing

                  // Location
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: 12.r,
                        color: AppColors.textTertiary,
                      ),
                      SizedBox(width: 2.w),
                      Expanded(
                        child: Text(
                          ad.location ?? '',
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    fontSize: 10.sp,
                                    height: 1.2,
                                  ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 6.h), // Slightly more space before stats

                  // Stats - optimized layout
                  Row(
                    children: [
                      // Comments
                      Icon(
                        Icons.chat_bubble_outline,
                        size: 10.r,
                        color: AppColors.textTertiary,
                      ),
                      SizedBox(width: 2.w),
                      Text(
                        '${ad.comments}',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontSize: 9.sp,
                              height: 1.2,
                            ),
                      ),
                      SizedBox(width: 8.w), // Reduced spacing

                      // Likes
                      Icon(
                        Icons.favorite_border,
                        size: 10.r,
                        color: AppColors.textTertiary,
                      ),
                      SizedBox(width: 2.w),
                      Text(
                        '${ad.likes}',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontSize: 9.sp,
                              height: 1.2,
                            ),
                      ),
                      const Spacer(),

                      // Time
                      Flexible(
                        child: Text(
                          ad.timeAgo ?? '',
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    fontSize: 8.sp,
                                    height: 1.2,
                                  ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
