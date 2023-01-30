import 'package:dartz/dartz.dart';
import 'package:dartz_test/dartz_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:prepowl/_utils/entities/api_response.dart';
import 'package:prepowl/modules/dashboard/model/test_list_dto.dart';
import 'package:prepowl/modules/dashboard/repo/dashboard_repo.dart';
import 'package:prepowl/modules/onboarding/model/exam_category_dto.dart';

import 'dashboard_repo_test.mocks.dart';

class DashboardRepositotyImplTest extends Mock
    implements DashboardRepositotyImpl {}

@GenerateMocks([DashboardRepositotyImplTest])
void main() {
  late MockDashboardRepositotyImplTest mockDashboardRepo;
  setUp(() {
    mockDashboardRepo = MockDashboardRepositotyImplTest();
  });

  group("Get exam category test list.", () {
    test("Success", () async {
      const String examCategoryId = "1";
      final List<TestListDTO> testListDTO = [
        TestListDTO(
          examId: "1",
          id: "1",
          testName: "Test Name1",
          examCategoryId: examCategoryId,
        ),
      ];

      Either<Failure, List<TestListDTO>> response = Right(
        testListDTO,
      );

      when(
        mockDashboardRepo.getTestList(
          examCategoryId,
        ),
      ).thenAnswer(
        (realInvocation) async => response,
      );

      final result = await mockDashboardRepo.getTestList(
        examCategoryId,
      );

      expect(result, isRight);
      expect(result, response);
    });

    test("Failure", () async {
      const String examCategoryId = "1";
      final Failure failure = Failure(
        code: 400,
        response: "Something went wrong",
      );

      Either<Failure, List<TestListDTO>> response = Left(
        failure,
      );

      when(
        mockDashboardRepo.getTestList(
          examCategoryId,
        ),
      ).thenAnswer(
        (realInvocation) async => response,
      );

      final result = await mockDashboardRepo.getTestList(
        examCategoryId,
      );

      expect(result, isLeft);
      expect(result, response);
    });
  });

  group("Get all test list.", () {
    final List<ExamCategoryDTO> examCategoryDTO = [
      ExamCategoryDTO(
        id: "1",
        title: "Exam Category 1",
      ),
    ];

    test("Success", () async {
      final List<TestListDTO> testListDTO = [
        TestListDTO(
          examId: "1",
          id: "1",
          testName: "Test Name1",
          examCategoryId: "1",
        ),
      ];

      Either<Failure, List<TestListDTO>> response = Right(
        testListDTO,
      );

      when(
        mockDashboardRepo.getAllTestList(
          examCategoryDTO,
        ),
      ).thenAnswer(
        (realInvocation) async => response,
      );

      final result = await mockDashboardRepo.getAllTestList(
        examCategoryDTO,
      );

      expect(result, isRight);
      expect(result, response);
    });

    test("Failure", () async {
      final Failure failure = Failure(
        code: 400,
        response: "Something went wrong",
      );

      Either<Failure, List<TestListDTO>> response = Left(
        failure,
      );

      when(
        mockDashboardRepo.getAllTestList(
          examCategoryDTO,
        ),
      ).thenAnswer(
        (realInvocation) async => response,
      );

      final result = await mockDashboardRepo.getAllTestList(
        examCategoryDTO,
      );

      expect(result, isLeft);
      expect(result, response);
    });
  });
}
