import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_constants.dart';

class CountryCodeSelector extends StatefulWidget {
  final String selectedCode;
  final Function(String) onChanged;

  const CountryCodeSelector({
    super.key,
    required this.selectedCode,
    required this.onChanged,
  });

  @override
  State<CountryCodeSelector> createState() => _CountryCodeSelectorState();
}

class _CountryCodeSelectorState extends State<CountryCodeSelector> {
  bool _isDropdownOpen = false;
  final _overlayPortalController = OverlayPortalController();

  @override
  Widget build(BuildContext context) {
    final selectedCountry = AppConstants.countryCodes.firstWhere(
      (country) => country['code'] == widget.selectedCode,
      orElse: () => AppConstants.countryCodes.first,
    );

    return OverlayPortal(
      controller: _overlayPortalController,
      overlayChildBuilder: (BuildContext context) {
        return Positioned(
          width: 250,
          child: CompositedTransformFollower(
            link: _layerLink,
            targetAnchor: Alignment.bottomLeft,
            followerAnchor: Alignment.topLeft,
            offset: const Offset(0, 8),
            child: Material(
              elevation: 8,
              borderRadius: BorderRadius.circular(AppConstants.radiusLarge),
              child: Container(
                constraints: const BoxConstraints(maxHeight: 300),
                decoration: BoxDecoration(
                  color: AppColors.backgroundWhite,
                  borderRadius: BorderRadius.circular(AppConstants.radiusLarge),
                  border: Border.all(color: AppColors.borderLight),
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(AppConstants.spacing8),
                  itemCount: AppConstants.countryCodes.length,
                  itemBuilder: (context, index) {
                    final country = AppConstants.countryCodes[index];
                    return InkWell(
                      onTap: () {
                        widget.onChanged(country['code']!);
                        setState(() {
                          _isDropdownOpen = false;
                          _overlayPortalController.hide();
                        });
                      },
                      borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppConstants.spacing12,
                          vertical: AppConstants.spacing8,
                        ),
                        child: Row(
                          children: [
                            Text(
                              country['flag']!,
                              style: const TextStyle(fontSize: 20),
                            ),
                            const SizedBox(width: AppConstants.spacing12),
                            Text(
                              country['code']!,
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(width: AppConstants.spacing8),
                            Expanded(
                              child: Text(
                                country['country']!,
                                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                  color: AppColors.textSecondary,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
      child: CompositedTransformTarget(
        link: _layerLink,
        child: InkWell(
          onTap: () {
            setState(() {
              _isDropdownOpen = !_isDropdownOpen;
              if (_isDropdownOpen) {
                _overlayPortalController.show();
              } else {
                _overlayPortalController.hide();
              }
            });
          },
          borderRadius: BorderRadius.circular(AppConstants.radiusLarge),
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.spacing12,
              vertical: AppConstants.spacing12,
            ),
            decoration: BoxDecoration(
              color: AppColors.backgroundGray,
              borderRadius: BorderRadius.circular(AppConstants.radiusLarge),
              border: Border.all(
                color: _isDropdownOpen ? AppColors.primaryAccent : Colors.transparent,
                width: 2,
              ),
            ),
            child: Row(
              children: [
                Text(
                  selectedCountry['flag']!,
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(width: AppConstants.spacing8),
                Text(
                  selectedCountry['code']!,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(width: AppConstants.spacing4),
                Icon(
                  _isDropdownOpen ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                  color: AppColors.textSecondary,
                  size: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  final LayerLink _layerLink = LayerLink();
} 