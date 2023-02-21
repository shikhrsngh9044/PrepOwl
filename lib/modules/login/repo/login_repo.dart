import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:prepowl/_utils/ui_components/widget_extensions.dart';

import '../../../_utils/entities/api_response.dart';
import '../model/user_dto.dart';

abstract class LoginRepo {
  Future<APIResponse<Unit>> verifyPhoneNumber({required String phoneNumber});
  Future<APIResponse<bool>> signInWithSmsCode({required String smsCode});
  Future<APIResponse<UserDTO>> googleLogin();
}

class LoginRepoImp implements LoginRepo {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  final completer = Completer<String>();
  String _verificationCode = "";
  FirebaseAuthException? verifyAuthException;

  @override
  Future<APIResponse<Unit>> verifyPhoneNumber(
      {required String phoneNumber}) async {
    try {
      await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: const Duration(seconds: 3),
        verificationCompleted: _verificationCompleted,
        verificationFailed: (authException) =>
            _verificationFailed(authException),
        codeSent: (verificationCode, token) =>
            _smsCodeSent(verificationCode, token),
        codeAutoRetrievalTimeout: (verificationCode) =>
            _codeAutoRetrievalTimeout(verificationCode),
      );

      if (verifyAuthException != null) {
        return left(Failure(
          code: 400,
          response: verifyAuthException?.message ??
              "Some error occurred. Please try again!",
        ));
      } else {
        final verificationCode = await completer.future;
        "verification code: $verificationCode".logIt;

        return right(unit);
      }
    } on FirebaseAuthException catch (ex) {
      "<=====Error: \ncode: ${ex.code}\nmessage: ${ex.message}\n=====>".logIt;

      return left(Failure(
        code: 500,
        response: ex.message ?? "Some error occurred. Please try again!",
      ));
    } catch (e) {
      return left(Failure(
        code: 500,
        response: e.toString(),
      ));
    }
  }

  @override
  Future<APIResponse<bool>> signInWithSmsCode({required String smsCode}) async {
    try {
      final AuthCredential authCredential = PhoneAuthProvider.credential(
        verificationId: _verificationCode,
        smsCode: smsCode,
      );

      await FirebaseAuth.instance.signInWithCredential(authCredential);

      return right(true);
    } on FirebaseAuthException catch (ex) {
      return left(Failure(
        response: ex.message ?? "Some error occurred. Please try again!",
      ));
    } catch (e) {
      return left(Failure(code: 500, response: e.toString()));
    }
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
          uid: result.user?.uid,
        );

        return right(userDTO);
      } else {
        return left(Failure(code: 500, response: 'Something went wrong'));
      }
    } catch (e) {
      return left(Failure(code: 500, response: e.toString()));
    }
  }

  void _verificationCompleted(AuthCredential authCredential) {}

  void _smsCodeSent(String verificationCode, int? token) {
    _verificationCode = verificationCode;
  }

  String _verificationFailed(FirebaseAuthException authException) {
    verifyAuthException = authException;
    return authException.message ?? "Error occurred. Please try again!";
  }

  void _codeAutoRetrievalTimeout(String verificationCode) {
    _verificationCode = verificationCode;
    completer.complete(verificationCode);
  }
}
