import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/services/api_service.dart';
import '../../models/category_tree_model.dart';

class CategoryTreeCard extends StatelessWidget {
  final CategoryTreeModel category;

  const CategoryTreeCard({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.backgroundWhite,
        borderRadius: BorderRadius.circular(AppConstants.radiusLarge),
        border: Border.all(color: AppColors.borderLight),
      ),
      child: Column(
        children: [
          // Category Header
          InkWell(
            onTap: () {
              if (category.subCategories.isEmpty) {
                // Navigate directly to subcategory screen if no subcategories
                context.goNamed(
                  'subcategory',
                  pathParameters: {
                    'categoryId': category.id.toString(),
                  },
                  queryParameters: {
                    'title': category.name,
                  },
                );
              }
            },
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(AppConstants.radiusLarge),
            ),
            child: Container(
              padding: EdgeInsets.all(AppConstants.spacing16R),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.primaryAccent.withOpacity(0.1),
                    AppColors.primaryAccent.withOpacity(0.05),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(AppConstants.radiusLarge),
                ),
              ),
              child: Row(
                children: [
                  // Category Icon
                  Container(
                    width: 50.w,
                    height: 50.w,
                    decoration: BoxDecoration(
                      color: AppColors.backgroundWhite,
                      borderRadius:
                          BorderRadius.circular(AppConstants.radiusMedium),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.shadowLight,
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(AppConstants.radiusMedium),
                      child: CachedNetworkImage(
                        imageUrl:
                            '${ApiService.baseUrl}/uploads/${category.imageUrl}',
                        width: 50.w,
                        height: 50.w,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Container(
                          color: AppColors.backgroundGray,
                          child: const Center(
                            child: CircularProgressIndicator(
                              color: AppColors.primaryAccent,
                              strokeWidth: 2,
                            ),
                          ),
                        ),
                        errorWidget: (context, url, error) => Container(
                          color: AppColors.backgroundGray,
                          child: Icon(
                            Icons.category,
                            color: AppColors.textTertiary,
                            size: 24.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: AppConstants.spacing16R),
                  // Category Title
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          category.name,
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.sp,
                                  ),
                        ),
                        if (category.subCategories.isNotEmpty) ...[
                          SizedBox(height: AppConstants.spacing4R),
                          Text(
                            '${category.subCategories.length} subcategories',
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: AppColors.textSecondary,
                                      fontSize: 12.sp,
                                    ),
                          ),
                        ],
                      ],
                    ),
                  ),
                  if (category.subCategories.isNotEmpty)
                    Icon(
                      Icons.expand_more,
                      color: AppColors.textSecondary,
                      size: AppConstants.iconSizeMediumR,
                    ),
                ],
              ),
            ),
          ),

          // Subcategories Grid
          if (category.subCategories.isNotEmpty)
            Container(
              padding: EdgeInsets.all(AppConstants.spacing16R),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: AppConstants.spacing12R,
                  mainAxisSpacing: AppConstants.spacing12R,
                  childAspectRatio: 1.5,
                ),
                itemCount: category.subCategories.length,
                itemBuilder: (context, index) {
                  final subcategory = category.subCategories[index];
                  return _SubcategoryItem(
                    subcategory: subcategory,
                    categoryId: category.id,
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}

class _SubcategoryItem extends StatelessWidget {
  final SubCategoryModel subcategory;
  final int categoryId;

  const _SubcategoryItem({
    required this.subcategory,
    required this.categoryId,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.goNamed(
          'subcategory',
          pathParameters: {
            'categoryId': subcategory.id.toString(),
          },
          queryParameters: {
            'title': subcategory.name,
          },
        );
      },
      borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.borderLight),
          borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Subcategory Icon
            Container(
              width: 40.w,
              height: 40.w,
              decoration: BoxDecoration(
                color: AppColors.backgroundGray,
                borderRadius: BorderRadius.circular(AppConstants.radiusSmall),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(AppConstants.radiusSmall),
                child: CachedNetworkImage(
                  imageUrl:
                      '${ApiService.baseUrl}/uploads/${subcategory.imageUrl}',
                  width: 40.w,
                  height: 40.w,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    color: AppColors.backgroundGray,
                  ),
                  errorWidget: (context, url, error) => Icon(
                    Icons.category_outlined,
                    color: AppColors.textTertiary,
                    size: 20.sp,
                  ),
                ),
              ),
            ),
            SizedBox(height: AppConstants.spacing8R),
            // Subcategory Title
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppConstants.spacing8R),
              child: Text(
                subcategory.name,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
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
