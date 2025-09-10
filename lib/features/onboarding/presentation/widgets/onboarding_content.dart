import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/resources/app_colors.dart';
import '../../../../generated/app_localizations.dart';
import '../../data/models/onboarding_model.dart';

class OnboardingContent extends StatelessWidget {
  final OnboardingModel model;

  const OnboardingContent({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context)!;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Transform.translate(
        offset: Offset(0, -30.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Lottie animation
            Lottie.asset(model.lottieAsset, height: 300.h, fit: BoxFit.contain),
            SizedBox(height: 10.h),

            // Title text
            Text(
              _getLocalizedString(l10n, model.titleKey),
              style: theme.textTheme.headlineSmall?.copyWith(
                color: isDarkMode
                    ? AppColors.primaryDark
                    : AppColors.primaryLight,
                fontFamily: 'Lato',
                fontSize: 28.sp,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.h),

            // Description text
            Text(
              _getLocalizedString(l10n, model.descriptionKey),
              style: theme.textTheme.bodyMedium?.copyWith(
                fontFamily: 'Lato',
                fontSize: 18.sp,
                color: isDarkMode
                    ? AppColors.textSecondaryDark
                    : AppColors.textSecondaryLight,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to get localized string using a key
  String _getLocalizedString(AppLocalizations l10n, String key) {
    switch (key) {
      case 'onboarding_title_1':
        return l10n.onboarding_title_1;
      case 'onboarding_title_2':
        return l10n.onboarding_title_2;
      case 'onboarding_title_3':
        return l10n.onboarding_title_3;
      case 'onboarding_desc_1':
        return l10n.onboarding_desc_1;
      case 'onboarding_desc_2':
        return l10n.onboarding_desc_2;
      case 'onboarding_desc_3':
        return l10n.onboarding_desc_3;
      default:
        return 'Missing translation';
    }
  }
}
