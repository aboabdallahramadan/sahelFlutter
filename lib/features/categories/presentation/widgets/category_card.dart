import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/models/category.dart';
import '../../../../l10n/app_localizations.dart';

class CategoryCard extends StatefulWidget {
  final Category category;

  const CategoryCard({super.key, required this.category});

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false;
  late AnimationController _animationController;
  late Animation<double> _expandAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _expandAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final hasSubcategories = widget.category.subcategories.isNotEmpty;

    return Container(
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Category Header
          GestureDetector(
            onTap: hasSubcategories ? _toggleExpanded : null,
            child: Container(
              padding: EdgeInsets.all(AppConstants.spacing12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      // Category Title
                      Expanded(
                        child: Text(
                          widget.category.title,
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.sp,
                                  ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),

                      // Expand/Collapse Icon
                      if (hasSubcategories)
                        AnimatedRotation(
                          turns: _isExpanded ? 0.5 : 0,
                          duration: const Duration(milliseconds: 300),
                          child: Icon(
                            Icons.keyboard_arrow_down,
                            color: AppColors.textSecondary,
                            size: 20.sp,
                          ),
                        ),
                    ],
                  ),

                  SizedBox(height: AppConstants.spacing8),

                  // Stats Row
                  Row(
                    children: [
                      // Ads Count
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppConstants.spacing8,
                          vertical: AppConstants.spacing4,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primaryAccent.withOpacity(0.1),
                          borderRadius:
                              BorderRadius.circular(AppConstants.radiusSmall),
                        ),
                        child: Text(
                          '${widget.category.adsCount} ${l10n.commonAds}',
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: AppColors.primaryAccent,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 11.sp,
                                  ),
                        ),
                      ),

                      SizedBox(width: AppConstants.spacing8),

                      // Subcategories count
                      if (hasSubcategories)
                        Text(
                          '${widget.category.subcategories.length} ${l10n.subcategoriesTitle}',
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: AppColors.textSecondary,
                                    fontSize: 10.sp,
                                  ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Expandable Subcategories List
          if (hasSubcategories)
            SizeTransition(
              sizeFactor: _expandAnimation,
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: AppColors.borderLight,
                      width: 1.w,
                    ),
                  ),
                ),
                child: Column(
                  children: widget.category.subcategories.map((subcategory) {
                    return _buildSubcategoryItem(subcategory);
                  }).toList(),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildSubcategoryItem(SubCategory subcategory) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          // Navigate to ads for this subcategory
          context.go(
              '/category/${widget.category.id}/subcategory/${subcategory.id}');
        },
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: AppConstants.spacing12,
            vertical: AppConstants.spacing8,
          ),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: AppColors.borderLight.withOpacity(0.5),
                width: 0.5.w,
              ),
            ),
          ),
          child: Row(
            children: [
              // Subcategory Icon/Avatar
              Container(
                width: 32.w,
                height: 32.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppConstants.radiusSmall),
                  image: subcategory.image.isNotEmpty
                      ? DecorationImage(
                          image: NetworkImage(subcategory.image),
                          fit: BoxFit.cover,
                        )
                      : null,
                  color: subcategory.image.isEmpty
                      ? AppColors.primaryAccent.withOpacity(0.1)
                      : null,
                ),
                child: subcategory.image.isEmpty
                    ? Center(
                        child: Text(
                          subcategory.title.isNotEmpty
                              ? subcategory.title[0].toUpperCase()
                              : '?',
                          style: TextStyle(
                            color: AppColors.primaryAccent,
                            fontWeight: FontWeight.w600,
                            fontSize: 12.sp,
                          ),
                        ),
                      )
                    : null,
              ),

              SizedBox(width: AppConstants.spacing12),

              // Subcategory Title
              Expanded(
                child: Text(
                  subcategory.title,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 13.sp,
                      ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),

              // Arrow Icon
              Icon(
                Icons.arrow_forward_ios,
                color: AppColors.textTertiary,
                size: 12.sp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
