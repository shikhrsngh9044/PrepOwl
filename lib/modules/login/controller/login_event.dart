part of 'login_bloc.dart';

abstract class LoginEvent {
  const LoginEvent();
}

class GoogleLogin extends LoginEvent {}

class GoogleLogout extends LoginEvent {}

class GenerateOtp extends LoginEvent {}

class ShowHideResendOTP extends LoginEvent {}
