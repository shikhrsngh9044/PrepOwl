import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import '../../onboarding/model/exam_category_dto.dart';
import '../model/exam_list_dto.dart';
import '../repo/dashboard_repo.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardState()) {
    on<GetSelectedExamCategory>(
      (event, emit) async {
        emit(
          state.copyWith(
            isLoading: true,
          ),
        );
        //Get data from Hive
        final box =
            Hive.box("core").get("exam_categories") as List<ExamCategoryDTO>;

        emit(
          state.copyWith(
            isLoading: false,
            examCategoryList: box,
          ),
        );
      },
    );

    on<GetAllExamList>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      final result =
          await DashboardRepositotyImpl().getAllExamList(event.parentId);
      final updatedState = result.fold(
        (l) => state.copyWith(
            isLoading: false, errorMessage: l.response.toString()),
        (r) => state.copyWith(
          isLoading: false,
          examList: r,
          selectedIndex: event.selectedIndex,
        ),
      );
      emit(updatedState);
    });
  }
}
