part of 'dashboard_bloc.dart';

abstract class DashboardEvent {
  const DashboardEvent();
}

class GetSelectedExamCategory extends DashboardEvent {}

class GetExamList extends DashboardEvent {
  String parentId;
  int selectedIndex;
  GetExamList(this.parentId, this.selectedIndex);
}

class GetAllExamList extends DashboardEvent {
  int selectedIndex;
  GetAllExamList(this.selectedIndex);
}
