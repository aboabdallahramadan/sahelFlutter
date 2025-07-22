import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_constants.dart';

class BannerCarousel extends StatefulWidget {
  const BannerCarousel({super.key});

  @override
  State<BannerCarousel> createState() => _BannerCarouselState();
}

class _BannerCarouselState extends State<BannerCarousel> {
  int _currentIndex = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  final List<Map<String, String>> banners = [
    {
      'image': 'https://images.unsplash.com/photo-1605629921711-2f6b00c6bbf4?w=1920&h=600&fit=crop',
      'title': 'Welcome to Sahal',
      'subtitle': 'Find amazing deals in Qatar',
    },
    {
      'image': 'https://images.unsplash.com/photo-1556742049-0cfed4f6a45d?w=1920&h=600&fit=crop',
      'title': 'Sell Anything',
      'subtitle': 'Post your ad in minutes',
    },
    {
      'image': 'https://images.unsplash.com/photo-1567189022630-7907afc46c31?w=1920&h=600&fit=crop',
      'title': 'Safe & Secure',
      'subtitle': 'Buy and sell with confidence',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            CarouselSlider(
              items: banners.map((banner) => _buildBannerItem(banner)).toList(),
              carouselController: _controller,
              options: CarouselOptions(
                height: 200,
                viewportFraction: 1.0,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 5),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
            ),
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: banners.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => _controller.animateToPage(entry.key),
                    child: Container(
                      width: _currentIndex == entry.key ? 24.0 : 8.0,
                      height: 8.0,
                      margin: const EdgeInsets.symmetric(horizontal: 4.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        color: _currentIndex == entry.key
                            ? AppColors.textWhite
                            : AppColors.textWhite.withOpacity(0.4),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBannerItem(Map<String, String> banner) {
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: banner['image']!,
          fit: BoxFit.cover,
          width: double.infinity,
          height: 200,
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
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.black.withOpacity(0.6),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 30,
          left: 20,
          right: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                banner['title']!,
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  color: AppColors.textWhite,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: AppConstants.spacing8),
              Text(
                banner['subtitle']!,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppColors.textWhite,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
} 