import 'dart:async';

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
import '../../models/offer_model.dart';
import '../widgets/ad_card.dart';
import '../../providers/search_offers_provider.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  final _searchController = TextEditingController();
  Timer? _debounce;

  @override
  void dispose() {
    _searchController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  void _onSearchChanged(String value) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      ref.read(searchOffersProvider.notifier).updateSearchTerm(value.trim());
    });
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

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final searchState = ref.watch(searchOffersProvider);

    return Scaffold(
      backgroundColor: AppColors.primaryBg,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        title: TextField(
          controller: _searchController,
          autofocus: true,
          decoration: InputDecoration(
            hintText: l10n.commonSearchAds,
            border: InputBorder.none,
            hintStyle: TextStyle(
              color: AppColors.textSecondary,
              fontSize: 16.sp,
            ),
          ),
          style: TextStyle(
            fontSize: 16.sp,
          ),
          onChanged: _onSearchChanged,
          textInputAction: TextInputAction.search,
        ),
        actions: [
          if (_searchController.text.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () {
                _searchController.clear();
                ref.read(searchOffersProvider.notifier).updateSearchTerm('');
              },
            ),
        ],
      ),
      body: Builder(
        builder: (context) {
          if (searchState.searchTerm.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.search,
                    size: 64.sp,
                    color: AppColors.textTertiary,
                  ),
                  SizedBox(height: AppConstants.spacing16R),
                  Text(
                    l10n.commonStartTypingToSearch,
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 16.sp,
                    ),
                  ),
                ],
              ),
            );
          }

          if (searchState.error != null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    size: 48.sp,
                    color: AppColors.error,
                  ),
                  SizedBox(height: AppConstants.spacing16R),
                  Text(
                    l10n.commonErrorLoadingSearchResults,
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 16.sp,
                    ),
                  ),
                  SizedBox(height: AppConstants.spacing8R),
                  Text(
                    searchState.error!,
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 14.sp,
                    ),
                  ),
                  SizedBox(height: AppConstants.spacing16R),
                  OutlinedButton(
                    onPressed: () {
                      ref.read(searchOffersProvider.notifier).refresh();
                    },
                    child: Text(l10n.commonRetry),
                  ),
                ],
              ),
            );
          }

          if (searchState.isLoading && searchState.offers.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryAccent,
              ),
            );
          }

          if (searchState.offers.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.search_off,
                    size: 64.sp,
                    color: AppColors.textTertiary,
                  ),
                  SizedBox(height: AppConstants.spacing16R),
                  Text(
                    l10n.commonNoResultsFound,
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: AppConstants.spacing8R),
                  Text(
                    l10n.commonTrySearchingForSomethingElse,
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
            );
          }

          return CustomScrollView(
            slivers: [
              // Results count
              SliverToBoxAdapter(
                child: Container(
                  padding: EdgeInsets.all(AppConstants.spacing16R),
                  child: Text(
                    '${searchState.offers.length} ${l10n.commonResultsFound}',
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              ),

              // Grid of ads
              SliverPadding(
                padding:
                    EdgeInsets.symmetric(horizontal: AppConstants.spacing16R),
                sliver: SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: AppConstants.spacing12R,
                    mainAxisSpacing: AppConstants.spacing12R,
                    childAspectRatio: 0.75,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final ad =
                          _convertOfferToAdSmall(searchState.offers[index]);
                      return AdCard(ad: ad);
                    },
                    childCount: searchState.offers.length,
                  ),
                ),
              ),

              // Load more button
              if (searchState.hasMore)
                SliverToBoxAdapter(
                  child: Container(
                    padding: EdgeInsets.all(AppConstants.spacing16R),
                    child: Center(
                      child: searchState.isLoading
                          ? const CircularProgressIndicator(
                              color: AppColors.primaryAccent,
                            )
                          : OutlinedButton(
                              onPressed: () {
                                ref
                                    .read(searchOffersProvider.notifier)
                                    .loadMoreOffers();
                              },
                              style: OutlinedButton.styleFrom(
                                foregroundColor: AppColors.primaryAccent,
                                side: const BorderSide(
                                    color: AppColors.primaryAccent),
                                padding: EdgeInsets.symmetric(
                                  horizontal: AppConstants.spacing32R,
                                  vertical: AppConstants.spacing12R,
                                ),
                              ),
                              child: Text(l10n.commonSeeMore),
                            ),
                    ),
                  ),
                ),

              // Bottom padding
              SliverToBoxAdapter(
                child: SizedBox(height: AppConstants.spacing24R),
              ),
            ],
          );
        },
      ),
    );
  }
}
