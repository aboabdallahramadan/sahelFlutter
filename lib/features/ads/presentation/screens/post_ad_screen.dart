import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../../../../l10n/app_localizations.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../features/categories/providers/categories_api_provider.dart';
import '../../../../features/categories/models/category_tree_model.dart';
import '../../../../features/auth/providers/auth_provider.dart';
import '../../../shared/providers/region_provider.dart';
import '../../../shared/models/region_model.dart';
import '../../services/ads_service.dart';
import '../../../home/providers/offers_provider.dart';

class PostAdScreen extends ConsumerStatefulWidget {
  const PostAdScreen({super.key});

  @override
  ConsumerState<PostAdScreen> createState() => _PostAdScreenState();
}

class _PostAdScreenState extends ConsumerState<PostAdScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _priceController = TextEditingController();

  int? _selectedCategoryId;
  int? _selectedRegionId;
  final List<File> _images = [];
  final ImagePicker _picker = ImagePicker();
  bool _isLoading = false;

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    if (_images.length >= 10) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Maximum 10 images allowed'),
        ),
      );
      return;
    }

    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _images.add(File(image.path));
      });
    }
  }

  void _removeImage(int index) {
    setState(() {
      _images.removeAt(index);
    });
  }

  Future<void> _submitAd() async {
    final authState = ref.read(authProvider);
    if (!authState.isAuthenticated) {
      if (mounted) context.goNamed('login');
      return;
    }

    if (_formKey.currentState!.validate()) {
      if (_selectedCategoryId == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please select a category'),
          ),
        );
        return;
      }

      if (_selectedRegionId == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please select a region'),
          ),
        );
        return;
      }

      if (_images.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please add at least one image'),
          ),
        );
        return;
      }

      setState(() {
        _isLoading = true;
      });

      try {
        final service = ref.read(adsServiceProvider);
        final price = double.parse(_priceController.text);
        final response = await service.createOffer(
          name: _titleController.text.trim(),
          description: _descriptionController.text.trim(),
          price: price,
          categoryId: _selectedCategoryId!,
          regionId: _selectedRegionId!,
          images: _images,
        );

        if (!mounted) return;

        setState(() {
          _isLoading = false;
        });

        if (response.success) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Ad posted successfully!'),
              backgroundColor: AppColors.success,
            ),
          );
          // Refresh offers before navigating
          await ref.read(offersProvider.notifier).refresh();
          if (mounted) context.go('/');
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(response.message),
              backgroundColor: AppColors.error,
            ),
          );
        }
      } catch (e) {
        if (!mounted) return;
        setState(() {
          _isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.toString()),
            backgroundColor: AppColors.error,
          ),
        );
      }
    }
  }

  // No-op

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);
    if (!authState.isAuthenticated) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) context.goNamed('login');
      });
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final l10n = AppLocalizations.of(context);
    final categoriesAsync = ref.watch(categoriesApiProvider);
    final regionsAsync = ref.watch(regionsProvider);

    return Scaffold(
      backgroundColor: AppColors.primaryBg,
      appBar: AppBar(
        title: Text(l10n.commonPostNewAd),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => context.pop(),
        ),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Images Section
              Container(
                color: AppColors.backgroundWhite,
                padding: const EdgeInsets.all(AppConstants.spacing16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.commonPhotos,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: AppConstants.spacing8),
                    Text(
                      l10n.commonAddUpTo10Photos,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColors.textSecondary,
                          ),
                    ),
                    const SizedBox(height: AppConstants.spacing16),

                    // Image Grid
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: AppConstants.spacing8,
                        mainAxisSpacing: AppConstants.spacing8,
                      ),
                      itemCount: _images.length + 1,
                      itemBuilder: (context, index) {
                        if (index == _images.length) {
                          return InkWell(
                            onTap: _pickImage,
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColors.backgroundGray,
                                borderRadius: BorderRadius.circular(
                                    AppConstants.radiusMedium),
                                border: Border.all(
                                  color: AppColors.borderLight,
                                  style: BorderStyle.solid,
                                  width: 2,
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.add_photo_alternate,
                                    size: 32,
                                    color: AppColors.textSecondary,
                                  ),
                                  const SizedBox(height: AppConstants.spacing4),
                                  Text(
                                    l10n.commonAddPhoto,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                          color: AppColors.textSecondary,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }

                        return Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    AppConstants.radiusMedium),
                                image: DecorationImage(
                                  image: FileImage(_images[index]),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 4,
                              right: 4,
                              child: GestureDetector(
                                onTap: () => _removeImage(index),
                                child: Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.6),
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.close,
                                    size: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            if (index == 0)
                              Positioned(
                                bottom: 4,
                                left: 4,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: AppConstants.spacing8,
                                    vertical: AppConstants.spacing4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.primaryAccent,
                                    borderRadius: BorderRadius.circular(
                                        AppConstants.radiusSmall),
                                  ),
                                  child: const Text(
                                    'Main',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppConstants.spacing8),

              // Ad Details Section
              Container(
                color: AppColors.backgroundWhite,
                padding: const EdgeInsets.all(AppConstants.spacing16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ad Details',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: AppConstants.spacing16),

                    // Category Dropdown (from API)
                    categoriesAsync.when(
                      data: (categories) => DropdownButtonFormField<int>(
                        value: _selectedCategoryId,
                        decoration: InputDecoration(
                          labelText: l10n.commonCategory,
                          hintText: l10n.commonEnterYourCategory,
                          filled: true,
                          fillColor: AppColors.backgroundGray,
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(AppConstants.radiusLarge),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        items: _buildCategoryDropdownItems(categories),
                        onChanged: (value) {
                          setState(() {
                            _selectedCategoryId = value;
                          });
                        },
                        validator: (value) {
                          if (value == null) {
                            return 'Please select a subcategory';
                          }
                          return null;
                        },
                      ),
                      loading: () =>
                          const LinearProgressIndicator(minHeight: 2),
                      error: (e, st) => const Text('Failed to load categories'),
                    ),
                    const SizedBox(height: AppConstants.spacing16),

                    // Region Dropdown
                    regionsAsync.when(
                      data: (regions) => DropdownButtonFormField<int>(
                        value: _selectedRegionId,
                        decoration: InputDecoration(
                          labelText: l10n.commonRegion,
                          hintText: l10n.commonEnterYourRegion,
                          filled: true,
                          fillColor: AppColors.backgroundGray,
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(AppConstants.radiusLarge),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        items: regions
                            .map((r) => DropdownMenuItem(
                                  value: r.id,
                                  child: Text(_buildRegionName(r, regions)),
                                ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedRegionId = value;
                          });
                        },
                        validator: (value) {
                          if (value == null) {
                            return 'Please select a region';
                          }
                          return null;
                        },
                      ),
                      loading: () =>
                          const LinearProgressIndicator(minHeight: 2),
                      error: (e, st) => const Text('Failed to load regions'),
                    ),
                    const SizedBox(height: AppConstants.spacing16),

                    // Title
                    TextFormField(
                      controller: _titleController,
                      decoration: InputDecoration(
                        labelText: l10n.commonTitle,
                        hintText: l10n.commonEnterYourTitle,
                        filled: true,
                        fillColor: AppColors.backgroundGray,
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(AppConstants.radiusLarge),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a title';
                        }
                        if (value.length < 5) {
                          return 'Title must be at least 5 characters';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: AppConstants.spacing16),

                    // Price
                    TextFormField(
                      controller: _priceController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: l10n.commonPrice,
                        hintText: l10n.commonEnterYourPrice,
                        filled: true,
                        fillColor: AppColors.backgroundGray,
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(AppConstants.radiusLarge),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a price';
                        }
                        if (double.tryParse(value) == null) {
                          return 'Please enter a valid number';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: AppConstants.spacing16),

                    // Description
                    TextFormField(
                      controller: _descriptionController,
                      maxLines: 5,
                      decoration: InputDecoration(
                        labelText: l10n.commonDescription,
                        hintText: l10n.commonEnterYourDescription,
                        alignLabelWithHint: true,
                        filled: true,
                        fillColor: AppColors.backgroundGray,
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(AppConstants.radiusLarge),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a description';
                        }
                        if (value.length < 20) {
                          return 'Description must be at least 20 characters';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppConstants.spacing24),

              // Submit Button
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppConstants.spacing16),
                child: ElevatedButton(
                  onPressed: _isLoading ? null : () => _submitAd(),
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
                  child: _isLoading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              AppColors.textWhite,
                            ),
                          ),
                        )
                      : const Text(
                          'Post Ad',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                ),
              ),
              const SizedBox(height: AppConstants.spacing32),
            ],
          ),
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

  List<DropdownMenuItem<int>> _buildCategoryDropdownItems(
      List<CategoryTreeModel> categories) {
    final List<DropdownMenuItem<int>> items = [];

    for (final category in categories) {
      // Add category header (disabled)
      items.add(DropdownMenuItem<int>(
        value: null,
        enabled: false,
        child: Text(
          category.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.textSecondary,
          ),
        ),
      ));

      // Add subcategories (selectable)
      for (final subcategory in category.subCategories) {
        items.add(DropdownMenuItem<int>(
          value: subcategory.id,
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(subcategory.name),
          ),
        ));
      }
    }

    return items;
  }
}
