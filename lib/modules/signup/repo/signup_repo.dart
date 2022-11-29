import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:hive/hive.dart';

import '../../../_utils/entities/api_response.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class SignupRepo {
  Future<APIResponse<Unit>> facebookLogin();
  Future<APIResponse<Unit>> facebookLogout();
  Future<APIResponse<Unit>> googleLogin();
  Future<APIResponse<Unit>> googleLogout();
}

class SignupRepoImp implements SignupRepo {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final hiveBox = Hive.box("core");
  @override
  Future<APIResponse<Unit>> facebookLogin() async {
    try {
      final user_id =
          await firebaseFirestore.collection("signup_user_id").get();

      final LoginResult result = await FacebookAuth.instance
          .login(permissions: ['public_profile', 'email']);
      final userData = await FacebookAuth.i.getUserData();

      if (result.status == LoginStatus.success) {
        hiveBox.put("email", userData["email"]);
        hiveBox.put("uid", userData["uid"]);

        return right(unit);
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
  Future<APIResponse<Unit>> googleLogin() async {
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

        hiveBox.put("email", result.user?.email);

        return right(unit);
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
