part of 'dashboard_bloc.dart';

class DashboardState {
  final List<ExamListDTO> examList;
  final List<ExamCategoryDTO> examCategoryList;
  final bool isLoading;
  final String errorMessage;
  final int selectedIndex;

  DashboardState({
    this.examList = const [],
    this.examCategoryList = const [],
    this.isLoading = false,
    this.errorMessage = '',
    this.selectedIndex = -1,
  });

  DashboardState copyWith({
    List<ExamListDTO>? examList,
    List<ExamCategoryDTO>? examCategoryList,
    bool? isLoading,
    String? errorMessage,
    int? selectedIndex,
  }) {
    return DashboardState(
      examList: examList ?? this.examList,
      examCategoryList: examCategoryList ?? this.examCategoryList,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      selectedIndex: selectedIndex ?? this.selectedIndex,
    );
  }

  @override
  String toString() =>
      'DashboardState(examList: $examList, examCategoryList: $examCategoryList, isLoading: $isLoading, errorMessage:$errorMessage,selectedIndex:$selectedIndex)';
}
