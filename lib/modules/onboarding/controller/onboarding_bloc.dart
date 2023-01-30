import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/exam_category_dto.dart';
import '../repo/onboarding_repo.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc() : super(OnboardingState()) {
    on<GetAllExamCategoryList>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      final result = await OnboardingRepositotyImpl().getAllExamCategoryList();
      final updatedState = result.fold(
        (l) => state.copyWith(
            isLoading: false, errorMessage: l.response.toString()),
        (r) => state.copyWith(
          isLoading: false,
          onboardingList: r,
        ),
      );
      emit(updatedState);
    });

    on<AddToSelectedList>((event, emit) async {
      emit(
        state.copyWith(
          selectedOnboardingList: [
            ...state.selectedOnboardingList,
            event.onboardingDTO
          ],
        ),
      );
    });

    on<DeleteFromSelectedList>((event, emit) async {
      List<ExamCategoryDTO> onboardingList = state.selectedOnboardingList;
      onboardingList.remove(event.onboardingDTO);
      emit(state.copyWith(selectedOnboardingList: onboardingList));
    });
  }
}
