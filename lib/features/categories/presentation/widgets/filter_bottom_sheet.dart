import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../shared/providers/region_provider.dart';
import '../../../shared/models/region_model.dart';

class FilterBottomSheet extends ConsumerStatefulWidget {
  final int? selectedRegionId;
  final double? minPrice;
  final double? maxPrice;
  final Function(int?, double?, double?) onApplyFilters;

  const FilterBottomSheet({
    super.key,
    this.selectedRegionId,
    this.minPrice,
    this.maxPrice,
    required this.onApplyFilters,
  });

  @override
  ConsumerState<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends ConsumerState<FilterBottomSheet> {
  late int? _selectedRegionId;
  late TextEditingController _minPriceController;
  late TextEditingController _maxPriceController;

  @override
  void initState() {
    super.initState();
    _selectedRegionId = widget.selectedRegionId;
    _minPriceController = TextEditingController(
      text: widget.minPrice?.toString() ?? '',
    );
    _maxPriceController = TextEditingController(
      text: widget.maxPrice?.toString() ?? '',
    );
  }

  @override
  void dispose() {
    _minPriceController.dispose();
    _maxPriceController.dispose();
    super.dispose();
  }

  void _applyFilters() {
    final minPrice = _minPriceController.text.isEmpty
        ? null
        : double.tryParse(_minPriceController.text);
    final maxPrice = _maxPriceController.text.isEmpty
        ? null
        : double.tryParse(_maxPriceController.text);

    widget.onApplyFilters(_selectedRegionId, minPrice, maxPrice);
    Navigator.pop(context);
  }

  void _resetFilters() {
    setState(() {
      _selectedRegionId = null;
      _minPriceController.clear();
      _maxPriceController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final regionsAsync = ref.watch(regionsProvider);

    return Container(
      decoration: BoxDecoration(
        color: AppColors.backgroundWhite,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppConstants.radiusXLarge),
        ),
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Handle
            Container(
              margin: EdgeInsets.only(top: AppConstants.spacing8R),
              width: 40.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: AppColors.textTertiary.withOpacity(0.3),
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),

            // Header
            Padding(
              padding: EdgeInsets.all(AppConstants.spacing16R),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    l10n.commonFilters,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  TextButton(
                    onPressed: _resetFilters,
                    child: Text(
                      l10n.commonClearFilters,
                      style: TextStyle(
                        color: AppColors.error,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const Divider(height: 1),

            // Filters Content
            Flexible(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(AppConstants.spacing16R),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Region Filter
                    Text(
                      l10n.commonRegion,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    SizedBox(height: AppConstants.spacing12R),
                    regionsAsync.when(
                      data: (regions) => DropdownButtonFormField<int>(
                        value: _selectedRegionId,
                        decoration: InputDecoration(
                          hintText: l10n.commonSelectRegion,
                          filled: true,
                          fillColor: AppColors.backgroundGray,
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(AppConstants.radiusLarge),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: AppConstants.spacing16R,
                            vertical: AppConstants.spacing12R,
                          ),
                        ),
                        items: [
                          DropdownMenuItem<int>(
                            value: null,
                            child: Text(l10n.commonAllRegions),
                          ),
                          ...regions.map((region) => DropdownMenuItem<int>(
                                value: region.id,
                                child: Text(_buildRegionName(region, regions)),
                              )),
                        ],
                        onChanged: (value) {
                          setState(() {
                            _selectedRegionId = value;
                          });
                        },
                      ),
                      loading: () => const LinearProgressIndicator(),
                      error: (_, __) => const Text('Failed to load regions'),
                    ),

                    SizedBox(height: AppConstants.spacing24R),

                    // Price Range Filter
                    Text(
                      l10n.commonPriceRange,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    SizedBox(height: AppConstants.spacing12R),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _minPriceController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: l10n.commonMin,
                              filled: true,
                              fillColor: AppColors.backgroundGray,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    AppConstants.radiusLarge),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: AppConstants.spacing16R,
                                vertical: AppConstants.spacing12R,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: AppConstants.spacing16R),
                        Text(
                          '-',
                          style: TextStyle(
                            color: AppColors.textSecondary,
                            fontSize: 14.sp,
                          ),
                        ),
                        SizedBox(width: AppConstants.spacing16R),
                        Expanded(
                          child: TextField(
                            controller: _maxPriceController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: l10n.commonMax,
                              filled: true,
                              fillColor: AppColors.backgroundGray,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    AppConstants.radiusLarge),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: AppConstants.spacing16R,
                                vertical: AppConstants.spacing12R,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: AppConstants.spacing32R),
                  ],
                ),
              ),
            ),

            // Apply Button
            Container(
              padding: EdgeInsets.all(AppConstants.spacing16R),
              decoration: BoxDecoration(
                color: AppColors.backgroundWhite,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.shadowLight,
                    blurRadius: 10,
                    offset: const Offset(0, -5),
                  ),
                ],
              ),
              child: ElevatedButton(
                onPressed: _applyFilters,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryAccent,
                  minimumSize: const Size(double.infinity, 48),
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(AppConstants.radiusLarge),
                  ),
                ),
                child: Text(
                  l10n.commonApplyFilters,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _buildRegionName(RegionModel region, List<RegionModel> allRegions) {
    if (region.parentId == null) {
      return region.name;
    }

    // Build hierarchical name
    final parent = allRegions.firstWhere(
      (r) => r.id == region.parentId,
      orElse: () => region,
    );

    if (parent.id == region.id) {
      return region.name;
    }

    return '${parent.name} > ${region.name}';
  }
}
