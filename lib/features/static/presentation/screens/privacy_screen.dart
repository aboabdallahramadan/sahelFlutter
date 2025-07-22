import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../l10n/app_localizations.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    
    return Scaffold(
      backgroundColor: AppColors.primaryBg,
      appBar: AppBar(
        title: Text(l10n.profilePrivacy),
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
                l10n.profilePrivacy,
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
                '1. Information We Collect',
                'We collect information you provide directly to us, such as when you create an account, post an ad, or contact us for support. This may include:\n'
                '• Name and contact information\n'
                '• Phone number for verification\n'
                '• Profile information\n'
                '• Content you post (ads, comments, messages)',
              ),
              
              _buildSection(
                context,
                '2. How We Use Your Information',
                'We use the information we collect to:\n'
                '• Provide, maintain, and improve our services\n'
                '• Process transactions and send related information\n'
                '• Send technical notices and support messages\n'
                '• Respond to your comments and questions\n'
                '• Monitor and analyze trends and usage',
              ),
              
              _buildSection(
                context,
                '3. Information Sharing',
                'We do not sell, trade, or rent your personal information to third parties. We may share your information in the following situations:\n'
                '• With your consent\n'
                '• To comply with legal obligations\n'
                '• To protect rights and safety\n'
                '• With service providers who assist in our operations',
              ),
              
              _buildSection(
                context,
                '4. Data Security',
                'We implement appropriate technical and organizational measures to protect your personal information against unauthorized access, alteration, disclosure, or destruction.',
              ),
              
              _buildSection(
                context,
                '5. Your Rights',
                'You have the right to:\n'
                '• Access your personal information\n'
                '• Correct inaccurate data\n'
                '• Request deletion of your data\n'
                '• Object to processing of your data\n'
                '• Data portability',
              ),
              
              _buildSection(
                context,
                '6. Cookies and Tracking',
                'We use cookies and similar tracking technologies to track activity on our app and hold certain information. You can instruct your browser to refuse all cookies or to indicate when a cookie is being sent.',
              ),
              
              _buildSection(
                context,
                '7. Children\'s Privacy',
                'Our service is not intended for children under 13 years of age. We do not knowingly collect personal information from children under 13.',
              ),
              
              _buildSection(
                context,
                '8. Changes to Privacy Policy',
                'We may update our Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy on this page and updating the "Last updated" date.',
              ),
              
              _buildSection(
                context,
                '9. Contact Us',
                'If you have any questions about this Privacy Policy, please contact us at:\n'
                'Email: privacy@mzadqatar.com\n'
                'Phone: +974 1234 5678',
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