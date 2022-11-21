part of 'login_bloc.dart';

abstract class LoginState {
  const LoginState();

  @override
  // ignore: override_on_non_overriding_member
  List<Object> get props => [];
}

class PhoneAuthInitial extends LoginState {}

class PhoneAuthLoading extends LoginState {}

class PhoneAuthError extends LoginState {
  final String error;

  const PhoneAuthError({required this.error});

  @override
  List<Object> get props => [error];
}

class PhoneAuthVerified extends LoginState {}

class PhoneAuthCodeSentSuccess extends LoginState {
  final String verificationId;
  const PhoneAuthCodeSentSuccess({
    required this.verificationId,
  });
  @override
  List<Object> get props => [verificationId];
}
