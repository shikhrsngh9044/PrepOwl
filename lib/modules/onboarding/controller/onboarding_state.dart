part of 'onboarding_bloc.dart';

class OnboardingState {
  final List<ExamCategoryDTO> onboardingList;
  final List<ExamCategoryDTO> selectedOnboardingList;
  final bool isLoading;
  final String errorMessage;

  OnboardingState({
    this.onboardingList = const [],
    this.selectedOnboardingList = const [],
    this.isLoading = false,
    this.errorMessage = '',
  });

  OnboardingState copyWith({
    List<ExamCategoryDTO>? onboardingList,
    List<ExamCategoryDTO>? selectedOnboardingList,
    bool? isLoading,
    String? errorMessage,
  }) {
    return OnboardingState(
      onboardingList: onboardingList ?? this.onboardingList,
      selectedOnboardingList:
          selectedOnboardingList ?? this.selectedOnboardingList,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  String toString() =>
      'OnboardingState(onboardingList: $onboardingList, selectedOnboardingList: $selectedOnboardingList, isLoading: $isLoading,errorMessage:$errorMessage)';
}
