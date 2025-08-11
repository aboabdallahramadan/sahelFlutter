import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/services/api_service.dart';
import '../../../../l10n/app_localizations.dart';
import '../../models/ad_detail_response.dart';
import '../../../auth/providers/auth_provider.dart';

class UserProfileCard extends ConsumerWidget {
  final AdDetailResponse adDetails;

  const UserProfileCard({super.key, required this.adDetails});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);
    final isMyAd = authState.user?.id == adDetails.providerId;
    final l10n = AppLocalizations.of(context);
    return Container(
      padding: const EdgeInsets.all(AppConstants.spacing16),
      child: Row(
        children: [
          // Avatar
          CircleAvatar(
            radius: 30,
            backgroundColor: AppColors.backgroundGray,
            child: adDetails.providerProfilePhotoUrl != 'placeholder.png'
                ? ClipOval(
                    child: CachedNetworkImage(
                      imageUrl:
                          '${ApiService.baseUrl}/uploads/${adDetails.providerProfilePhotoUrl}',
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                      errorWidget: (context, url, error) => const Icon(
                        Icons.person,
                        size: 30,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  )
                : const Icon(
                    Icons.person,
                    size: 30,
                    color: AppColors.textSecondary,
                  ),
          ),
          const SizedBox(width: AppConstants.spacing16),

          // User Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  adDetails.providerName,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: AppConstants.spacing4),
                Row(
                  children: [
                    Icon(
                      Icons.calendar_today_outlined,
                      size: AppConstants.iconSizeSmall,
                      color: AppColors.textSecondary,
                    ),
                    const SizedBox(width: AppConstants.spacing4),
                    Text(
                      '${l10n.commonMemberSince} ${DateTime.parse(adDetails.providerCreatedAt).year}',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: AppColors.textSecondary,
                          ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // View Profile Button (hide for own ads)
          if (!isMyAd)
            Row(
              children: [
                // View Profile Button
                TextButton(
                  onPressed: () {
                    context.pushNamed(
                      'userProfile',
                      pathParameters: {
                        'userId': adDetails.providerId.toString()
                      },
                    );
                  },
                  child: Text(
                    l10n.commonViewProfile,
                    style: TextStyle(
                      color: AppColors.primaryAccent,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
