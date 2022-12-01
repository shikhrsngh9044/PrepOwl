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

class GoogleLogin extends LoginEvent {}

class GoogleLogout extends LoginEvent {}

class GenerateOtp extends LoginEvent {}

class ShowHideResendOTP extends LoginEvent {}

class SendOtpToPhoneEvent extends LoginEvent {
  final String phoneNumber;

  const SendOtpToPhoneEvent({required this.phoneNumber});
}

class VerifySentOtpEvent extends LoginEvent {
  final String otpCode;
  final String verificationId;

  const VerifySentOtpEvent(
      {required this.otpCode, required this.verificationId});

  List<Object> get props => [otpCode, verificationId];
}

class OnPhoneOtpSent extends LoginEvent {
  final String verificationId;
  final int? token;
  const OnPhoneOtpSent({
    required this.verificationId,
    required this.token,
  });

  List<Object> get props => [verificationId];
}

class OnPhoneAuthErrorEvent extends LoginEvent {
  final String error;
  const OnPhoneAuthErrorEvent({required this.error});

  List<Object> get props => [error];
}

class OnPhoneAuthVerificationCompleteEvent extends LoginEvent {
  final AuthCredential credential;
  const OnPhoneAuthVerificationCompleteEvent({
    required this.credential,
  });
}

class UpdateUserStatus extends LoginEvent {
  String? uid;
  UpdateUserStatus(this.uid);
}
