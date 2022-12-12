part of 'instruction_and_test_bloc.dart';

abstract class InstructionAndTestEvent {
  const InstructionAndTestEvent();
}

class ReadInstructions extends InstructionAndTestEvent {
  const ReadInstructions();
}

class StartTest extends InstructionAndTestEvent {
  const StartTest();
}

class UpdateSelectedQuestionIndex extends InstructionAndTestEvent {
  DIRECTION direction;
  int currentIndex;

  UpdateSelectedQuestionIndex(
    this.direction,
    this.currentIndex,
  );
}

class GetTestQuestions extends InstructionAndTestEvent {
  String testId;

  GetTestQuestions(
    this.testId,
  );
}

class UpdateAnsweredOption extends InstructionAndTestEvent {
  String questionId;
  String selectedOptionId;

  UpdateAnsweredOption(
    this.questionId,
    this.selectedOptionId,
  );
}
