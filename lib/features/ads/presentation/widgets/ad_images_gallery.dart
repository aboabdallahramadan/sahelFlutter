import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_constants.dart';

class AdImagesGallery extends StatefulWidget {
  final List<String> images;

  const AdImagesGallery({super.key, required this.images});

  @override
  State<AdImagesGallery> createState() => _AdImagesGalleryState();
}

class _AdImagesGalleryState extends State<AdImagesGallery> {
  int _currentIndex = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    if (widget.images.isEmpty) {
      return Container(
        height: 300,
        color: AppColors.backgroundGray,
        child: const Center(
          child: Icon(
            Icons.image_not_supported,
            size: 64,
            color: AppColors.textTertiary,
          ),
        ),
      );
    }

    return Stack(
      children: [
        CarouselSlider(
          items: widget.images.map((image) => _buildImageItem(image)).toList(),
          carouselController: _controller,
          options: CarouselOptions(
            height: 300,
            viewportFraction: 1.0,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
        
        // Indicators
        if (widget.images.length > 1)
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: widget.images.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => _controller.animateToPage(entry.key),
                  child: Container(
                    width: 8.0,
                    height: 8.0,
                    margin: const EdgeInsets.symmetric(horizontal: 4.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentIndex == entry.key
                          ? AppColors.textWhite
                          : AppColors.textWhite.withOpacity(0.4),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        
        // Image Counter
        Positioned(
          top: 20,
          right: 20,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.spacing12,
              vertical: AppConstants.spacing8,
            ),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.6),
              borderRadius: BorderRadius.circular(AppConstants.radiusCircular),
            ),
            child: Text(
              '${_currentIndex + 1}/${widget.images.length}',
              style: const TextStyle(
                color: AppColors.textWhite,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildImageItem(String imageUrl) {
    return GestureDetector(
      onTap: () {
        // TODO: Open full screen gallery
      },
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.cover,
        width: double.infinity,
        height: 300,
        placeholder: (context, url) => Container(
          color: AppColors.backgroundGray,
          child: const Center(
            child: CircularProgressIndicator(
              color: AppColors.primaryAccent,
            ),
          ),
        ),
        errorWidget: (context, url, error) => Container(
          color: AppColors.backgroundGray,
          child: const Icon(
            Icons.error,
            color: AppColors.textTertiary,
            size: 48,
          ),
        ),
      ),
    );
  }
} 