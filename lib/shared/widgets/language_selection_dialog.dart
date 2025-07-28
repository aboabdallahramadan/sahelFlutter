import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_constants.dart';
import '../../core/providers/locale_provider.dart';
import '../../l10n/app_localizations.dart';

class LanguageSelectionDialog extends ConsumerWidget {
  const LanguageSelectionDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final currentLocale = ref.watch(localeProvider);

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConstants.radiusLargeR),
      ),
      child: Padding(
        padding: EdgeInsets.all(AppConstants.spacing24R),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              l10n.navLanguage,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
            ),
            SizedBox(height: AppConstants.spacing24R),

            // English Option
            _LanguageOption(
              languageCode: 'en',
              languageName: 'English',
              nativeName: 'English',
              flag: '🇺🇸',
              isSelected: currentLocale.languageCode == 'en',
              onTap: () async {
                await ref.read(localeProvider.notifier).changeLocale(
                      const Locale('en'),
                    );
                if (context.mounted) {
                  Navigator.of(context).pop();
                }
              },
            ),
            SizedBox(height: AppConstants.spacing12R),

            // Arabic Option
            _LanguageOption(
              languageCode: 'ar',
              languageName: 'Arabic',
              nativeName: 'العربية',
              flag: '🇸🇦',
              isSelected: currentLocale.languageCode == 'ar',
              onTap: () async {
                await ref.read(localeProvider.notifier).changeLocale(
                      const Locale('ar'),
                    );
                if (context.mounted) {
                  Navigator.of(context).pop();
                }
              },
            ),
            SizedBox(height: AppConstants.spacing24R),

            // Cancel Button
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () => Navigator.of(context).pop(),
                style: TextButton.styleFrom(
                  padding:
                      EdgeInsets.symmetric(vertical: AppConstants.spacing12R),
                ),
                child: Text(
                  'Cancel',
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LanguageOption extends StatelessWidget {
  final String languageCode;
  final String languageName;
  final String nativeName;
  final String flag;
  final bool isSelected;
  final VoidCallback onTap;

  const _LanguageOption({
    required this.languageCode,
    required this.languageName,
    required this.nativeName,
    required this.flag,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppConstants.radiusMediumR),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(AppConstants.spacing16R),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppConstants.radiusMediumR),
          border: Border.all(
            color: isSelected ? AppColors.primaryAccent : AppColors.borderLight,
            width: isSelected ? 2 : 1,
          ),
          color: isSelected ? AppColors.primaryAccent.withOpacity(0.1) : null,
        ),
        child: Row(
          children: [
            // Flag
            Text(
              flag,
              style: TextStyle(fontSize: 24.sp),
            ),
            SizedBox(width: AppConstants.spacing16R),

            // Language names
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    languageName,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: isSelected
                              ? AppColors.primaryAccent
                              : AppColors.textPrimary,
                        ),
                  ),
                  if (nativeName != languageName) ...[
                    SizedBox(height: AppConstants.spacing4R),
                    Text(
                      nativeName,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: isSelected
                                ? AppColors.primaryAccent
                                : AppColors.textSecondary,
                          ),
                    ),
                  ],
                ],
              ),
            ),

            // Selection indicator
            if (isSelected)
              Icon(
                Icons.check_circle,
                color: AppColors.primaryAccent,
                size: AppConstants.iconSizeMediumR,
              ),
          ],
        ),
      ),
    );
  }
}
