part of 'dashboard_bloc.dart';

abstract class DashboardEvent {
  const DashboardEvent();
}

class GetSelectedExamCategory extends DashboardEvent {}

class GetAllExamList extends DashboardEvent {
  String parentId;
  int selectedIndex;
  GetAllExamList(this.parentId, this.selectedIndex);
}
