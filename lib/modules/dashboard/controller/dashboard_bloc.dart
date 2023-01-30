import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import '../../onboarding/model/exam_category_dto.dart';
import '../model/test_list_dto.dart';
import '../repo/dashboard_repo.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc()
      : super(
          DashboardState(),
        ) {
    on<GetSelectedExamCategory>(
      (
        event,
        emit,
      ) async {
        emit(
          state.copyWith(
            isLoading: true,
          ),
        );

        final box = Hive.box(
          "core",
        ).get(
          "exam_categories",
        ) as List<ExamCategoryDTO>;

        final allBox = ExamCategoryDTO(
          id: "0",
          title: "All",
        );

        box.insert(
          0,
          allBox,
        );

        emit(
          state.copyWith(
            isLoading: false,
            examCategoryList: box,
          ),
        );
      },
    );

    on<GetTestList>((
      event,
      emit,
    ) async {
      emit(
        state.copyWith(
          isLoading: true,
        ),
      );

      final result = await DashboardRepositotyImpl().getTestList(
        event.examCategoryId,
      );

      final updatedState = result.fold(
        (l) => state.copyWith(
          isLoading: false,
          errorMessage: l.response.toString(),
        ),
        (r) => state.copyWith(
          isLoading: false,
          testList: r,
          selectedIndex: event.selectedIndex,
        ),
      );
      emit(
        updatedState,
      );
    });

    on<GetAllTestList>((
      event,
      emit,
    ) async {
      emit(
        state.copyWith(
          isLoading: true,
        ),
      );
      final result = await DashboardRepositotyImpl().getAllTestList(
        state.examCategoryList,
      );

      final updatedState = result.fold(
        (l) => state.copyWith(
          isLoading: false,
          errorMessage: l.response.toString(),
        ),
        (r) => state.copyWith(
          isLoading: false,
          testList: r,
          selectedIndex: event.selectedIndex,
        ),
      );
      emit(
        updatedState,
      );
    });
  }
}
