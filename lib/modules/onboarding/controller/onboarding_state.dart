part of 'onboarding_bloc.dart';

class OnboardingState {
  final List<ExamCategoryDTO> examCategoryList;
  final bool isLoading;
  final String errorMessage;

  OnboardingState({
    this.examCategoryList = const [],
    this.isLoading = false,
    this.errorMessage = '',
  });

  OnboardingState copyWith({
    List<ExamCategoryDTO>? examCategoryList,
    bool? isLoading,
    String? errorMessage,
  }) {
    return OnboardingState(
      examCategoryList: examCategoryList ?? this.examCategoryList,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  String toString() =>
      'OnboardingState(examCategoryList: $examCategoryList, isLoading: $isLoading,errorMessage:$errorMessage)';
}
