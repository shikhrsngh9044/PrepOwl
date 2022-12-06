import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../_utils/constants/enums.dart';

part 'instruction_and_test_event.dart';
part 'instruction_and_test_state.dart';

class InstructionAndTestBloc
    extends Bloc<InstructionAndTestEvent, InstructionAndTestState> {
  InstructionAndTestBloc() : super(InstructionAndTestState()) {
    on<ReadInstructions>((event, emit) {
      emit(
        state.copyWith(
          readInstructions: !state.readInstructions,
        ),
      );
    });

    on<StartTest>((event, emit) {
      emit(
        state.copyWith(
          proceedToStartTest: true,
        ),
      );
    });

    on<UpdateSelectedQuestionIndex>((event, emit) {
      emit(
        state.copyWith(
          selectedQuestionIndex: event.direction == DIRECTION.backward
              ? event.currentIndex - 1
              : event.currentIndex + 1,
        ),
      );
    });
  }
}
