import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/models/ad_small.dart';
import '../../../../core/models/category.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../home/presentation/widgets/ad_card.dart';
import '../../providers/categories_provider.dart';

class SubcategoryScreen extends ConsumerStatefulWidget {
  final String subcategoryId;
  final String? categoryId;

  const SubcategoryScreen({
    super.key,
    required this.subcategoryId,
    this.categoryId,
  });

  @override
  ConsumerState<SubcategoryScreen> createState() => _SubcategoryScreenState();
}

class _SubcategoryScreenState extends ConsumerState<SubcategoryScreen> {
  // String _sortBy = 'newest';
  String _filterLocation = 'all';
  RangeValues _priceRange = const RangeValues(0, 10000);

  // Helper method to get localized category name
  String _getCategoryName(AppLocalizations l10n, String nameKey) {
    switch (nameKey) {
      case 'categoryVehicles':
        return l10n.categoriesVehicles;
      case 'categoryElectronics':
        return l10n.categoriesElectronics;
      case 'categoryFurniture':
        return l10n.categoriesFamilyNeeds; // Using family needs for furniture
      case 'categoryFashion':
        return l10n.categoriesOthers; // Using others for fashion
      case 'categoryGames':
        return l10n.categoriesOthers; // Using others for games
      case 'categorySports':
        return l10n.categoriesSport;
      case 'categoryMaterials':
        return l10n.categoriesOthers; // Using others for materials
      case 'categoryJobs':
        return l10n.categoriesJobs;
      case 'categoryServices':
        return l10n.categoriesServices;
      case 'categoryAnimals':
        return l10n.categoriesAnimals;
      case 'categoryOther':
        return l10n.categoriesOthers;
      default:
        return nameKey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final categories = ref.watch(categoriesProvider);

    // Determine if we're showing a specific subcategory or category
    final bool isSubcategoryView = widget.categoryId != null;

    // Find the category and subcategory
    Category category;
    SubCategory? subcategory;

    if (isSubcategoryView) {
      // Find category by categoryId and subcategory by subcategoryId
      category = categories.firstWhere(
        (cat) => cat.id == widget.categoryId,
        orElse: () => categories.first,
      );
      subcategory = category.subcategories.firstWhere(
        (sub) => sub.id == widget.subcategoryId,
        orElse: () => category.subcategories.isNotEmpty
            ? category.subcategories.first
            : const SubCategory(id: '', title: 'Unknown', image: ''),
      );
    } else {
      // Find the category by subcategory ID - for backward compatibility
      category = categories.firstWhere(
        (cat) => cat.id == widget.subcategoryId,
        orElse: () => categories.first,
      );
    }

    // Mock ads - in real app this would come from a provider
    final ads = _getMockAds();

    return Scaffold(
      backgroundColor: AppColors.primaryBg,
      appBar: AppBar(
        title: Text(isSubcategoryView
            ? subcategory?.title ?? category.title
            : category.title),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () => _showFilterBottomSheet(context),
          ),
        ],
      ),
      body: Column(
        children: [
          // Sort Bar
          Container(
            color: AppColors.backgroundWhite,
            padding: const EdgeInsets.all(AppConstants.spacing16),
            child: Row(
              children: [
                Text(
                  '${ads.length} ${l10n.commonAds}',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.textSecondary,
                      ),
                ),
                const Spacer(),
                // Sort Dropdown
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppConstants.spacing12,
                    vertical: AppConstants.spacing4,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.backgroundGray,
                    borderRadius:
                        BorderRadius.circular(AppConstants.radiusLarge),
                  ),
                  // child: DropdownButtonHideUnderline(
                  //   child: DropdownButton<String>(
                  //     value: _sortBy,
                  //     icon: const Icon(Icons.arrow_drop_down),
                  //     isDense: true,
                  //     items: [
                  //       DropdownMenuItem(
                  //         value: 'newest',
                  //         child: Text('Newest First'),
                  //       ),
                  //       DropdownMenuItem(
                  //         value: 'price_low',
                  //         child: Text('Price: Low to High'),
                  //       ),
                  //       DropdownMenuItem(
                  //         value: 'price_high',
                  //         child: Text('Price: High to Low'),
                  //       ),
                  //     ],
                  //     onChanged: (value) {
                  //       setState(() {
                  //         _sortBy = value!;
                  //       });
                  //     },
                  //   ),
                  // ),
                ),
              ],
            ),
          ),

