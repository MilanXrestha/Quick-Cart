class OnboardingModel {
  final String lottieAsset;
  final String titleKey;
  final String descriptionKey;

  const OnboardingModel({
    required this.lottieAsset,
    required this.titleKey,
    required this.descriptionKey,
  });
}

// Onboarding content with localization keys
final List<OnboardingModel> onboardingData = [
  const OnboardingModel(
    lottieAsset: 'assets/animations/shopping.json',
    titleKey: 'onboarding_title_1',
    descriptionKey: 'onboarding_desc_1',
  ),
  const OnboardingModel(
    lottieAsset: 'assets/animations/delivery.json',
    titleKey: 'onboarding_title_2',
    descriptionKey: 'onboarding_desc_2',
  ),
  const OnboardingModel(
    lottieAsset: 'assets/animations/payment.json',
    titleKey: 'onboarding_title_3',
    descriptionKey: 'onboarding_desc_3',
  ),
];
