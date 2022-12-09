part of 'dashboard_bloc.dart';

abstract class DashboardEvent {
  const DashboardEvent();
}

class GetSelectedExamCategory extends DashboardEvent {}

class GetTestList extends DashboardEvent {
  String examCategoryId;
  int selectedIndex;

  GetTestList(
    this.examCategoryId,
    this.selectedIndex,
  );
}

class GetAllTestList extends DashboardEvent {
  int selectedIndex;

  GetAllTestList(
    this.selectedIndex,
  );
}
