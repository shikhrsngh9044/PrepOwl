part of 'login_bloc.dart';

abstract class LoginEvent {
  const LoginEvent();
}

class GenerateOtp extends LoginEvent {
  const GenerateOtp();
}

class ShowHideResendOTP extends LoginEvent {
  const ShowHideResendOTP();
}
