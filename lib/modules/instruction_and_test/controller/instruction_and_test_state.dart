part of 'instruction_and_test_bloc.dart';

class InstructionAndTestState {
  final bool readInstructions;
  final bool proceedToStartTest;
  final int selectedQuestionIndex;

  InstructionAndTestState({
    this.readInstructions = false,
    this.proceedToStartTest = false,
    this.selectedQuestionIndex = 0,
  });

  InstructionAndTestState copyWith({
    bool? readInstructions,
    bool? proceedToStartTest,
    int? selectedQuestionIndex,
  }) {
    return InstructionAndTestState(
      readInstructions: readInstructions ?? this.readInstructions,
      proceedToStartTest: proceedToStartTest ?? this.proceedToStartTest,
      selectedQuestionIndex:
          selectedQuestionIndex ?? this.selectedQuestionIndex,
    );
  }

  @override
  String toString() =>
      'InstructionAndTestState(readInstructions: $readInstructions, proceedToStartTest: $proceedToStartTest, selectedQuestionIndex: $selectedQuestionIndex)';
}
