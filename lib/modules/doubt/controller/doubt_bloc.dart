import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:prepowl/_utils/helpers/global.dart';

import '../../onboarding/model/exam_category_dto.dart';
import 'doubt_event.dart';
import 'doubt_state.dart';

class DoubtBloc extends Bloc<DoubtEvent, DoubtState> {
  DoubtBloc() : super(DoubtState()) {
    on<DropDownExamCategory>((event, emit) async {
      emit(
        state.copyWith(
          isLoading: true,
        ),
      );
      final box = Hive.box("core");
      final examCategories =
          box.get("exam_categories") as List<ExamCategoryDTO>;

      // final allCategory = ExamCategoryDTO(id: "0", title: "All");

      // examCategories.insert(0, allCategory);
      printDebug(examCategories.length);
      emit(
        state.copyWith(
          isLoading: false,
          examCategoryList: examCategories,
        ),
      );
    });
  }
}
