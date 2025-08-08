import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/models/ad_small.dart';
import '../../../../core/services/api_service.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../home/presentation/widgets/ad_card.dart';
import '../../../auth/providers/auth_provider.dart';
import '../../providers/favorites_provider.dart';

class FavoritesScreen extends ConsumerStatefulWidget {
  const FavoritesScreen({super.key});

  @override
  ConsumerState<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends ConsumerState<FavoritesScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);

    // Check authentication and load favorites after the first frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkAuthAndLoadFavorites();
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      ref.read(favoritesProvider.notifier).loadMoreFavorites();
    }
  }

  Future<void> _checkAuthAndLoadFavorites() async {
    final authState = ref.read(authProvider);

    if (!authState.isAuthenticated) {
      // Redirect to login
      if (mounted) {
        context.goNamed('login');
      }
    } else {
      // Load favorites
      ref.read(favoritesProvider.notifier).loadFavorites();
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final authState = ref.watch(authProvider);
    final favoritesState = ref.watch(favoritesProvider);

    // Check authentication
    if (!authState.isAuthenticated) {
      return Scaffold(
        backgroundColor: AppColors.primaryBg,
        appBar: AppBar(
          title: Text(l10n.profileFavorites),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => context.pop(),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.lock_outline,
                size: 64,
                color: AppColors.textTertiary,
              ),
              const SizedBox(height: AppConstants.spacing16),
              Text(
                'Sign in to view favorites',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: AppColors.textSecondary,
                    ),
              ),
              const SizedBox(height: AppConstants.spacing24),
              ElevatedButton(
                onPressed: () {
                  context.goNamed('login');
                },
                child: const Text('Sign In'),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: AppColors.primaryBg,
      appBar: AppBar(
        title: Text(l10n.profileFavorites),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        actions: [
          if (favoritesState.offers.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () {
                ref.read(favoritesProvider.notifier).refresh();
              },
            ),
        ],
      ),
      body: Builder(
        builder: (context) {
          // Loading state
          if (favoritesState.isLoading && favoritesState.offers.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          // Error state
          if (favoritesState.error != null && favoritesState.offers.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    size: 64,
                    color: AppColors.error,
                  ),
                  const SizedBox(height: AppConstants.spacing16),
                  Text(
                    'Error loading favorites',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: AppColors.textSecondary,
                        ),
                  ),
                  const SizedBox(height: AppConstants.spacing8),
                  Text(
                    favoritesState.error!,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.textTertiary,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: AppConstants.spacing24),
                  ElevatedButton(
                    onPressed: () {
                      ref.read(favoritesProvider.notifier).refresh();
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          // Empty state
          if (favoritesState.offers.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.favorite_border,
                    size: 64,
                    color: AppColors.textTertiary,
                  ),
                  const SizedBox(height: AppConstants.spacing16),
                  Text(
                    'No favorites yet',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: AppColors.textSecondary,
                        ),
                  ),
                  const SizedBox(height: AppConstants.spacing8),
                  Text(
                    'Start adding ads to your favorites',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.textTertiary,
                        ),
                  ),
                  const SizedBox(height: AppConstants.spacing24),
                  ElevatedButton(
                    onPressed: () {
                      context.goNamed('categories');
                    },
                    child: const Text('Browse Ads'),
                  ),
                ],
              ),
            );
          }

          // Favorites grid
          return Container(
            color: AppColors.backgroundWhite,
            child: RefreshIndicator(
              onRefresh: () => ref.read(favoritesProvider.notifier).refresh(),
              child: GridView.builder(
                controller: _scrollController,
                padding: const EdgeInsets.all(AppConstants.spacing16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: AppConstants.spacing12,
                  mainAxisSpacing: AppConstants.spacing12,
                  childAspectRatio: 0.85,
                ),
                itemCount: favoritesState.offers.length +
                    (favoritesState.isLoading && favoritesState.hasMore
                        ? 1
                        : 0),
                itemBuilder: (context, index) {
                  // Loading indicator at the end
                  if (index == favoritesState.offers.length) {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.all(AppConstants.spacing16),
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }

                  final offer = favoritesState.offers[index];

                  // Convert OfferModel to AdSmall for AdCard widget
                  final adSmall = AdSmall(
                    id: offer.id.toString(),
                    title: offer.name,
                    price: offer.price,
                    image:
                        '${ApiService.baseUrl}/uploads/${offer.mainImageUrl}',
                    comments: offer.numberOfComments,
                    likes: offer.numberOfFavorites,
                    location: offer.regionName,
                    timeAgo: _formatTimeAgo(offer.createdAt),
                  );

                  return Stack(
                    children: [
                      AdCard(ad: adSmall),
                    ],
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }

  String _formatTimeAgo(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inDays > 7) {
      return '${(difference.inDays / 7).floor()} weeks ago';
    } else if (difference.inDays > 0) {
      return '${difference.inDays} days ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} hours ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} minutes ago';
    } else {
      return 'Just now';
    }
  }
}
