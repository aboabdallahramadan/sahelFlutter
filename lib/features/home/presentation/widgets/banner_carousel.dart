import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/services/api_service.dart';
import '../../providers/sliders_provider.dart';
import '../../models/slider_model.dart';

class BannerCarousel extends ConsumerStatefulWidget {
  const BannerCarousel({super.key});

  @override
  ConsumerState<BannerCarousel> createState() => _BannerCarouselState();
}

class _BannerCarouselState extends ConsumerState<BannerCarousel> {
  int _currentIndex = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    final slidersAsync = ref.watch(slidersProvider);

    return slidersAsync.when(
      data: (sliders) {
        if (sliders.isEmpty) {
          return const SizedBox.shrink();
        }

        return Column(
          children: [
            Stack(
              children: [
                CarouselSlider(
                  items: sliders
                      .map((slider) => _buildBannerItem(slider))
                      .toList(),
                  carouselController: _controller,
                  options: CarouselOptions(
                    height: 200.h,
                    viewportFraction: 1.0,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 5),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                  ),
                ),
                Positioned(
                  bottom: 20.h,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: sliders.asMap().entries.map((entry) {
                      return GestureDetector(
                        onTap: () => _controller.animateToPage(entry.key),
                        child: Container(
                          width: _currentIndex == entry.key ? 24.w : 8.w,
                          height: 8.h,
                          margin: EdgeInsets.symmetric(horizontal: 4.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
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
      },
      loading: () => _buildLoadingCarousel(),
      error: (error, stack) => const SizedBox.shrink(),
    );
  }

  Widget _buildBannerItem(SliderModel slider) {
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: '${ApiService.baseUrl}/uploads/${slider.imageUrl}',
          fit: BoxFit.cover,
          width: double.infinity,
          height: 200.h,
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
            child: Icon(
              Icons.error,
              color: AppColors.textTertiary,
              size: AppConstants.iconSizeLarge,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLoadingCarousel() {
    return Container(
      height: 200.h,
      color: AppColors.backgroundGray,
      child: const Center(
        child: CircularProgressIndicator(
          color: AppColors.primaryAccent,
        ),
      ),
    );
  }
}
