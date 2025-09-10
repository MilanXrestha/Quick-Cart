import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/localization/bloc/localization_bloc.dart';
import '../../../../core/localization/bloc/localization_event.dart';
import '../../../../core/localization/bloc/localization_state.dart';
import '../../../../core/resources/app_colors.dart';
import '../../../../generated/app_localizations.dart';
import '../../data/models/onboarding_model.dart';
import '../bloc/onboarding_bloc.dart';
import '../bloc/onboarding_event.dart';
import '../bloc/onboarding_state.dart';
import '../widgets/onboarding_content.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context)!;

    return BlocProvider(
      create: (context) => OnboardingBloc(),
      child: BlocConsumer<OnboardingBloc, OnboardingState>(
        listener: (context, state) {
          if (state.onboardingComplete) {
            // Navigate to login when onboarding is complete
            context.go('/login');
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  // Top row with language selector and skip button
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 16.h,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Language selector
                        _buildLanguageSelector(context, isDarkMode),

                        // Skip button
                        TextButton(
                          onPressed: () {
                            context.read<OnboardingBloc>().add(
                              OnboardingCompleted(),
                            );
                          },
                          child: Text(
                            l10n.skip,
                            style: theme.textTheme.bodyLarge?.copyWith(
                              color: isDarkMode
                                  ? AppColors.primaryDark
                                  : AppColors.primaryLight,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Page view
                  Expanded(
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: onboardingData.length,
                      onPageChanged: (index) {
                        context.read<OnboardingBloc>().add(
                          OnboardingPageChanged(index),
                        );
                      },
                      itemBuilder: (context, index) {
                        return OnboardingContent(model: onboardingData[index]);
                      },
                    ),
                  ),

                  // Bottom navigation
                  Padding(
                    padding: EdgeInsets.all(24.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Page indicator
                        SmoothPageIndicator(
                          controller: _pageController,
                          count: onboardingData.length,
                          effect: ExpandingDotsEffect(
                            dotHeight: 8.h,
                            dotWidth: 8.w,
                            activeDotColor: isDarkMode
                                ? AppColors.primaryDark
                                : AppColors.primaryLight,
                            dotColor: isDarkMode
                                ? Colors.grey.shade700
                                : Colors.grey.shade300,
                          ),
                        ),

                        // Next/Finish button
                        ElevatedButton(
                          onPressed: () {
                            if (state.isLastPage) {
                              context.read<OnboardingBloc>().add(
                                OnboardingCompleted(),
                              );
                            } else {
                              _pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: isDarkMode
                                ? AppColors.primaryDark
                                : AppColors.primaryLight,
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(
                              horizontal: 24.w,
                              vertical: 12.h,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.r),
                            ),
                          ),
                          child: Text(
                            state.isLastPage ? l10n.getStarted : l10n.next,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // Language selector widget
  Widget _buildLanguageSelector(BuildContext context, bool isDarkMode) {
    final l10n = AppLocalizations.of(context)!;

    return BlocBuilder<LocalizationBloc, LocalizationState>(
      builder: (context, state) {
        return IconButton(
          icon: Icon(
            Icons.language,
            color: isDarkMode ? AppColors.primaryDark : AppColors.primaryLight,
          ),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text(l10n.changeLanguage),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // English option
                    ListTile(
                      title: const Text('English'),
                      leading: Radio<String>(
                        value: 'en',
                        groupValue: state.locale.languageCode,
                        onChanged: (_) {
                          context.read<LocalizationBloc>().add(
                            const LocaleChanged(Locale('en')),
                          );
                          Navigator.pop(context);
                        },
                      ),
                      onTap: () {
                        context.read<LocalizationBloc>().add(
                          const LocaleChanged(Locale('en')),
                        );
                        Navigator.pop(context);
                      },
                    ),

                    // Nepali option
                    ListTile(
                      title: const Text('नेपाली'),
                      leading: Radio<String>(
                        value: 'ne',
                        groupValue: state.locale.languageCode,
                        onChanged: (_) {
                          context.read<LocalizationBloc>().add(
                            const LocaleChanged(Locale('ne')),
                          );
                          Navigator.pop(context);
                        },
                      ),
                      onTap: () {
                        context.read<LocalizationBloc>().add(
                          const LocaleChanged(Locale('ne')),
                        );
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
