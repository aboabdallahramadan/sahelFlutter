import 'package:flutter/material.dart';
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
          height: 40,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // TODO: Implement search
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {
              context.goNamed('notifications');
            },
          ),
          IconButton(
            icon: const Icon(Icons.chat_bubble_outline),
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
                    radius: 30,
                    backgroundColor: AppColors.backgroundWhite,
                    child: Icon(
                      Icons.person,
                      size: 30,
                      color: AppColors.primaryAccent,
                    ),
                  ),
                  const SizedBox(height: AppConstants.spacing16),
                  Text(
                    l10n.navLogin,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: AppColors.textWhite,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: Text(l10n.commonHome),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.category),
              title: Text(l10n.navCategories),
              onTap: () {
                Navigator.pop(context);
                context.goNamed('categories');
              },
            ),
            ListTile(
              leading: const Icon(Icons.add_box),
              title: Text(l10n.navPostAd),
              onTap: () {
                Navigator.pop(context);
                context.goNamed('postAd');
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: Text(l10n.profileTitle),
              onTap: () {
                Navigator.pop(context);
                context.goNamed('profile');
              },
            ),
            ListTile(
              leading: const Icon(Icons.favorite),
              title: Text(l10n.profileFavorites),
              onTap: () {
                Navigator.pop(context);
                context.goNamed('favorites');
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.language),
              title: Text(l10n.navLanguage),
              onTap: () {
                // TODO: Implement language change
              },
            ),
            ListTile(
              leading: const Icon(Icons.help),
              title: Text(l10n.navHelp),
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
        icon: const Icon(Icons.add),
        label: Text(l10n.navPostAd),
      ),
    );
  }
} 