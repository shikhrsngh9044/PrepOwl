import 'package:flutter_bloc/flutter_bloc.dart';

part 'test_report_event.dart';
part 'test_report_state.dart';

class TestReportBloc extends Bloc<TestReportEvent, TestReportState> {
  TestReportBloc()
      : super(
          TestReportState(),
        ) {
    on<GetTestReport>(
      (
        event,
        emit,
      ) {
        event.answerCount;
        event.questionsLength;
        double percentage = (event.answerCount / event.questionsLength) * 100;
        emit(state.copyWith(
          percentage: percentage,
        ));
      },
    );
  }
}
