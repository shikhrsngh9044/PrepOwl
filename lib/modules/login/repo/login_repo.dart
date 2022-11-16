import 'package:dartz/dartz.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import '../../../_utils/entities/api_response.dart';
import '../model/login_dto.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginRepo {
  Future<APIResponse<LoginDTO>> facebookLogin();
  Future<APIResponse<Unit>> facebookLogout();
}

class LoginRepoImp implements LoginRepo {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<APIResponse<LoginDTO>> facebookLogin() async {
    try {
      final LoginResult result = await FacebookAuth.instance
          .login(permissions: ['public_profile', 'email']);
      final userData = await FacebookAuth.i.getUserData();
      if (result.status == LoginStatus.success) {
        final AuthCredential facebookCredential =
            FacebookAuthProvider.credential(result.accessToken!.token);
        final userCredential =
            await _firebaseAuth.signInWithCredential(facebookCredential);
        LoginDTO loginDTO = LoginDTO(
            email: userData["email"].toString(),
            photoUrl: userData["picture"]["data"]["url"].toString(),
            name: userData["name"].toString(),
            uid: userData["id"].toString());
        return right(loginDTO);
      } else {
        return left(Failure(code: 500, response: 'Something went wrong'));
      }
    } catch (e) {
      return left(Failure(code: 500, response: 'Something went wrong'));
    }
  }

  @override
  Future<APIResponse<Unit>> facebookLogout() async {
    await _firebaseAuth.signOut();
    return right(unit);
  }
}