          // Ads Grid
          Expanded(
            child: ads.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.inventory_2_outlined,
                          size: 64,
                          color: AppColors.textTertiary,
                        ),
                        const SizedBox(height: AppConstants.spacing16),
                        Text(
                          'No ads found',
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    color: AppColors.textSecondary,
                                  ),
                        ),
                        const SizedBox(height: AppConstants.spacing8),
                        Text(
                          'Try adjusting your filters',
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: AppColors.textTertiary,
                                  ),
                        ),
                      ],
                    ),
                  )
                : Container(
                    color: AppColors.backgroundWhite,
                    child: GridView.builder(
                      padding: const EdgeInsets.all(AppConstants.spacing16),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: AppConstants.spacing12,
                        mainAxisSpacing: AppConstants.spacing12,
                        childAspectRatio:
                            0.85, // Increased for more height to fit content properly
                      ),
                      itemCount: ads.length,
                      itemBuilder: (context, index) {
                        return AdCard(ad: ads[index]);
                      },
                    ),
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.goNamed('postAd');
        },
        backgroundColor: AppColors.primaryAccent,
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.backgroundWhite,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppConstants.radiusXLarge),
        ),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return DraggableScrollableSheet(
              initialChildSize: 0.7,
              minChildSize: 0.5,
              maxChildSize: 0.9,
              expand: false,
              builder: (context, scrollController) {
                return Padding(
                  padding: const EdgeInsets.all(AppConstants.spacing24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Handle
                      Center(
                        child: Container(
                          width: 40,
                          height: 4,
                          decoration: BoxDecoration(
                            color: AppColors.borderLight,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                      ),
                      const SizedBox(height: AppConstants.spacing24),

                      // Title
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Filters',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          TextButton(
                            onPressed: () {
                              setModalState(() {
                                _filterLocation = 'all';
                                _priceRange = const RangeValues(0, 10000);
                              });
                            },
                            child: const Text('Reset'),
                          ),
                        ],
                      ),
                      const SizedBox(height: AppConstants.spacing24),

                      Expanded(
                        child: ListView(
                          controller: scrollController,
                          children: [
                            // Location Filter
                            Text(
                              'Location',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            const SizedBox(height: AppConstants.spacing12),
                            Wrap(
                              spacing: AppConstants.spacing8,
                              children: [
                                _buildFilterChip(
                                  'All Qatar',
                                  _filterLocation == 'all',
                                  () => setModalState(
                                      () => _filterLocation = 'all'),
                                ),
                                _buildFilterChip(
                                  'Doha',
                                  _filterLocation == 'doha',
                                  () => setModalState(
                                      () => _filterLocation = 'doha'),
                                ),
                                _buildFilterChip(
                                  'Al Rayyan',
                                  _filterLocation == 'rayyan',
                                  () => setModalState(
                                      () => _filterLocation = 'rayyan'),
                                ),
                                _buildFilterChip(
                                  'Al Wakrah',
                                  _filterLocation == 'wakrah',
                                  () => setModalState(
                                      () => _filterLocation = 'wakrah'),
                                ),
                              ],
                            ),
                            const SizedBox(height: AppConstants.spacing32),

                            // Price Range
                            Text(
                              'Price Range (QAR)',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            const SizedBox(height: AppConstants.spacing12),
                            RangeSlider(
                              values: _priceRange,
                              min: 0,
                              max: 10000,
                              divisions: 20,
                              labels: RangeLabels(
                                _priceRange.start.toInt().toString(),
                                _priceRange.end.toInt().toString(),
                              ),
                              onChanged: (values) {
                                setModalState(() {
                                  _priceRange = values;
                                });
                              },
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'QAR ${_priceRange.start.toInt()}',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                Text(
                                  'QAR ${_priceRange.end.toInt()}',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      // Apply Button
                      const SizedBox(height: AppConstants.spacing24),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          setState(() {
                            // Apply filters
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryAccent,
                          padding: const EdgeInsets.symmetric(
                            vertical: AppConstants.spacing16,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(AppConstants.radiusLarge),
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            'Apply Filters',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        );
      },
    );
  }

  Widget _buildFilterChip(String label, bool isSelected, VoidCallback onTap) {
    return FilterChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (_) => onTap(),
      selectedColor: AppColors.primaryAccent.withOpacity(0.2),
      checkmarkColor: AppColors.primaryAccent,
    );
  }

  List<AdSmall> _getMockAds() {
    return [
      const AdSmall(
        id: '1',
        title: 'Toyota Camry 2022',
        price: 85000,
        image:
            'https://images.unsplash.com/photo-1621007947382-bb3c3994e3fb?w=400&h=400&fit=crop',
        comments: 3,
        likes: 12,
        location: 'Doha',
        timeAgo: '2 hours ago',
      ),
      const AdSmall(
        id: '2',
        title: 'Honda Accord 2021',
        price: 75000,
        image:
            'https://images.unsplash.com/photo-1619767886558-efdc259cde1a?w=400&h=400&fit=crop',
        comments: 5,
        likes: 20,
        location: 'Al Rayyan',
        timeAgo: '5 hours ago',
      ),
      const AdSmall(
        id: '3',
        title: 'Nissan Altima 2023',
        price: 65000,
        image:
            'https://images.unsplash.com/photo-1609521263047-f8f205293f24?w=400&h=400&fit=crop',
        comments: 2,
        likes: 8,
        location: 'Al Wakrah',
        timeAgo: '1 day ago',
      ),
    ];
  }
}
