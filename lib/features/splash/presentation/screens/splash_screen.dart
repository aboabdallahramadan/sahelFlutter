import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _rocketController;
  late AnimationController _fadeController;
  late Animation<Offset> _rocketAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize rocket animation controller
    _rocketController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    // Initialize fade animation controller
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    // Create rocket slide animation (left to right)
    _rocketAnimation = Tween<Offset>(
      begin: const Offset(-1.5, 0.0), // Start from left off-screen
      end: const Offset(0.0, 0.0), // End at center
    ).animate(CurvedAnimation(
      parent: _rocketController,
      curve: Curves.easeOutCubic,
    ));

    // Create fade animation for background elements
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeIn,
    ));

    // Start animations
    _startAnimations();
  }

  void _startAnimations() async {
    // Start fade animation first
    _fadeController.forward();

    // Wait a bit then start rocket animation
    await Future.delayed(const Duration(milliseconds: 500));
    _rocketController.forward();

    // Navigate to home after animations complete
    await Future.delayed(const Duration(milliseconds: 3000));
    if (mounted) {
      context.go('/');
    }
  }

  @override
  void dispose() {
    _rocketController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryAccent,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.primaryAccent,
              AppColors.primaryAccent.withOpacity(0.8),
              AppColors.secondary.withOpacity(0.3),
            ],
          ),
        ),
        child: Stack(
          children: [
            // Background stars/dots animation
            ...List.generate(20, (index) => _buildAnimatedDot(index)),

            // Main content
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Animated Logo (Rocket)
                  SlideTransition(
                    position: _rocketAnimation,
                    child: Container(
                      width: 120.w,
                      height: 120.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white.withOpacity(0.3),
                            blurRadius: 20,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.r),
                        child: Image.asset(
                          'assets/images/logo.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 30.h),

                  // App Name with fade animation
                  FadeTransition(
                    opacity: _fadeAnimation,
                    child: Text(
                      'Sahel',
                      style: TextStyle(
                        fontSize: 32.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 2,
                      ),
                    ),
                  ),

                  SizedBox(height: 10.h),

                  // Subtitle with fade animation
                  FadeTransition(
                    opacity: _fadeAnimation,
                    child: Text(
                      'Your Auction Platform',
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.white.withOpacity(0.8),
                        letterSpacing: 1,
                      ),
                    ),
                  ),

                  SizedBox(height: 50.h),

                  // Loading indicator
                  FadeTransition(
                    opacity: _fadeAnimation,
                    child: SizedBox(
                      width: 40.w,
                      height: 40.w,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Colors.white.withOpacity(0.8),
                        ),
                        strokeWidth: 3,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnimatedDot(int index) {
    return AnimatedBuilder(
      animation: _fadeController,
      builder: (context, child) {
        final delay = index * 0.1;
        final animationValue = (_fadeController.value - delay).clamp(0.0, 1.0);

        return Positioned(
          left: (50 + (index * 30) % 300).toDouble(),
          top: (100 + (index * 50) % 600).toDouble(),
          child: Opacity(
            opacity: animationValue * 0.6,
            child: Container(
              width: 4.w,
              height: 4.w,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
          ),
        );
      },
    );
  }
}
