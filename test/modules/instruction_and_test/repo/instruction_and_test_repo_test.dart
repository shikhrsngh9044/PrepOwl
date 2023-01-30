import 'package:dartz/dartz.dart';
import 'package:dartz_test/dartz_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:prepowl/_utils/entities/api_response.dart';
import 'package:prepowl/modules/instruction_and_test/model/test_dto.dart';
import 'package:prepowl/modules/instruction_and_test/model/test_options_dto.dart';
import 'package:prepowl/modules/instruction_and_test/model/test_questions_dto.dart';
import 'package:prepowl/modules/instruction_and_test/repo/instruction_and_test_repo.dart';

import 'instruction_and_test_repo_test.mocks.dart';

class InstructionAndTestRepositoryImplTest extends Mock
    implements InstructionAndTestRepositoryImpl {}

@GenerateMocks([InstructionAndTestRepositoryImplTest])
void main() {
  late MockInstructionAndTestRepositoryImplTest mockInstructionAndTestRepo;
  setUp(() {
    mockInstructionAndTestRepo = MockInstructionAndTestRepositoryImplTest();
  });

  group("Instruction And Test", () {
    const String testId = "1";

    test("Success", () async {
      final List<TestOptionsDTO> testOptionsDTO = [
        TestOptionsDTO(
          id: "1",
          optionImage: "",
          optionTitle: "Option 1",
        ),
      ];

      final List<TestQuestionsDTO> testQuestionsDTO = [
        TestQuestionsDTO(
          id: "1",
          question: "Question 1",
          options: testOptionsDTO,
          answerId: "1",
        ),
      ];

      final List<TestDTO> testDTO = [
        TestDTO(
          id: "1",
          testId: testId,
          instructions: "instructions",
          questions: [],
          timeDuration: "25",
        ),
      ];

      Either<Failure, List<TestDTO>> response = Right(
        testDTO,
      );

      when(mockInstructionAndTestRepo.getInstructionsAndQuestion(
        testId,
      )).thenAnswer(
        (realInvocation) async => response,
      );

      final result =
          await mockInstructionAndTestRepo.getInstructionsAndQuestion(
        testId,
      );

      expect(result, isRight);
      expect(result, response);
    });

    test("Failure", () async {
      final Failure failure = Failure(
        code: 400,
        response: "Something went wrong",
      );

      Either<Failure, List<TestDTO>> response = Left(
        failure,
      );

      when(mockInstructionAndTestRepo.getInstructionsAndQuestion(
        testId,
      )).thenAnswer(
        (realInvocation) async => response,
      );

      final result =
          await mockInstructionAndTestRepo.getInstructionsAndQuestion(
        testId,
      );

      expect(result, isLeft);
      expect(result, response);
    });
  });
}
