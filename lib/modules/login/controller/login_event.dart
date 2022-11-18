part of 'login_bloc.dart';

abstract class LoginEvent {
  const LoginEvent();
}

class GoogleLogin extends LoginEvent {
  const GoogleLogin();
}

class GoogleLogout extends LoginEvent {
  const GoogleLogout();
}
