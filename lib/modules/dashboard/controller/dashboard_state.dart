part of 'dashboard_bloc.dart';

class DashboardState {
  final List<TestListDTO> testList;
  final List<ExamCategoryDTO> examCategoryList;
  final bool isLoading;
  final String errorMessage;
  final int selectedIndex;
  final int bottomIndex;
  final NavbarItem navbarItem;

  DashboardState({
    this.testList = const [],
    this.examCategoryList = const [],
    this.isLoading = false,
    this.errorMessage = '',
    this.selectedIndex = -1,
    this.bottomIndex = 0,
    this.navbarItem = NavbarItem.dashboard,
  });

  DashboardState copyWith({
    List<TestListDTO>? testList,
    List<ExamCategoryDTO>? examCategoryList,
    bool? isLoading,
    String? errorMessage,
    int? selectedIndex,
    int? bottomIndex,
    NavbarItem? navbarItem,
  }) {
    return DashboardState(
      testList: testList ?? this.testList,
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
      'DashboardState(examList: $testList, examCategoryList: $examCategoryList, isLoading: $isLoading, errorMessage:$errorMessage,selectedIndex:$selectedIndex, bottomIndex:$bottomIndex, navbarItem:$navbarItem)';
}
