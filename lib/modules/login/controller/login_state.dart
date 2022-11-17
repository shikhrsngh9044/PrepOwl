// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_bloc.dart';

class LoginState {
  final bool isOtpGenerated;
  final bool? showResendOtp;

  LoginState({
    required this.isOtpGenerated,
    this.showResendOtp,
  });

  LoginState copyWith({
    bool? isOtpGenerated,
    bool? showResendOtp,
  }) {
    return LoginState(
      isOtpGenerated: isOtpGenerated ?? this.isOtpGenerated,
      showResendOtp: showResendOtp ?? this.showResendOtp,
    );
  }

  @override
  String toString() =>
      'LoginState(isOtpGenerated: $isOtpGenerated, showResendOtp: $showResendOtp )';
}
