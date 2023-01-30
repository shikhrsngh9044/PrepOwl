part of 'test_report_bloc.dart';

abstract class TestReportEvent {
  const TestReportEvent();
}

class GetTestReport extends TestReportEvent {
  int answerCount;
  int questionsLength;
  GetTestReport(
    this.answerCount,
    this.questionsLength,
  );
}
