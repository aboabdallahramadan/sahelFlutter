import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/models/ad_small.dart';
import '../../../../core/services/api_service.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/widgets/refresh_wrapper.dart';
import '../../../../features/home/models/offer_model.dart';
import '../../../../features/home/presentation/widgets/ad_card.dart';
import '../../providers/subcategory_offers_provider.dart';
import '../widgets/filter_bottom_sheet.dart';

class SubcategoryScreen extends ConsumerStatefulWidget {
  final String categoryId;
  final String title;

  const SubcategoryScreen({
    super.key,
    required this.categoryId,
    required this.title,
  });

  @override
  ConsumerState<SubcategoryScreen> createState() => _SubcategoryScreenState();
}

class _SubcategoryScreenState extends ConsumerState<SubcategoryScreen> {
  // Filter values
  int? selectedRegionId;
  double? minPrice;
  double? maxPrice;
  String? searchTerm;
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  AdSmall _convertOfferToAdSmall(OfferModel offer) {
    return AdSmall(
      id: offer.id.toString(),
      title: offer.name,
      price: offer.price,
      image: '${ApiService.baseUrl}/uploads/${offer.mainImageUrl}',
      comments: offer.numberOfComments,
      likes: offer.numberOfFavorites,
      location: offer.regionName,
      timeAgo: timeago.format(offer.createdAt),
    );
  }

