// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../dashboard/model/exam_list_dto.dart';
import '../../onboarding/model/exam_category_dto.dart';

class DoubtState {
  final List<ExamListDTO> examList;
  String? selectedItem;
  bool isLoading;
  final List<ExamCategoryDTO> examCategoryList;
  DoubtState({
    this.selectedItem,
    this.examList = const [],
    this.examCategoryList = const [],
    this.isLoading = false,
  });

  DoubtState copyWith({
    List<ExamListDTO>? examList,
    List<ExamCategoryDTO>? examCategoryList,
    String? selectedItem,
    bool? isLoading,
  }) {
    return DoubtState(
      examList: examList ?? this.examList,
      selectedItem: selectedItem ?? this.selectedItem,
      isLoading: isLoading ?? this.isLoading,
      examCategoryList: examCategoryList ?? this.examCategoryList,
    );
  }

  @override
  String toString() =>
      'DoubtState(selectedItem: $selectedItem, examList: $examList, isLoading:$isLoading, examCategory:$examCategoryList)';
}
