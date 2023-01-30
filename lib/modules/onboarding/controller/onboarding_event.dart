part of 'onboarding_bloc.dart';

abstract class OnboardingEvent {
  const OnboardingEvent();
}

class GetAllExamCategoryList extends OnboardingEvent {}

class AddToSelectedList extends OnboardingEvent {
  ExamCategoryDTO onboardingDTO;
  AddToSelectedList(
    this.onboardingDTO,
  );
}

class DeleteFromSelectedList extends OnboardingEvent {
  ExamCategoryDTO onboardingDTO;
  DeleteFromSelectedList(
    this.onboardingDTO,
  );
}

class UpdateCount extends OnboardingEvent {
  UpdateCount();
}