  void _showFilterBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => FilterBottomSheet(
        selectedRegionId: selectedRegionId,
        minPrice: minPrice,
        maxPrice: maxPrice,
        onApplyFilters: (regionId, min, max) {
          setState(() {
            selectedRegionId = regionId;
            minPrice = min;
            maxPrice = max;
          });
          // Refresh the offers with new filters
          final params = SubcategoryFilterParams(
            categoryId: int.parse(widget.categoryId),
            regionId: regionId,
            minPrice: min,
            maxPrice: max,
            searchTerm: searchTerm,
          );
          ref.invalidate(subcategoryOffersProvider(params));
        },
      ),
    );
  }

  void _clearFilters() {
    setState(() {
      selectedRegionId = null;
      minPrice = null;
      maxPrice = null;
      searchTerm = null;
      _searchController.clear();
    });
    final params = SubcategoryFilterParams(
      categoryId: int.parse(widget.categoryId),
    );
    ref.invalidate(subcategoryOffersProvider(params));
  }

  bool get hasActiveFilters {
    return selectedRegionId != null ||
        minPrice != null ||
        maxPrice != null ||
        (searchTerm != null && searchTerm!.isNotEmpty);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final categoryIdInt = int.parse(widget.categoryId);

    // Create filter parameters
    final filterParams = SubcategoryFilterParams(
      categoryId: categoryIdInt,
      regionId: selectedRegionId,
      minPrice: minPrice,
      maxPrice: maxPrice,
      searchTerm: searchTerm,
    );

    final offersState = ref.watch(subcategoryOffersProvider(filterParams));

    return Scaffold(
      backgroundColor: AppColors.primaryBg,
      appBar: AppBar(
        title: Text(widget.title),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        actions: [
          IconButton(
            icon: Stack(
              children: [
                const Icon(Icons.filter_list),
                if (hasActiveFilters)
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: AppColors.error,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
              ],
            ),
            onPressed: _showFilterBottomSheet,
          ),
        ],
      ),
      body: Column(
        children: [
          // Search Bar
          Container(
            color: AppColors.backgroundWhite,
            padding: EdgeInsets.all(AppConstants.spacing16R),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: l10n.commonSearchAds,
                      prefixIcon: const Icon(Icons.search),
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
                    onSubmitted: (value) {
                      setState(() {
                        searchTerm = value.isEmpty ? null : value;
                      });
                      ref.invalidate(subcategoryOffersProvider(filterParams));
                    },
                  ),
                ),
                if (hasActiveFilters) ...[
                  SizedBox(width: AppConstants.spacing8R),
                  TextButton(
                    onPressed: _clearFilters,
                    child: Text(
                      l10n.commonClearFilters,
                      style: TextStyle(
                        color: AppColors.error,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),

          // Active Filters Display
          if (hasActiveFilters)
            Container(
              color: AppColors.backgroundWhite,
              padding: EdgeInsets.symmetric(
                horizontal: AppConstants.spacing16R,
                vertical: AppConstants.spacing8R,
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    if (selectedRegionId != null)
                      _buildFilterChip(
                        label: l10n.commonRegion,
                        onRemove: () {
                          setState(() {
                            selectedRegionId = null;
                          });
                          ref.invalidate(
                              subcategoryOffersProvider(filterParams));
                        },
                      ),
                    if (minPrice != null || maxPrice != null)
                      _buildFilterChip(
                        label:
                            '${l10n.commonPrice}: ${minPrice ?? 0} - ${maxPrice ?? '∞'} SAR',
                        onRemove: () {
                          setState(() {
                            minPrice = null;
                            maxPrice = null;
                          });
                          ref.invalidate(
                              subcategoryOffersProvider(filterParams));
                        },
                      ),
                    if (searchTerm != null && searchTerm!.isNotEmpty)
                      _buildFilterChip(
                        label: '${l10n.commonSearchAds}: "$searchTerm"',
                        onRemove: () {
                          setState(() {
                            searchTerm = null;
                            _searchController.clear();
                          });
                          ref.invalidate(
                              subcategoryOffersProvider(filterParams));
                        },
                      ),
                  ],
                ),
              ),
            ),

          // Offers List
          Expanded(
            child: RefreshWrapper(
              onRefresh: () async {
                // Refresh the offers list
                await ref
                    .refresh(subcategoryOffersProvider(filterParams).notifier)
                    .refresh();
              },
              child: Container(
                color: AppColors.backgroundWhite,
                padding: EdgeInsets.all(AppConstants.spacing16R),
                child: _buildOffersList(offersState, l10n, filterParams),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip({
    required String label,
    required VoidCallback onRemove,
  }) {
    return Container(
      margin: EdgeInsets.only(right: AppConstants.spacing8R),
      child: Chip(
        label: Text(
          label,
          style: TextStyle(fontSize: 12.sp),
        ),
        deleteIcon: Icon(
          Icons.close,
          size: 16.sp,
        ),
        onDeleted: onRemove,
        backgroundColor: AppColors.primaryAccent.withOpacity(0.1),
        side: BorderSide(
          color: AppColors.primaryAccent.withOpacity(0.3),
        ),
      ),
    );
  }

  Widget _buildOffersList(
    OffersState offersState,
    AppLocalizations l10n,
    SubcategoryFilterParams filterParams,
  ) {
    if (offersState.error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 48.sp,
              color: AppColors.error,
            ),
            SizedBox(height: AppConstants.spacing8R),
            Text(
              offersState.error!,
              style: TextStyle(
                color: AppColors.error,
                fontSize: 14.sp,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: AppConstants.spacing16R),
            OutlinedButton(
              onPressed: () {
                ref
                    .read(subcategoryOffersProvider(filterParams).notifier)
                    .refresh();
              },
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    if (offersState.offers.isEmpty && offersState.isLoading) {
      return const Center(
        child: CircularProgressIndicator(
          color: AppColors.primaryAccent,
        ),
      );
    }

    if (offersState.offers.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.inventory_2_outlined,
              size: 64.sp,
              color: AppColors.textTertiary,
            ),
            SizedBox(height: AppConstants.spacing16R),
            Text(
              'No ads found',
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: 16.sp,
              ),
            ),
            if (hasActiveFilters) ...[
              SizedBox(height: AppConstants.spacing8R),
              TextButton(
                onPressed: _clearFilters,
                child: Text(
                  'Clear filters and try again',
                  style: TextStyle(
                    color: AppColors.primaryAccent,
                    fontSize: 14.sp,
                  ),
                ),
              ),
            ],
          ],
        ),
      );
    }

    return Column(
      children: [
        Expanded(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: AppConstants.spacing12R,
              mainAxisSpacing: AppConstants.spacing12R,
              childAspectRatio: 0.85,
            ),
            itemCount: offersState.offers.length,
            itemBuilder: (context, index) {
              final ad = _convertOfferToAdSmall(offersState.offers[index]);
              return AdCard(ad: ad);
            },
          ),
        ),
        if (offersState.hasMore) ...[
          SizedBox(height: AppConstants.spacing16R),
          Center(
            child: offersState.isLoading
                ? const CircularProgressIndicator(
                    color: AppColors.primaryAccent,
                  )
                : OutlinedButton(
                    onPressed: () {
                      ref
                          .read(
                              subcategoryOffersProvider(filterParams).notifier)
                          .loadMoreOffers();
                    },
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: 32.w,
                        vertical: 12.h,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    child: Text(
                      l10n.commonSeeMore,
                      style: TextStyle(fontSize: 14.sp),
                    ),
                  ),
          ),
        ],
      ],
    );
  }
}
