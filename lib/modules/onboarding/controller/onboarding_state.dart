part of 'onboarding_bloc.dart';

class OnboardingState {
  final List<OnboardingDTO> onboardingList;
  final bool isLoading;
  final String errorMessage;
  OnboardingState({
    this.onboardingList = const [],
    this.isLoading = false,
    this.errorMessage = '',
  });

  OnboardingState copyWith({
    List<OnboardingDTO>? onboardingList,
    bool? isLoading,
    String? errorMessage,
  }) {
    return OnboardingState(
      onboardingList: onboardingList ?? this.onboardingList,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  String toString() =>
      'OnboardingState(onboardingList: $onboardingList, isLoading: $isLoading,errorMessage:$errorMessage)';
}
