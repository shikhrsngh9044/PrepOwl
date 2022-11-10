import 'package:flutter/material.dart';

import '../entities/user_model.dart';

class AppState extends ChangeNotifier {
  String _token = "";
  UserModel _currentUser = UserModel.fromMap({});

  ///* Token
  String get getToken => _token;
  set setToken(String token) => _token = token;

  ///* Current User
  UserModel get getCurrentUser => _currentUser;
  set setCurrentUser(UserModel user) => _currentUser = user;
}
