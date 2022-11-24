import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/onboarding_dto.dart';

import '../repo/onboarding_repo.dart';

part 'onboarding_state.dart';
part 'onboarding_event.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc() : super(OnboardingState()) {
    on<GetAllExamList>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      final result = await OnboardingRepositotyImpl().getAllExamList();
      final updatedState = result.fold(
        (l) => state.copyWith(
            isLoading: false, errorMessage: l.response.toString()),
        (r) => state.copyWith(
          isLoading: false,
          examCategoryList: r,
        ),
      );
      emit(updatedState);
    });
  }
}
