import 'package:equatable/equatable.dart';

class OnboardingState extends Equatable {
  final int currentPage;
  final bool isLastPage;
  final bool onboardingComplete;

  const OnboardingState({
    this.currentPage = 0,
    this.isLastPage = false,
    this.onboardingComplete = false,
  });

  @override
  List<Object?> get props => [currentPage, isLastPage, onboardingComplete];

  OnboardingState copyWith({
    int? currentPage,
    bool? isLastPage,
    bool? onboardingComplete,
  }) {
    return OnboardingState(
      currentPage: currentPage ?? this.currentPage,
      isLastPage: isLastPage ?? this.isLastPage,
      onboardingComplete: onboardingComplete ?? this.onboardingComplete,
    );
  }
}
