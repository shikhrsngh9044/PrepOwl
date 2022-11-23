import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../_utils/entities/api_response.dart';
import '../model/user_dto.dart';

abstract class LoginRepo {
  Future<APIResponse<UserDTO>> facebookLogin();
  Future<APIResponse<Unit>> facebookLogout();
  Future<APIResponse<UserDTO>> googleLogin();
  Future<APIResponse<Unit>> googleLogout();
}

class LoginRepoImp implements LoginRepo {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<APIResponse<UserDTO>> facebookLogin() async {
    try {
      final LoginResult result = await FacebookAuth.instance
          .login(permissions: ['public_profile', 'email']);
      final userData = await FacebookAuth.i.getUserData();
      if (result.status == LoginStatus.success) {
        UserDTO userDTO = UserDTO(
            email: userData["email"].toString(),
            photoUrl: userData["picture"]["data"]["url"].toString(),
            name: userData["name"].toString(),
            uid: userData["id"].toString());
        return right(userDTO);
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

  Future<void> verifyPhone({
    required String phoneNumber,
    required Function(PhoneAuthCredential) verificationCompleted,
    required Function(FirebaseAuthException) verificationFailed,
    required Function(String, int?) codeSent,
    required Function(String) codeAutoRetrievalTimeout,
  }) async {
    await _firebaseAuth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
  }
}
