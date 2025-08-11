import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/config/app_config.dart';
import '../../../../core/models/ad_small.dart';
import '../../../../shared/widgets/refresh_wrapper.dart';
import '../../../home/presentation/widgets/ad_card.dart';
import '../../models/user_profile.dart';
import '../../models/profile_offer.dart';
import '../../providers/user_profile_provider.dart';
import '../../providers/followed_users_provider.dart';
import '../../../auth/providers/auth_provider.dart';
import '../../../../l10n/app_localizations.dart';

class UserProfileScreen extends ConsumerWidget {
  final String userId;

  const UserProfileScreen({
    super.key,
    required this.userId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userProfileAsync =
        ref.watch(individualUserProfileProvider(int.parse(userId)));
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: AppColors.primaryBg,
      appBar: AppBar(
        title: Text(l10n.profileUserProfile),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: userProfileAsync.when(
        data: (profile) {
          if (profile == null) {
            return Center(
              child: Text(l10n.profileUserNotFound),
            );
          }

          return RefreshWrapper(
            onRefresh: () async {
              ref.invalidate(individualUserProfileProvider(int.parse(userId)));
            },
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  _buildProfileHeader(context, profile),
                  SizedBox(height: AppConstants.spacing16),
                  _buildStatsSection(context, profile),
                  SizedBox(height: AppConstants.spacing16),
                  _buildAdsSection(context, profile.offers),
                  SizedBox(height: AppConstants.spacing24),
                ],
              ),
            ),
          );
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
                l10n.profileErrorLoadingProfile,
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
                onPressed: () => ref
                    .refresh(individualUserProfileProvider(int.parse(userId))),
                child: Text(l10n.commonRetry),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileHeader(BuildContext context, UserProfile profile) {
    return Consumer(
      builder: (context, ref, child) {
        final authState = ref.watch(authProvider);
        final isMyProfile = authState.user?.id == profile.id;
        final followState = ref.watch(followStateProvider(profile.id));
        final isFollowing = ref.watch(isFollowingProvider(profile.id));
        final l10n = AppLocalizations.of(context);
        return Container(
          color: AppColors.backgroundWhite,
          padding: EdgeInsets.all(AppConstants.spacing24),
          child: Column(
            children: [
              CircleAvatar(
                radius: 60.r,
                backgroundColor: AppColors.primaryAccent,
                backgroundImage: profile.profilePhotoUrl != 'placeholder.png'
                    ? NetworkImage(
                        profile.profilePhotoUrl.startsWith('http')
                            ? profile.profilePhotoUrl
                            : '${AppConfig.apiBaseUrl}/uploads/${profile.profilePhotoUrl}',
                      )
                    : null,
                child: profile.profilePhotoUrl == 'placeholder.png'
                    ? Icon(
                        Icons.person,
                        size: 60.r,
                        color: AppColors.textWhite,
                      )
                    : null,
              ),
              SizedBox(height: AppConstants.spacing16),
              Text(
                profile.name,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              SizedBox(height: AppConstants.spacing4),
              Text(
                profile.phoneNumber,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.textSecondary,
                    ),
              ),
              if (profile.memberSince != null) ...[
                SizedBox(height: AppConstants.spacing8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.calendar_today,
                      size: 16.r,
                      color: AppColors.textTertiary,
                    ),
                    SizedBox(width: AppConstants.spacing4),
                    Text(
                      '${l10n.commonMemberSince} ${_formatMemberSince(profile.memberSince!, context)}',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: AppColors.textTertiary,
                          ),
                    ),
                  ],
                ),
              ],
              // Follow/Unfollow Button (not shown for own profile)
              if (!isMyProfile && authState.isAuthenticated) ...[
                SizedBox(height: AppConstants.spacing16),
                followState.when(
                  data: (_) => isFollowing
                      ? OutlinedButton.icon(
                          onPressed: () async {
                            // Show confirmation dialog for unfollow
                            final shouldUnfollow = await showDialog<bool>(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text(
                                  l10n.profileUnfollowUser,
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                content: Text(
                                  '${l10n.profileAreYouSureYouWantToUnfollow} ${profile.name}?',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(false),
                                    child: Text(
                                      l10n.commonCancel,
                                      style: TextStyle(
                                          color: AppColors.textSecondary),
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(true),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.error,
                                      foregroundColor: Colors.white,
                                    ),
                                    child: Text(l10n.profileUnfollow),
                                  ),
                                ],
                              ),
                            );

                            if (shouldUnfollow == true) {
                              await toggleFollowUser(ref, profile.id);
                            }
                          },
                          icon: Icon(Icons.person_remove),
                          label: Text(l10n.profileUnfollow),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: AppColors.error,
                            side: BorderSide(color: AppColors.error),
                            padding: EdgeInsets.symmetric(
                              horizontal: AppConstants.spacing24,
                              vertical: AppConstants.spacing12,
                            ),
                          ),
                        )
                      : ElevatedButton.icon(
                          onPressed: () async {
                            await toggleFollowUser(ref, profile.id);
                          },
                          icon: Icon(Icons.person_add),
                          label: Text(l10n.profileFollow),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryAccent,
                            padding: EdgeInsets.symmetric(
                              horizontal: AppConstants.spacing24,
                              vertical: AppConstants.spacing12,
                            ),
                          ),
                        ),
                  loading: () => const SizedBox(
                    height: 48,
                    child: Center(
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  ),
                  error: (error, _) => ElevatedButton.icon(
                    onPressed: () async {
                      await toggleFollowUser(ref, profile.id);
                    },
                    icon: Icon(Icons.error_outline),
                    label: Text(l10n.commonRetry),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.error,
                      padding: EdgeInsets.symmetric(
                        horizontal: AppConstants.spacing24,
                        vertical: AppConstants.spacing12,
                      ),
                    ),
                  ),
                ),
              ],
            ],
          ),
        );
      },
    );
  }

  Widget _buildStatsSection(BuildContext context, UserProfile profile) {
    final l10n = AppLocalizations.of(context);
    return Container(
      color: AppColors.backgroundWhite,
      padding: EdgeInsets.symmetric(vertical: AppConstants.spacing16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildStatItem(
            context: context,
            label: l10n.commonAds,
            value: profile.offersCount?.toString() ??
                profile.offers.length.toString(),
            icon: Icons.post_add,
          ),
          _buildStatItem(
            context: context,
            label: l10n.profileFollowers,
            value: profile.followersCount?.toString() ?? '0',
            icon: Icons.people,
          ),
          _buildStatItem(
            context: context,
            label: l10n.profileFollowing,
            value: profile.followingCount?.toString() ?? '0',
            icon: Icons.person_add,
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem({
    required BuildContext context,
    required String label,
    required String value,
    required IconData icon,
  }) {
    return Column(
      children: [
        Icon(
          icon,
          color: AppColors.primaryAccent,
          size: 24.r,
        ),
        SizedBox(height: AppConstants.spacing8),
        Text(
          value,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        SizedBox(height: AppConstants.spacing4),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppColors.textSecondary,
              ),
        ),
      ],
    );
  }

  Widget _buildAdsSection(BuildContext context, List<ProfileOffer> offers) {
    final l10n = AppLocalizations.of(context);
    return Container(
      color: AppColors.backgroundWhite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(AppConstants.spacing16),
            child: Row(
              children: [
                Icon(
                  Icons.post_add,
                  color: AppColors.primaryAccent,
                  size: 24.r,
                ),
                SizedBox(width: AppConstants.spacing8),
                Text(
                  l10n.profileUserAds,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const Spacer(),
                Text(
                  '${offers.length} ${l10n.commonItems}',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.textSecondary,
                      ),
                ),
              ],
            ),
          ),
          if (offers.isEmpty)
            Padding(
              padding: EdgeInsets.all(AppConstants.spacing24),
              child: Center(
                child: Column(
                  children: [
                    Icon(
                      Icons.inbox_outlined,
                      size: 48.r,
                      color: AppColors.textTertiary,
                    ),
                    SizedBox(height: AppConstants.spacing16),
                    Text(
                      l10n.profileNoAdsPostedYet,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColors.textSecondary,
                          ),
                    ),
                  ],
                ),
              ),
            )
          else
            ...offers.map((offer) => Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppConstants.spacing16,
                    vertical: AppConstants.spacing8,
                  ),
                  child: AdCard(
                    ad: _convertOfferToAdSmall(offer, context),
                  ),
                )),
        ],
      ),
    );
  }

  AdSmall _convertOfferToAdSmall(ProfileOffer offer, BuildContext context) {
    return AdSmall(
      id: offer.id.toString(),
      title: offer.name,
      price: offer.price,
      image: offer.mainImageUrl.startsWith('http')
          ? offer.mainImageUrl
          : '${AppConfig.apiBaseUrl}/uploads/${offer.mainImageUrl}',
      comments: 0,
      likes: 0,
      location: offer.regionName,
      timeAgo: _formatTimeAgo(offer.createdAt, context),
    );
  }

  String _formatMemberSince(String dateString, BuildContext context) {
    final l10n = AppLocalizations.of(context);
    try {
      final date = DateTime.parse(dateString);
      return '${date.day}/${date.month}/${date.year}';
    } catch (e) {
      return 'Unknown';
    }
  }

  String _formatTimeAgo(String dateString, BuildContext context) {
    final l10n = AppLocalizations.of(context);
    try {
      final date = DateTime.parse(dateString);
      final now = DateTime.now();
      final difference = now.difference(date);

      if (difference.inDays > 365) {
        final years = (difference.inDays / 365).floor();
        return '$years ${years == 1 ? l10n.commonYear : l10n.commonYears} ${l10n.commonAgo}';
      } else if (difference.inDays > 30) {
        final months = (difference.inDays / 30).floor();
        return '$months ${months == 1 ? l10n.commonMonth : l10n.commonMonths} ${l10n.commonAgo}';
      } else if (difference.inDays > 7) {
        final weeks = (difference.inDays / 7).floor();
        return '$weeks ${weeks == 1 ? l10n.commonWeek : l10n.commonWeeks} ${l10n.commonAgo}';
      } else if (difference.inDays > 0) {
        return '${difference.inDays} ${difference.inDays == 1 ? l10n.commonDay : l10n.commonDays} ${l10n.commonAgo}';
      } else if (difference.inHours > 0) {
        return '${difference.inHours} ${difference.inHours == 1 ? l10n.commonHour : l10n.commonHours} ${l10n.commonAgo}';
      } else if (difference.inMinutes > 0) {
        return '${difference.inMinutes} ${difference.inMinutes == 1 ? l10n.commonMinute : l10n.commonMinutes} ${l10n.commonAgo}';
      } else {
        return l10n.commonJustNow;
      }
    } catch (e) {
      return l10n.commonRecently;
    }
  }
}
