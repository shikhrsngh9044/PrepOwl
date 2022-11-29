part of 'signup_bloc.dart';

abstract class SignupEvent {
  const SignupEvent();
}

class GetMail extends SignupEvent {
  const GetMail();
}
