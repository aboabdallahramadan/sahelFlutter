import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../l10n/app_localizations.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    
    return Scaffold(
      backgroundColor: AppColors.primaryBg,
      appBar: AppBar(
        title: Text(l10n.profileTerms),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: AppColors.backgroundWhite,
          padding: const EdgeInsets.all(AppConstants.spacing24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.profileTerms,
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: AppConstants.spacing8),
              Text(
                'Last updated: January 1, 2024',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: AppConstants.spacing32),
              
              _buildSection(
                context,
                '1. Acceptance of Terms',
                'By accessing and using Mzad Qatar, you accept and agree to be bound by the terms and provision of this agreement.',
              ),
              
              _buildSection(
                context,
                '2. Use License',
                'Permission is granted to temporarily download one copy of Mzad Qatar per device for personal, non-commercial transitory viewing only.',
              ),
              
              _buildSection(
                context,
                '3. User Account',
                'To access certain features of the app, you may be required to create an account. You are responsible for maintaining the confidentiality of your account information and for all activities that occur under your account.',
              ),
              
              _buildSection(
                context,
                '4. Posting Guidelines',
                'Users must ensure that all posted content is accurate, lawful, and does not infringe on the rights of others. We reserve the right to remove any content that violates our guidelines.',
              ),
              
              _buildSection(
                context,
                '5. Prohibited Uses',
                'You may not use our app:\n'
                '• For any unlawful purpose\n'
                '• To solicit others to perform unlawful acts\n'
                '• To violate any international, federal, provincial or state regulations, rules, laws, or local ordinances\n'
                '• To infringe upon or violate our intellectual property rights or the intellectual property rights of others',
              ),
              
              _buildSection(
                context,
                '6. Privacy',
                'Your use of our app is also governed by our Privacy Policy. Please review our Privacy Policy, which also governs the Site and informs users of our data collection practices.',
              ),
              
              _buildSection(
                context,
                '7. Limitation of Liability',
                'In no event shall Mzad Qatar, nor its directors, employees, partners, agents, suppliers, or affiliates, be liable for any indirect, incidental, special, consequential or punitive damages.',
              ),
              
              _buildSection(
                context,
                '8. Changes to Terms',
                'We reserve the right, at our sole discretion, to modify or replace these Terms at any time. If a revision is material, we will provide at least 30 days notice prior to any new terms taking effect.',
              ),
              
              _buildSection(
                context,
                '9. Contact Information',
                'If you have any questions about these Terms of Service, please contact us at support@mzadqatar.com',
              ),
              
              const SizedBox(height: AppConstants.spacing48),
              
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    context.pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryAccent,
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppConstants.spacing32,
                      vertical: AppConstants.spacing16,
                    ),
                  ),
                  child: const Text('I Understand'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection(BuildContext context, String title, String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppConstants.spacing24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: AppConstants.spacing12),
          Text(
            content,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: AppColors.textSecondary,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
} 