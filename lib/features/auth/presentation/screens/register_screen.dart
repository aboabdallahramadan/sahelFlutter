import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../l10n/app_localizations.dart';
import '../widgets/country_code_selector.dart';
import '../../providers/auth_provider.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  String _selectedCountryCode = '+974';

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _handleSubmit() async {
    final name = _nameController.text.trim();
    final phone = _phoneController.text.trim();

    if (name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter your name'),
          backgroundColor: AppColors.error,
        ),
      );
      return;
    }

    if (phone.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter your phone number'),
          backgroundColor: AppColors.error,
        ),
      );
      return;
    }

    final fullPhoneNumber = '$_selectedCountryCode$phone';

    final success = await ref.read(authProvider.notifier).register(
          name,
          fullPhoneNumber,
        );

    if (success && mounted) {
      context.goNamed(
        'otp',
        queryParameters: {
          'phone': fullPhoneNumber,
          'type': 'register',
        },
      );
    } else if (mounted) {
      final error = ref.read(authProvider).error;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error ?? 'Registration failed'),
          backgroundColor: AppColors.error,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final authState = ref.watch(authProvider);

    return Scaffold(
      backgroundColor: AppColors.primaryBg,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppConstants.spacing24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: AppConstants.spacing48),

              // Logo Section
              Center(
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: AppColors.primaryAccent,
                    borderRadius:
                        BorderRadius.circular(AppConstants.radiusCircular),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primaryAccent.withOpacity(0.3),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.person_add_outlined,
                    color: AppColors.textWhite,
                    size: 40,
                  ),
                ),
              ),
              const SizedBox(height: AppConstants.spacing32),

              // Title
              Text(
                l10n.authSignUpTitle,
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppConstants.spacing16),

              // Subtitle with link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    l10n.authAlreadyHaveAccount,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: AppColors.textSecondary,
                        ),
                  ),
                  const SizedBox(width: AppConstants.spacing4),
                  GestureDetector(
                    onTap: () {
                      context.goNamed('login');
                    },
                    child: Text(
                      l10n.authSignIn,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: AppColors.primaryAccent,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppConstants.spacing48),

              // Main Form Card
              Container(
                padding: const EdgeInsets.all(AppConstants.spacing24),
                decoration: BoxDecoration(
                  color: AppColors.backgroundWhite,
                  borderRadius:
                      BorderRadius.circular(AppConstants.radiusXLarge),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.shadowLight,
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Name Input
                    Text(
                      l10n.commonFullName,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    const SizedBox(height: AppConstants.spacing12),
                    TextFormField(
                      controller: _nameController,
                      keyboardType: TextInputType.name,
                      textCapitalization: TextCapitalization.words,
                      decoration: InputDecoration(
                        hintText: l10n.commonEnterYourFullName,
                        filled: true,
                        fillColor: AppColors.backgroundGray,
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(AppConstants.radiusLarge),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(AppConstants.radiusLarge),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(AppConstants.radiusLarge),
                          borderSide: const BorderSide(
                            color: AppColors.primaryAccent,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: AppConstants.spacing20),

                    // Phone Number Label
                    Text(
                      l10n.authPhoneNumber,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    const SizedBox(height: AppConstants.spacing12),

                    // Phone Input with Country Code
                    Row(
                      children: [
                        CountryCodeSelector(
                          selectedCode: _selectedCountryCode,
                          onChanged: (code) {
                            setState(() {
                              _selectedCountryCode = code;
                            });
                          },
                        ),
                        const SizedBox(width: AppConstants.spacing12),
                        Expanded(
                          child: TextFormField(
                            controller: _phoneController,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              hintText: l10n.commonEnterYourPhoneNumber,
                              filled: true,
                              fillColor: AppColors.backgroundGray,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    AppConstants.radiusLarge),
                                borderSide: BorderSide.none,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    AppConstants.radiusLarge),
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    AppConstants.radiusLarge),
                                borderSide: const BorderSide(
                                  color: AppColors.primaryAccent,
                                  width: 2,
                                ),
                              ),
                            ),
                            onFieldSubmitted: (_) => _handleSubmit(),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppConstants.spacing24),

                    // Submit Button
                    ElevatedButton(
                      onPressed: authState.isLoading ? null : _handleSubmit,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryAccent,
                        padding: const EdgeInsets.symmetric(
                          vertical: AppConstants.spacing16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(AppConstants.radiusLarge),
                        ),
                        elevation: 0,
                      ),
                      child: authState.isLoading
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
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.person_add),
                                const SizedBox(width: AppConstants.spacing8),
                                Text(
                                  l10n.authSignUp,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppConstants.spacing24),

              // Footer
              Text(
                l10n.commonByCreatingAnAccountYouAgreeToOurTermsOfServiceAndPrivacyPolicy,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColors.textTertiary,
                    ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
