import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import '../../../_utils/constants/enums.dart';
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

        final allBox = ExamCategoryDTO(id: "0", title: "All");

        box.insert(0, allBox);

        emit(
          state.copyWith(
            isLoading: false,
            examCategoryList: box,
          ),
        );
      },
    );

    on<GetExamList>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      final result =
          await DashboardRepositotyImpl().getExamList(event.parentId);
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

    on<GetAllExamList>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      final result = await DashboardRepositotyImpl().getAllExamList();
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

    on<GetBottomIndex>(((event, emit) {
      emit(state.copyWith(isLoading: true));
      try {
        switch (event.navbarItem) {
          case NavbarItem.dashboard:
            emit(state.copyWith(
                navbarItem: NavbarItem.dashboard, bottomIndex: 0));
            break;
          case NavbarItem.search:
            emit(state.copyWith(navbarItem: NavbarItem.search, bottomIndex: 1));
            break;
          case NavbarItem.doubt:
            emit(state.copyWith(navbarItem: NavbarItem.doubt, bottomIndex: 2));
            break;
          case NavbarItem.profile:
            emit(
                state.copyWith(navbarItem: NavbarItem.profile, bottomIndex: 3));
            break;
        }
        emit(state.copyWith(isLoading: false));
      } catch (e) {
        debugPrint(e.toString());
      }
    }));
  }
}
