import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../l10n/app_localizations.dart';
import '../widgets/banner_carousel.dart';
import '../widgets/ads_section.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);

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
              // TODO: Implement search
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
                    child: Icon(
                      Icons.person,
                      size: 30.r,
                      color: AppColors.primaryAccent,
                    ),
                  ),
                  SizedBox(height: AppConstants.spacing16R),
                  Text(
                    l10n.navLogin,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: AppColors.textWhite,
                          fontSize: 18.sp,
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
                // TODO: Implement language change
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
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            // Banner Carousel
            BannerCarousel(),

            // Latest Ads Section
            AdsSection(),
          ],
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
