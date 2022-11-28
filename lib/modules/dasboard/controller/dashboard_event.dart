part of 'dashboard_bloc.dart';

abstract class DashboardEvent {
  const DashboardEvent();
}

class GetSelectedExamCategory extends DashboardEvent {}

class GetAllExamList extends DashboardEvent {
  String parentId;
  GetAllExamList(this.parentId);
}
