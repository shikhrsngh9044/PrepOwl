part of 'dashboard_bloc.dart';

class DashboardState {
  final List<ExamListDTO> examList;
  final List<ExamCategoryDTO> examCategoryList;
  final bool isLoading;
  final String errorMessage;
  final int selectedIndex;
  final int bottomIndex;
  final NavbarItem navbarItem;

  DashboardState({
    this.examList = const [],
    this.examCategoryList = const [],
    this.isLoading = false,
    this.errorMessage = '',
    this.selectedIndex = -1,
    this.bottomIndex = 0,
    this.navbarItem = NavbarItem.dashboard,
  });

  DashboardState copyWith({
    List<ExamListDTO>? examList,
    List<ExamCategoryDTO>? examCategoryList,
    bool? isLoading,
    String? errorMessage,
    int? selectedIndex,
    int? bottomIndex,
    NavbarItem? navbarItem,
  }) {
    return DashboardState(
      examList: examList ?? this.examList,
      examCategoryList: examCategoryList ?? this.examCategoryList,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      selectedIndex: selectedIndex ?? this.selectedIndex,
      bottomIndex: bottomIndex ?? this.bottomIndex,
      navbarItem: navbarItem ?? this.navbarItem,
    );
  }

  @override
  String toString() =>
      'DashboardState(examList: $examList, examCategoryList: $examCategoryList, isLoading: $isLoading, errorMessage:$errorMessage,selectedIndex:$selectedIndex, bottomIndex:$bottomIndex, navbarItem:$navbarItem)';
}
