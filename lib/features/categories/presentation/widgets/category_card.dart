import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/models/category.dart';
import '../../../../l10n/app_localizations.dart';

class CategoryCard extends StatelessWidget {
  final Category category;

  const CategoryCard({super.key, required this.category});

  Color _getColorFromHex(String? hexColor) {
    if (hexColor == null || hexColor.isEmpty) {
      return AppColors.primaryAccent;
    }
    final color = hexColor.replaceAll('#', '');
    return Color(int.parse('FF$color', radix: 16));
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final categoryColor = _getColorFromHex(category.color);

    // Get localized name
    String localizedName = '';
    switch (category.nameKey) {
      case 'categoriesRealEstate':
        localizedName = l10n.categoriesRealEstate;
        break;
      case 'categoriesVehicles':
        localizedName = l10n.categoriesVehicles;
        break;
      case 'categoriesServices':
        localizedName = l10n.categoriesServices;
        break;
      case 'categoriesFamilyNeeds':
        localizedName = l10n.categoriesFamilyNeeds;
        break;
      case 'categoriesJobs':
        localizedName = l10n.categoriesJobs;
        break;
      case 'categoriesElectronics':
        localizedName = l10n.categoriesElectronics;
        break;
      case 'categoriesSport':
        localizedName = l10n.categoriesSport;
        break;
      case 'categoriesTravel':
        localizedName = l10n.categoriesTravel;
        break;
      case 'categoriesNumbers':
        localizedName = l10n.categoriesNumbers;
        break;
      case 'categoriesAnimals':
        localizedName = l10n.categoriesAnimals;
        break;
      case 'categoriesOthers':
        localizedName = l10n.categoriesOthers;
        break;
      default:
        localizedName = category.nameKey;
    }

    return GestureDetector(
      onTap: () {
        context.goNamed(
          'subcategory',
          pathParameters: {'categoryId': category.id},
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.backgroundWhite,
          borderRadius: BorderRadius.circular(AppConstants.radiusLarge),
          border: Border.all(
            color: AppColors.borderLight,
            width: 1.w,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadowLight,
              blurRadius: 4.r,
              offset: Offset(0, 2.h),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon Container
            Container(
              width: 56.w,
              height: 56.h,
              decoration: BoxDecoration(
                color: categoryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(AppConstants.radiusLarge),
              ),
              child: Center(
                child: Text(
                  category.icon,
                  style: TextStyle(fontSize: 28.sp),
                ),
              ),
            ),
            SizedBox(height: AppConstants.spacing8),

            // Category Name
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppConstants.spacing8,
              ),
              child: Text(
                localizedName,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 13.sp,
                    ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
