import 'package:dartz/dartz.dart';
import 'package:dartz_test/dartz_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:prepowl/_utils/entities/api_response.dart';
import 'package:prepowl/modules/onboarding/model/exam_category_dto.dart';
import 'package:prepowl/modules/onboarding/repo/onboarding_repo.dart';

import 'onboarding_repo_test.mocks.dart';

class OnboardingRepositotyImplTest extends Mock
    implements OnboardingRepositotyImpl {}

@GenerateMocks([OnboardingRepositotyImplTest])
void main() {
  late MockOnboardingRepositotyImplTest mockOnboardingRepo;
  setUp(() {
    mockOnboardingRepo = MockOnboardingRepositotyImplTest();
  });

  group("Get exam category list.", () {
    test("Success", () async {
      final List<ExamCategoryDTO> examCategoryList = [
        ExamCategoryDTO(
          id: "1",
          title: "exam_category",
        ),
      ];

      Either<Failure, List<ExamCategoryDTO>> response = Right(
        examCategoryList,
      );

      when(
        mockOnboardingRepo.getAllExamCategoryList(),
      ).thenAnswer(
        (_) async => response,
      );

      final result = await mockOnboardingRepo.getAllExamCategoryList();

      expect(
        result,
        isRight,
      );
      expect(
        result,
        response,
      );
    });

    test("Failure", () async {
      final failure = Failure(
        code: 400,
        response: "Something went wrong",
      );

      Either<Failure, List<ExamCategoryDTO>> response = Left(
        failure,
      );

      when(
        mockOnboardingRepo.getAllExamCategoryList(),
      ).thenAnswer((realInvocation) async => response);

      final result = await mockOnboardingRepo.getAllExamCategoryList();

      expect(
        result,
        isLeft,
      );
      expect(
        result,
        response,
      );
    });
  });
}
