import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../_utils/constants/enums.dart';
import '../model/test_dto.dart';
import '../repo/instruction_and_test_repo.dart';

part 'instruction_and_test_event.dart';
part 'instruction_and_test_state.dart';

class InstructionAndTestBloc
    extends Bloc<InstructionAndTestEvent, InstructionAndTestState> {
  InstructionAndTestBloc()
      : super(
          InstructionAndTestState(),
        ) {
    on<ReadInstructions>(
      (
        event,
        emit,
      ) {
        emit(
          state.copyWith(
            readInstructions: !state.readInstructions,
          ),
        );
      },
    );

    on<StartTest>(
      (
        event,
        emit,
      ) {
        emit(
          state.copyWith(
            proceedToStartTest: true,
          ),
        );
      },
    );

    on<UpdateSelectedQuestionIndex>(
      (
        event,
        emit,
      ) {
        emit(
          state.copyWith(
            selectedQuestionIndex: event.direction == DIRECTION.backward
                ? event.currentIndex - 1
                : event.currentIndex + 1,
          ),
        );
      },
    );

    on<GetTestQuestions>(
      (
        event,
        emit,
      ) async {
        final result =
            await InstructionAndTestRepositoryImpl().getInstructionsAndQuestion(
          event.testId,
        );

        final updatedState = result.fold(
          (l) => state.copyWith(
            instructionAndQuestionsList: [],
          ),
          (r) {
            return state.copyWith(
              instructionAndQuestionsList: r,
            );
          },
        );
        emit(
          updatedState,
        );
      },
    );

    on<UpdateAnsweredOption>((event, emit) {
      var newInstructionAndQuestionsList = state.instructionAndQuestionsList;

      for (var questionItem in newInstructionAndQuestionsList[0].questions) {
        if (questionItem.id == event.questionId) {
          questionItem.selectedOptionID = event.selectedOptionId;
        }
      }

      emit(state.copyWith(
          instructionAndQuestionsList: newInstructionAndQuestionsList));
    });

    on<SubmitTest>((event, emit) {
      int count = 0;
      var newInstructionAndQuestionsList = state.instructionAndQuestionsList;
      for (var questionItem in newInstructionAndQuestionsList[0].questions) {
        if (questionItem.selectedOptionID == questionItem.answerId) {
          count++;
        }
      }
      emit(state.copyWith(correctAnswers: count));
    });
  }
}
