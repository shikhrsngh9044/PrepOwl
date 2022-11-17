import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../_utils/entities/api_response.dart';
import '../model/user_dto.dart';

abstract class LoginRepo {
  Future<APIResponse<UserDTO>> googleLogin();
  Future<APIResponse<Unit>> googleLogout();
}

class LoginRepoImp implements LoginRepo {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<APIResponse<UserDTO>> googleLogin() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await GoogleSignIn().signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        UserCredential result =
            await _firebaseAuth.signInWithCredential(credential);

        UserDTO userDTO = UserDTO(
            email: result.user?.email,
            photoUrl: result.user?.photoURL,
            name: result.user?.displayName,
            uid: result.user?.uid);

        return right(userDTO);
      } else {
        return left(Failure(code: 500, response: 'Something went wrong'));
      }
    } catch (e) {
      return left(Failure(code: 500, response: e.toString()));
    }
  }

  @override
  Future<APIResponse<Unit>> googleLogout() async {
    await _firebaseAuth.signOut();
    return right(unit);
  }
}
