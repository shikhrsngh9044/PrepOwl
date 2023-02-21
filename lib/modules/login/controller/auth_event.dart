part of 'auth_bloc.dart';

abstract class AuthEvent {}

class ChangePhoneNumber extends AuthEvent {
  final String value;

  ChangePhoneNumber(this.value);
}

class VerifyPhoneNumber extends AuthEvent {}

class ChangeOTP extends AuthEvent {
  final String value;
  ChangeOTP(this.value);
}

class VerifyOTP extends AuthEvent {}

class GoogleLogin extends AuthEvent {}
