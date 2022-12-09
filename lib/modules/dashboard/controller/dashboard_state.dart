part of 'dashboard_bloc.dart';

class DashboardState {
  final List<TestListDTO> testList;
  final List<ExamCategoryDTO> examCategoryList;
  final bool isLoading;
  final String errorMessage;
  final int selectedIndex;

  DashboardState({
    this.testList = const [],
    this.examCategoryList = const [],
    this.isLoading = false,
    this.errorMessage = '',
    this.selectedIndex = -1,
  });

  DashboardState copyWith({
    List<TestListDTO>? testList,
    List<ExamCategoryDTO>? examCategoryList,
    bool? isLoading,
    String? errorMessage,
    int? selectedIndex,
  }) {
    return DashboardState(
      testList: testList ?? this.testList,
      examCategoryList: examCategoryList ?? this.examCategoryList,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      selectedIndex: selectedIndex ?? this.selectedIndex,
    );
  }

  @override
  String toString() =>
      'DashboardState(testList: $testList, examCategoryList: $examCategoryList, isLoading: $isLoading, errorMessage:$errorMessage,selectedIndex:$selectedIndex)';
}
