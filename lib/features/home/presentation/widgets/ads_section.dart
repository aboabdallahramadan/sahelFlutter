import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/models/ad_small.dart';
import '../../../../l10n/app_localizations.dart';
import 'ad_card.dart';

class AdsSection extends ConsumerWidget {
  const AdsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);

    // Dummy data - in real app, this would come from a provider
    final ads = _getDummyAds();

    return Container(
      color: AppColors.backgroundWhite,
      padding: EdgeInsets.all(AppConstants.spacing16R),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Latest Ads',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                    ),
              ),
              TextButton(
                onPressed: () {
                  context.goNamed('categories');
                },
                child: Text(
                  'View All',
                  style: TextStyle(fontSize: 14.sp),
                ),
              ),
            ],
          ),
          SizedBox(height: AppConstants.spacing16R),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: AppConstants.spacing12R,
              mainAxisSpacing: AppConstants.spacing12R,
              childAspectRatio: 0.75, // Adjusted for fixed image height
            ),
            itemCount: ads.length,
            itemBuilder: (context, index) {
              return AdCard(ad: ads[index]);
            },
          ),
        ],
      ),
    );
  }

  List<AdSmall> _getDummyAds() {
    return [
      const AdSmall(
        id: '1',
        title: 'iPhone 14 Pro Max 256GB',
        price: 4500,
        image:
            'https://images.unsplash.com/photo-1696446701796-da61225697cc?w=400&h=400&fit=crop',
        comments: 5,
        likes: 15,
        location: 'Doha',
        timeAgo: '2 hours ago',
      ),
      const AdSmall(
        id: '2',
        title: 'Toyota Camry 2021',
        price: 85000,
        image:
            'https://images.unsplash.com/photo-1621007947382-bb3c3994e3fb?w=400&h=400&fit=crop',
        comments: 12,
        likes: 45,
        location: 'Al Wakrah',
        timeAgo: '5 hours ago',
      ),
      const AdSmall(
        id: '3',
        title: '2 BHK Apartment for Rent',
        price: 5500,
        image:
            'https://images.unsplash.com/photo-1522708323590-d24dbb6b0267?w=400&h=400&fit=crop',
        comments: 8,
        likes: 23,
        location: 'West Bay',
        timeAgo: '1 day ago',
      ),
      const AdSmall(
        id: '4',
        title: 'Gaming PC RTX 4090',
        price: 15000,
        image:
            'https://images.unsplash.com/photo-1587202372775-e229f172b9d7?w=400&h=400&fit=crop',
        comments: 3,
        likes: 18,
        location: 'Al Sadd',
        timeAgo: '2 days ago',
      ),
      const AdSmall(
        id: '5',
        title: 'Office Furniture Set',
        price: 2500,
        image:
            'https://images.unsplash.com/photo-1555041469-a586c61ea9bc?w=400&h=400&fit=crop',
        comments: 2,
        likes: 7,
        location: 'Industrial Area',
        timeAgo: '3 days ago',
      ),
      const AdSmall(
        id: '6',
        title: 'PlayStation 5 with Games',
        price: 2800,
        image:
            'https://images.unsplash.com/photo-1606813907291-d86efa9b94db?w=400&h=400&fit=crop',
        comments: 15,
        likes: 52,
        location: 'Al Rayyan',
        timeAgo: '3 days ago',
      ),
    ];
  }
}
