import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

// Import screens here - we'll create them later
import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/categories/presentation/screens/categories_screen.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/screens/register_screen.dart';
import '../../features/auth/presentation/screens/otp_screen.dart';
import '../../features/categories/presentation/screens/subcategory_screen.dart';
import '../../features/ads/presentation/screens/ad_details_screen.dart';
import '../../features/ads/presentation/screens/post_ad_screen.dart';
import '../../features/chat/presentation/screens/chats_screen.dart';
import '../../features/chat/presentation/screens/chat_screen.dart';
import '../../features/profile/presentation/screens/profile_screen.dart';
import '../../features/profile/presentation/screens/favorites_screen.dart';
import '../../features/profile/presentation/screens/notifications_screen.dart';
import '../../features/static/presentation/screens/terms_screen.dart';
import '../../features/static/presentation/screens/privacy_screen.dart';
import '../../features/static/presentation/screens/contact_screen.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    routes: [
      // Home
      GoRoute(
        path: '/',
        name: 'home',
        builder: (context, state) => const HomeScreen(),
        routes: [
          // Categories
          GoRoute(
            path: 'categories',
            name: 'categories',
            builder: (context, state) => const CategoriesScreen(),
          ),
          
          // Subcategory listing
          GoRoute(
            path: 'category/:subcategoryId',
            name: 'subcategory',
            builder: (context, state) {
              final subcategoryId = state.pathParameters['subcategoryId']!;
              return SubcategoryScreen(subcategoryId: subcategoryId);
            },
          ),
          
          // Ad Details
          GoRoute(
            path: 'ad/:adId',
            name: 'adDetails',
            builder: (context, state) {
              final adId = state.pathParameters['adId']!;
              return AdDetailsScreen(adId: adId);
            },
          ),
          
          // Post Ad
          GoRoute(
            path: 'post-ad',
            name: 'postAd',
            builder: (context, state) => const PostAdScreen(),
          ),
          
          // Chats
          GoRoute(
            path: 'chats',
            name: 'chats',
            builder: (context, state) => const ChatsScreen(),
            routes: [
              // Individual Chat
              GoRoute(
                path: ':chatId',
                name: 'chat',
                builder: (context, state) {
                  final chatId = state.pathParameters['chatId']!;
                  return ChatScreen(chatId: chatId);
                },
              ),
            ],
          ),
          
          // Profile
          GoRoute(
            path: 'profile',
            name: 'profile',
            builder: (context, state) => const ProfileScreen(),
            routes: [
              // User Profile
              GoRoute(
                path: 'user/:userId',
                name: 'userProfile',
                builder: (context, state) {
                  final userId = state.pathParameters['userId']!;
                  return const Placeholder(); // UserProfileScreen(userId: userId)
                },
              ),
            ],
          ),
          
          // Favorites
          GoRoute(
            path: 'favorites',
            name: 'favorites',
            builder: (context, state) => const FavoritesScreen(),
          ),
          
          // Notifications
          GoRoute(
            path: 'notifications',
            name: 'notifications',
            builder: (context, state) => const NotificationsScreen(),
          ),
          
          // Auth Routes
          GoRoute(
            path: 'login',
            name: 'login',
            builder: (context, state) => const LoginScreen(),
          ),
          
          GoRoute(
            path: 'register',
            name: 'register',
            builder: (context, state) => const RegisterScreen(),
          ),
          
          GoRoute(
            path: 'otp',
            name: 'otp',
            builder: (context, state) {
              final phone = state.uri.queryParameters['phone'] ?? '';
              final type = state.uri.queryParameters['type'] ?? 'login';
              return OtpScreen(phone: phone, type: type);
            },
          ),
          
          // Static Pages
          GoRoute(
            path: 'terms',
            name: 'terms',
            builder: (context, state) => const TermsScreen(),
          ),
          
          GoRoute(
            path: 'privacy',
            name: 'privacy',
            builder: (context, state) => const PrivacyScreen(),
          ),
          
          GoRoute(
            path: 'contact',
            name: 'contact',
            builder: (context, state) => const ContactScreen(),
          ),
        ],
      ),
    ],
  );
});

// Route Guards
// final authGuardProvider = Provider<Listenable>((ref) {
//   final authState = ref.watch(authStateProvider);
//   return authState;
// }); 