import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/providers/locale_provider.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/widgets/language_selection_dialog.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: AppColors.primaryBg,
      appBar: AppBar(
        title: Text(l10n.profileTitle),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Header
            Container(
              color: AppColors.backgroundWhite,
              padding: const EdgeInsets.all(AppConstants.spacing24),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: AppColors.primaryAccent,
                    child: const Icon(
                      Icons.person,
                      size: 50,
                      color: AppColors.textWhite,
                    ),
                  ),
                  const SizedBox(height: AppConstants.spacing16),
                  Text(
                    'Guest User',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: AppConstants.spacing8),
                  ElevatedButton.icon(
                    onPressed: () {
                      context.goNamed('login');
                    },
                    icon: const Icon(Icons.login),
                    label: Text(l10n.authSignIn),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryAccent,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppConstants.spacing8),

            // Menu Items
            Container(
              color: AppColors.backgroundWhite,
              child: Column(
                children: [
                  _buildMenuItem(
                    context: context,
                    icon: Icons.post_add,
                    title: l10n.profileMyAds,
                    onTap: () {
                      context.goNamed('myAds');
                    },
                  ),
                  const Divider(height: 1),
                  _buildMenuItem(
                    context: context,
                    icon: Icons.favorite,
                    title: l10n.profileFavorites,
                    onTap: () {
                      context.goNamed('favorites');
                    },
                  ),
                  const Divider(height: 1),
                  _buildMenuItem(
                    context: context,
                    icon: Icons.notifications,
                    title: l10n.profileNotifications,
                    onTap: () {
                      context.goNamed('notifications');
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppConstants.spacing8),

            // Settings Section
            Container(
              color: AppColors.backgroundWhite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(AppConstants.spacing16),
                    child: Text(
                      l10n.profileSettings,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.textSecondary,
                          ),
                    ),
                  ),
                  _buildMenuItem(
                    context: context,
                    icon: Icons.language,
                    title: l10n.profileChangeLanguage,
                    trailing: Consumer(
                      builder: (context, ref, child) {
                        final currentLocale = ref.watch(localeProvider);
                        return Text(
                          currentLocale.languageCode == 'en'
                              ? 'English'
                              : 'العربية',
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: AppColors.textSecondary,
                                  ),
                        );
                      },
                    ),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => const LanguageSelectionDialog(),
                      );
                    },
                  ),
                  const Divider(height: 1),
                  _buildMenuItem(
                    context: context,
                    icon: Icons.privacy_tip,
                    title: l10n.profilePrivacy,
                    onTap: () {
                      context.goNamed('privacy');
                    },
                  ),
                  const Divider(height: 1),
                  _buildMenuItem(
                    context: context,
                    icon: Icons.description,
                    title: l10n.profileTerms,
                    onTap: () {
                      context.goNamed('terms');
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppConstants.spacing8),

            // Support Section
            Container(
              color: AppColors.backgroundWhite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(AppConstants.spacing16),
                    child: Text(
                      l10n.footerSupport,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.textSecondary,
                          ),
                    ),
                  ),
                  _buildMenuItem(
                    context: context,
                    icon: Icons.help,
                    title: l10n.profileHelp,
                    onTap: () {
                      context.goNamed('contact');
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppConstants.spacing24),

            // App Version
            Text(
              'Version ${AppConstants.appVersion}',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.textTertiary,
                  ),
            ),
            const SizedBox(height: AppConstants.spacing24),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required BuildContext context,
    required IconData icon,
    required String title,
    Widget? trailing,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppConstants.spacing16,
          vertical: AppConstants.spacing16,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: AppColors.textSecondary,
              size: AppConstants.iconSizeMedium,
            ),
            const SizedBox(width: AppConstants.spacing16),
            Expanded(
              child: Text(
                title,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            if (trailing != null)
              trailing
            else
              Icon(
                Icons.chevron_right,
                color: AppColors.textTertiary,
                size: AppConstants.iconSizeMedium,
              ),
          ],
        ),
      ),
    );
  }
}
