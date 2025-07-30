import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/models/ad.dart';
import '../../../../core/models/ad_details.dart';
import '../../../../core/models/ad_user.dart';
import '../../../../core/models/ad_comment.dart';
import '../../../../core/models/ad_small.dart';
import '../../../../core/models/extra_info.dart';
import '../../../../l10n/app_localizations.dart';
import '../widgets/ad_images_gallery.dart';
import '../widgets/ad_info_section.dart';
import '../widgets/user_profile_card.dart';
import '../widgets/similar_ads_section.dart';
import '../widgets/comments_section.dart';

class AdDetailsScreen extends ConsumerWidget {
  final String adId;

  const AdDetailsScreen({super.key, required this.adId});

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      // Handle error - show snackbar or dialog
      debugPrint('Could not launch phone call to $phoneNumber');
    }
  }

  void _navigateToChat(BuildContext context, String adId, String sellerId) {
    // Generate a unique chat ID based on ad and seller
    final chatId = '${adId}_$sellerId';
    context.goNamed('chat', pathParameters: {'chatId': chatId});
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);

    // In real app, this would come from a provider
    final ad = _getDummyAd();

    return Scaffold(
      backgroundColor: AppColors.primaryBg,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {
              // TODO: Implement favorite
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Image Gallery
            AdImagesGallery(images: ad.images),

            Container(
              color: AppColors.backgroundWhite,
              child: Column(
                children: [
                  // Ad Information
                  AdInfoSection(adDetails: ad.adDetails),

                  const Divider(),

                  // User Profile Card
                  UserProfileCard(user: ad.user),

                  const Divider(),

                  // Similar Ads
                  SimilarAdsSection(ads: ad.similarAds),

                  const Divider(),

                  // Comments Section
                  CommentsSection(comments: ad.comments),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(AppConstants.spacing16),
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
        child: Row(
          children: [
            Expanded(
              child: OutlinedButton.icon(
                onPressed: ad.user.phoneNumber != null
                    ? () => _makePhoneCall(ad.user.phoneNumber!)
                    : null,
                icon: const Icon(Icons.phone),
                label: const Text('Call'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.primaryAccent,
                  side: const BorderSide(color: AppColors.primaryAccent),
                  padding: const EdgeInsets.symmetric(
                    vertical: AppConstants.spacing12,
                  ),
                ),
              ),
            ),
            const SizedBox(width: AppConstants.spacing12),
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () => _navigateToChat(context, adId, ad.user.id),
                icon: const Icon(Icons.chat_bubble_outline),
                label: const Text('Chat'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryAccent,
                  padding: const EdgeInsets.symmetric(
                    vertical: AppConstants.spacing12,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Ad _getDummyAd() {
    return Ad(
      id: '1',
      images: [
        'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=800&h=600&fit=crop',
        'https://images.unsplash.com/photo-1549924231-f129b911e442?w=800&h=600&fit=crop',
      ],
      adDetails: AdDetails(
        title: 'Hiring driver. snoonu. carcon',
        price: 6000,
        category: 'Jobs',
        subcategory: 'Drivers',
        location: 'Doha',
        timeAgo: '1 week ago',
        extraInfo: [
          ExtraInfo(name: 'Ad Type', value: 'Job Offer'),
          ExtraInfo(name: 'Gender', value: 'Both'),
          ExtraInfo(name: 'Nationality', value: 'Any'),
          ExtraInfo(name: 'Experience', value: '3 years'),
          ExtraInfo(name: 'Salary', value: 'Commission'),
        ],
        likes: 5,
        views: 15482,
        description:
            'Hiring male and female drivers with their own cars. Quick registration. Reliable delivery services at Al-Hadaf Delivery Services Company. Available Jobs: Drivers with their own cars 200 vacancies. Application fee: 14 riyals.',
      ),
      user: AdUser(
        id: '1',
        name: 'Mohammad Al-Haj',
        avatar:
            'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=50&h=50&fit=crop&crop=face',
        memberSince: '11 months ago',
        phoneNumber: '74036872',
      ),
      comments: [
        AdComment(
          id: '1',
          user: CommentUser(
            name: 'Abdul Faheem',
            avatar:
                'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=50&h=50&fit=crop&crop=face',
          ),
          comment: '74036872',
          timeAgo: '23 hours ago',
        ),
        AdComment(
          id: '2',
          user: CommentUser(
            name: 'MUHAMMAD HAYAT',
            avatar:
                'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=50&h=50&fit=crop&crop=face',
          ),
          comment: 'Interested in this position',
          timeAgo: '1 day ago',
        ),
      ],
      similarAds: [
        AdSmall(
          id: '1',
          title: 'Hiring driver. snoonu. carcon',
          price: 6000,
          image:
              'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=400&fit=crop',
          comments: 10,
          likes: 100,
        ),
        AdSmall(
          id: '2',
          title: 'Driver needed for delivery',
          price: 5500,
          image:
              'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=400&fit=crop',
          comments: 5,
          likes: 50,
        ),
      ],
    );
  }
}
