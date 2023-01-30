part of 'test_report_bloc.dart';

class TestReportState {
  final double percentage;

  TestReportState({
    this.percentage = 0.0,
  });

  TestReportState copyWith({
    double? percentage,
  }) {
    return TestReportState(
      percentage: percentage ?? this.percentage,
    );
  }

  @override
  String toString() => 'TestReportState(percentage: $percentage,)';
}
