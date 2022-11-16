part of 'login_bloc.dart';

abstract class LoginEvent {
  const LoginEvent();
}

class FacebookLogin extends LoginEvent {
  const FacebookLogin();
}

class FacebookLogout extends LoginEvent {
  const FacebookLogout();
}
