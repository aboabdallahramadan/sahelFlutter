import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../l10n/app_localizations.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: AppColors.primaryBg,
      appBar: AppBar(
        title: Text(l10n.footerContact),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Section
            Container(
              width: double.infinity,
              color: AppColors.primaryAccent,
              padding: const EdgeInsets.all(AppConstants.spacing32),
              child: Column(
                children: [
                  Icon(
                    Icons.support_agent,
                    size: 64,
                    color: AppColors.textWhite,
                  ),
                  const SizedBox(height: AppConstants.spacing16),
                  Text(
                    'How can we help you?',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: AppColors.textWhite,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: AppConstants.spacing8),
                  Text(
                    'Get in touch with our support team',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: AppColors.textWhite.withOpacity(0.9),
                        ),
                  ),
                ],
              ),
            ),

            // Contact Options
            Container(
              color: AppColors.backgroundWhite,
              padding: const EdgeInsets.all(AppConstants.spacing24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Contact Methods',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: AppConstants.spacing24),

                  // Email
                  _buildContactOption(
                    context,
                    icon: Icons.email,
                    title: 'Email Us',
                    subtitle: 'support@sahel.com',
                    onTap: () => _launchUrl('mailto:support@sahel.sa'),
                  ),
                  const SizedBox(height: AppConstants.spacing16),

                  // Phone
                  _buildContactOption(
                    context,
                    icon: Icons.phone,
                    title: 'Call Us',
                    subtitle: '+974 1234 5678',
                    onTap: () => _launchUrl('tel:+97412345678'),
                  ),
                  const SizedBox(height: AppConstants.spacing16),

                  // WhatsApp
                  _buildContactOption(
                    context,
                    icon: Icons.chat,
                    title: 'WhatsApp',
                    subtitle: '+974 1234 5678',
                    onTap: () => _launchUrl('https://wa.me/97412345678'),
                  ),

                  const SizedBox(height: AppConstants.spacing32),
                  const Divider(),
                  const SizedBox(height: AppConstants.spacing32),

                  // FAQ Section
                  Text(
                    'Frequently Asked Questions',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: AppConstants.spacing16),

                  _buildFAQItem(
                    context,
                    'How do I post an ad?',
                    'To post an ad, tap the "Post Ad" button on the home screen, select a category, fill in the details, add photos, and submit.',
                  ),
                  _buildFAQItem(
                    context,
                    'How do I contact a seller?',
                    'You can contact sellers through the chat feature or by calling them directly using the phone number provided in the ad.',
                  ),
                  _buildFAQItem(
                    context,
                    'Is Sahel free to use?',
                    'Yes, Sahel is completely free for both buyers and sellers. There are no hidden charges.',
                  ),
                  _buildFAQItem(
                    context,
                    'How do I report a suspicious ad?',
                    'If you find a suspicious ad, tap the three dots menu on the ad page and select "Report". Our team will review it promptly.',
                  ),

                  const SizedBox(height: AppConstants.spacing32),
                  // const Divider(),
                  // const SizedBox(height: AppConstants.spacing32),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactOption(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppConstants.radiusLarge),
      child: Container(
        padding: const EdgeInsets.all(AppConstants.spacing16),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.borderLight),
          borderRadius: BorderRadius.circular(AppConstants.radiusLarge),
        ),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: AppColors.primaryAccent.withOpacity(0.1),
                borderRadius:
                    BorderRadius.circular(AppConstants.radiusCircular),
              ),
              child: Icon(
                icon,
                color: AppColors.primaryAccent,
              ),
            ),
            const SizedBox(width: AppConstants.spacing16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  Text(
                    subtitle,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.textSecondary,
                        ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: AppColors.textTertiary,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFAQItem(BuildContext context, String question, String answer) {
    return ExpansionTile(
      title: Text(
        question,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(
            AppConstants.spacing16,
            0,
            AppConstants.spacing16,
            AppConstants.spacing16,
          ),
          child: Text(
            answer,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.textSecondary,
                  height: 1.5,
                ),
          ),
        ),
      ],
    );
  }

  Widget _buildHoursRow(BuildContext context, String days, String hours) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          days,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Text(
          hours,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color:
                    hours == 'Closed' ? AppColors.error : AppColors.textPrimary,
              ),
        ),
      ],
    );
  }
}
