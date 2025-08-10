import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/config/app_config.dart';
import '../../../../shared/widgets/refresh_wrapper.dart';
import '../../models/followed_user.dart';
import '../../providers/followed_users_provider.dart';
import '../../providers/my_ads_provider.dart';
import '../../../auth/providers/auth_provider.dart';

class FollowedUsersScreen extends ConsumerWidget {
  const FollowedUsersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);
    final l10n = AppLocalizations.of(context);
    // Redirect to login if not authenticated
    if (!authState.isAuthenticated) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.goNamed('login');
      });
      return const Center(child: CircularProgressIndicator());
    }

    final followedUsersAsync = ref.watch(followedUsersProvider);

    return Scaffold(
      backgroundColor: AppColors.primaryBg,
      appBar: AppBar(
        title: Text(l10n.profileFollowing),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: followedUsersAsync.when(
        data: (users) {
          return RefreshWrapper(
            onRefresh: () async {
              ref.invalidate(userProfileProvider);
            },
            child: users.isEmpty
                ? _buildEmptyState(context)
                : _buildUsersList(users, ref, context),
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stack) => RefreshWrapper(
          onRefresh: () async {
            ref.invalidate(userProfileProvider);
          },
          child: ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.7,
                child: Center(
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
                        'Error loading followed users',
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
                        onPressed: () => ref.invalidate(userProfileProvider),
                        child: const Text('Try Again'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.7,
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(AppConstants.spacing24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.people_outline,
                    size: 80.r,
                    color: AppColors.textTertiary,
                  ),
                  SizedBox(height: AppConstants.spacing24),
                  Text(
                    'Not Following Anyone',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  SizedBox(height: AppConstants.spacing8),
                  Text(
                    'Start following other users to see their latest ads and updates here.',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.textSecondary,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildUsersList(
      List<FollowedUser> users, WidgetRef ref, BuildContext context) {
    return ListView.separated(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: EdgeInsets.all(AppConstants.spacing16),
      itemCount: users.length,
      separatorBuilder: (context, index) =>
          SizedBox(height: AppConstants.spacing12),
      itemBuilder: (context, index) {
        final user = users[index];
        return _buildUserCard(user, ref, context);
      },
    );
  }

  Widget _buildUserCard(
      FollowedUser user, WidgetRef ref, BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.backgroundWhite,
        borderRadius: BorderRadius.circular(AppConstants.radiusMediumR),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowLight,
            blurRadius: 4.r,
            offset: Offset(0, 2.h),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(AppConstants.spacing16),
        child: Row(
          children: [
            // Profile Photo
            CircleAvatar(
              radius: 30.r,
              backgroundColor: AppColors.primaryAccent,
              backgroundImage: user.profilePhotoUrl != 'placeholder.png'
                  ? NetworkImage(
                      user.profilePhotoUrl.startsWith('http')
                          ? user.profilePhotoUrl
                          : '${AppConfig.apiBaseUrl}/uploads/${user.profilePhotoUrl}',
                    )
                  : null,
              child: user.profilePhotoUrl == 'placeholder.png'
                  ? Icon(
                      Icons.person,
                      size: 30.r,
                      color: AppColors.textWhite,
                    )
                  : null,
            ),
            SizedBox(width: AppConstants.spacing16),

            // User Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.name,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  SizedBox(height: AppConstants.spacing4),
                  Text(
                    user.phoneNumber,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.textSecondary,
                        ),
                  ),
                ],
              ),
            ),

            // Action Buttons
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // View Profile Button
                Material(
                  color: AppColors.primaryAccent.withOpacity(0.1),
                  shape: const CircleBorder(),
                  child: IconButton(
                    onPressed: () {
                      context.pushNamed(
                        'userProfile',
                        pathParameters: {'userId': user.id.toString()},
                      );
                    },
                    icon: const Icon(Icons.person_outline),
                    tooltip: 'View Profile',
                    color: AppColors.primaryAccent,
                  ),
                ),

                const SizedBox(height: 8),

                // Unfollow Button
                Consumer(
                  builder: (context, ref, child) {
                    final followState = ref.watch(followStateProvider(user.id));

                    return followState.when(
                      data: (_) => Material(
                        color: AppColors.error.withOpacity(0.1),
                        shape: const CircleBorder(),
                        child: IconButton(
                          onPressed: () async {
                            final shouldUnfollow = await showDialog<bool>(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text(
                                  'Unfollow User',
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                content: Text(
                                  'Are you sure you want to unfollow ${user.name}?',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(false),
                                    child: Text(
                                      'Cancel',
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
                                    child: const Text('Unfollow'),
                                  ),
                                ],
                              ),
                            );

                            if (shouldUnfollow == true) {
                              await toggleFollowUser(ref, user.id);
                            }
                          },
                          icon: const Icon(Icons.person_remove),
                          tooltip: 'Unfollow',
                          color: AppColors.error,
                        ),
                      ),
                      loading: () => const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        ),
                      ),
                      error: (error, _) => Material(
                        color: AppColors.error.withOpacity(0.1),
                        shape: const CircleBorder(),
                        child: IconButton(
                          onPressed: () async {
                            // Retry the unfollow action
                            await toggleFollowUser(ref, user.id);
                          },
                          icon: const Icon(Icons.person_remove),
                          tooltip: 'Unfollow',
                          color: AppColors.error,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
