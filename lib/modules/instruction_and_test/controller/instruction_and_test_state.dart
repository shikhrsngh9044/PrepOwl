part of 'instruction_and_test_bloc.dart';

class InstructionAndTestState {
  final bool readInstructions;
  final bool proceedToStartTest;
  final int selectedQuestionIndex;
  final List<TestDTO> instructionAndQuestionsList;

  InstructionAndTestState({
    this.readInstructions = false,
    this.proceedToStartTest = false,
    this.selectedQuestionIndex = 0,
    this.instructionAndQuestionsList = const [],
  });

  InstructionAndTestState copyWith({
    bool? readInstructions,
    bool? proceedToStartTest,
    int? selectedQuestionIndex,
    List<TestDTO>? instructionAndQuestionsList,
  }) {
    return InstructionAndTestState(
      readInstructions: readInstructions ?? this.readInstructions,
      proceedToStartTest: proceedToStartTest ?? this.proceedToStartTest,
      selectedQuestionIndex:
          selectedQuestionIndex ?? this.selectedQuestionIndex,
      instructionAndQuestionsList:
          instructionAndQuestionsList ?? this.instructionAndQuestionsList,
    );
  }

  @override
  String toString() =>
      'InstructionAndTestState(readInstructions: $readInstructions, proceedToStartTest: $proceedToStartTest, selectedQuestionIndex: $selectedQuestionIndex, instructionAndQuestionsList: $instructionAndQuestionsList,)';
}
