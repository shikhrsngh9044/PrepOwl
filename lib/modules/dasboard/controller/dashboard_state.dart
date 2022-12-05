part of 'dashboard_bloc.dart';

class DashboardState {
  final List<ExamListDTO> examList;
  final List<ExamCategoryDTO> examCategoryList;
  final bool isLoading;
  final String errorMessage;

  DashboardState({
    this.examList = const [],
    this.examCategoryList = const [],
    this.isLoading = false,
    this.errorMessage = '',
  });

  DashboardState copyWith({
    List<ExamListDTO>? examList,
    List<ExamCategoryDTO>? examCategoryList,
    bool? isLoading,
    String? errorMessage,
  }) {
    return DashboardState(
      examList: examList ?? this.examList,
      examCategoryList: examCategoryList ?? this.examCategoryList,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  String toString() =>
      'DashboardState(examList: $examList, examCategoryList: $examCategoryList, isLoading: $isLoading, errorMessage:$errorMessage)';
}
