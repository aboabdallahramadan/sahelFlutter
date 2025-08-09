import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/widgets/language_selection_dialog.dart';
import '../../../../shared/widgets/refresh_wrapper.dart';
import '../../../auth/providers/auth_provider.dart';
import '../../../home/providers/offers_provider.dart';
import '../../../home/providers/sliders_provider.dart';
import '../widgets/banner_carousel.dart';
import '../widgets/ads_section.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final authState = ref.watch(authProvider);

    return Scaffold(
      backgroundColor: AppColors.primaryBg,
      appBar: AppBar(
        title: Image.asset(
          'assets/images/logo.png',
          height: 40.h,
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              size: AppConstants.iconSizeMediumR,
            ),
            onPressed: () {
              context.goNamed('search');
            },
          ),
          IconButton(
            icon: Icon(
              Icons.notifications_outlined,
              size: AppConstants.iconSizeMediumR,
            ),
            onPressed: () {
              context.goNamed('notifications');
            },
          ),
          IconButton(
            icon: Icon(
              Icons.chat_bubble_outline,
              size: AppConstants.iconSizeMediumR,
            ),
            onPressed: () {
              context.goNamed('chats');
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: AppColors.primaryGradient,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30.r,
                    backgroundColor: AppColors.backgroundWhite,
                    child: authState.user?.profilePhotoUrl != null &&
                            authState.user!.profilePhotoUrl != 'placeholder.png'
                        ? ClipOval(
                            child: Image.network(
                              authState.user!.profilePhotoUrl,
                              width: 60.r,
                              height: 60.r,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Icon(
                                  Icons.person,
                                  size: 30.r,
                                  color: AppColors.primaryAccent,
                                );
                              },
                            ),
                          )
                        : Icon(
                            Icons.person,
                            size: 30.r,
                            color: AppColors.primaryAccent,
                          ),
                  ),
                  SizedBox(height: AppConstants.spacing16R),
                  Text(
                    authState.isAuthenticated && authState.user != null
                        ? authState.user!.name
                        : l10n.navLogin,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: AppColors.textWhite,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  if (authState.isAuthenticated && authState.user != null)
                    Text(
                      authState.user!.phoneNumber,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: AppColors.textWhite.withOpacity(0.8),
                            fontSize: 12.sp,
                          ),
                    ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                size: AppConstants.iconSizeMediumR,
              ),
              title: Text(
                l10n.commonHome,
                style: TextStyle(fontSize: 16.sp),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.category,
                size: AppConstants.iconSizeMediumR,
              ),
              title: Text(
                l10n.navCategories,
                style: TextStyle(fontSize: 16.sp),
              ),
              onTap: () {
                Navigator.pop(context);
                context.goNamed('categories');
              },
            ),
            ListTile(
              leading: Icon(
                Icons.add_box,
                size: AppConstants.iconSizeMediumR,
              ),
              title: Text(
                l10n.navPostAd,
                style: TextStyle(fontSize: 16.sp),
              ),
              onTap: () {
                Navigator.pop(context);
                context.goNamed('postAd');
              },
            ),
            ListTile(
              leading: Icon(
                Icons.person,
                size: AppConstants.iconSizeMediumR,
              ),
              title: Text(
                l10n.profileTitle,
                style: TextStyle(fontSize: 16.sp),
              ),
              onTap: () {
                Navigator.pop(context);
                context.goNamed('profile');
              },
            ),
            ListTile(
              leading: Icon(
                Icons.favorite,
                size: AppConstants.iconSizeMediumR,
              ),
              title: Text(
                l10n.profileFavorites,
                style: TextStyle(fontSize: 16.sp),
              ),
              onTap: () {
                Navigator.pop(context);
                context.goNamed('favorites');
              },
            ),
            const Divider(),
            ListTile(
              leading: Icon(
                Icons.language,
                size: AppConstants.iconSizeMediumR,
              ),
              title: Text(
                l10n.navLanguage,
                style: TextStyle(fontSize: 16.sp),
              ),
              onTap: () {
                Navigator.pop(context);
                showDialog(
                  context: context,
                  builder: (context) => const LanguageSelectionDialog(),
                );
              },
            ),
            ListTile(
              leading: Icon(
                Icons.help,
                size: AppConstants.iconSizeMediumR,
              ),
              title: Text(
                l10n.navHelp,
                style: TextStyle(fontSize: 16.sp),
              ),
              onTap: () {
                Navigator.pop(context);
                context.goNamed('contact');
              },
            ),
            const Divider(),
            if (authState.isAuthenticated)
              ListTile(
                leading: Icon(
                  Icons.logout,
                  size: AppConstants.iconSizeMediumR,
                  color: AppColors.error,
                ),
                title: Text(
                  l10n.profileLogout,
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: AppColors.error,
                  ),
                ),
                onTap: () async {
                  Navigator.pop(context);
                  // Show confirmation dialog
                  final shouldLogout = await showDialog<bool>(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text(l10n.profileLogout),
                      content: const Text('Are you sure you want to logout?'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(false),
                          child: Text(l10n.commonCancel),
                        ),
                        ElevatedButton(
                          onPressed: () => Navigator.of(context).pop(true),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.error,
                          ),
                          child: Text(l10n.profileLogout),
                        ),
                      ],
                    ),
                  );

                  if (shouldLogout == true) {
                    await ref.read(authProvider.notifier).logout();
                  }
                },
              )
            else
              ListTile(
                leading: Icon(
                  Icons.login,
                  size: AppConstants.iconSizeMediumR,
                  color: AppColors.primaryAccent,
                ),
                title: Text(
                  l10n.authSignIn,
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: AppColors.primaryAccent,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  context.goNamed('login');
                },
              ),
          ],
        ),
      ),
      body: RefreshWrapper(
        onRefresh: () async {
          // Refresh both offers and sliders
          await Future.wait([
            ref.read(offersProvider.notifier).refresh(),
            ref.refresh(slidersProvider.future),
          ]);
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: const [
              // Banner Carousel
              BannerCarousel(),

              // Latest Ads Section
              AdsSection(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.goNamed('postAd');
        },
        backgroundColor: AppColors.primaryAccent,
        icon: Icon(
          Icons.add,
          size: AppConstants.iconSizeMediumR,
        ),
        label: Text(
          l10n.navPostAd,
          style: TextStyle(fontSize: 14.sp),
        ),
      ),
    );
  }
}
