import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/models/ad_user.dart';
import '../../../../l10n/app_localizations.dart';

class UserProfileCard extends StatelessWidget {
  final AdUser user;

  const UserProfileCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Container(
      padding: const EdgeInsets.all(AppConstants.spacing16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.adPostedBy,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: AppConstants.spacing16),
          
          Row(
            children: [
              // Avatar
              CircleAvatar(
                radius: 30,
                backgroundColor: AppColors.backgroundGray,
                backgroundImage: user.avatar != null
                    ? NetworkImage(user.avatar!)
                    : null,
                child: user.avatar == null
                    ? const Icon(
                        Icons.person,
                        size: 30,
                        color: AppColors.textSecondary,
                      )
                    : null,
              ),
              const SizedBox(width: AppConstants.spacing16),
              
              // User Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.name,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: AppConstants.spacing4),
                    Text(
                      '${l10n.adMemberSince} ${user.memberSince}',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              
              // View Profile Button
              TextButton(
                onPressed: () {
                  context.goNamed(
                    'userProfile',
                    pathParameters: {'userId': user.id},
                  );
                },
                child: const Text('View Profile'),
              ),
            ],
          ),
          
          if (user.phoneNumber != null) ...[
            const SizedBox(height: AppConstants.spacing16),
            Container(
              padding: const EdgeInsets.all(AppConstants.spacing12),
              decoration: BoxDecoration(
                color: AppColors.backgroundGray,
                borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.phone,
                    size: AppConstants.iconSizeSmall,
                    color: AppColors.textSecondary,
                  ),
                  const SizedBox(width: AppConstants.spacing8),
                  Text(
                    user.phoneNumber!,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
} 