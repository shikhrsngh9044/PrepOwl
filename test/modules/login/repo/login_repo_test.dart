import 'package:dartz/dartz.dart';
import 'package:dartz_test/dartz_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:prepowl/_utils/entities/api_response.dart';
import 'package:prepowl/modules/login/model/user_dto.dart';
import 'package:prepowl/modules/login/repo/login_repo.dart';

import 'login_repo_test.mocks.dart';

class LoginRepoImpTest extends Mock implements LoginRepoImp {}

@GenerateMocks([LoginRepoImpTest])
void main() {
  late MockLoginRepoImpTest mockLoginRepo;
  setUp(() {
    mockLoginRepo = MockLoginRepoImpTest();
  });

  group("Google Login", () {
    test("Successful google login", () async {
      final UserDTO userDTO = UserDTO(
        uid: "1",
        photoUrl: "",
        email: "astha@gmail.com",
        name: "Astha Gupta",
      );

      Either<Failure, UserDTO> response = Right(
        userDTO,
      );

      when(mockLoginRepo.googleLogin()).thenAnswer(
        (realInvocation) async => response,
      );

      final result = await mockLoginRepo.googleLogin();

      expect(result, isRight);
      expect(result, response);
    });

    test("Google login failed", () async {
      final Failure failure = Failure(
        code: 500,
        response: "Something went wrong",
      );

      Either<Failure, UserDTO> response = Left(
        failure,
      );

      when(mockLoginRepo.googleLogin()).thenAnswer(
        (realInvocation) async => response,
      );

      final result = await mockLoginRepo.googleLogin();

      expect(result, isLeft);
      expect(result, response);
    });
  });
}
