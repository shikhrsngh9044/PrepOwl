// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'signup_bloc.dart';

class SignupState {
  final String? photoUrl;
  final String fullName;
  final String email;
  final bool isRegistering;
  final bool isRegistered;

  SignupState({
    this.photoUrl,
    this.fullName = "",
    this.email = "",
    this.isRegistering = false,
    this.isRegistered = false,
  });

  SignupState copyWith(
      {String? photoUrl,
      String? fullName,
      String? email,
      bool? isLoading,
      bool? isRegistering,
      bool? isRegistered}) {
    return SignupState(
        photoUrl: photoUrl ?? this.photoUrl,
        fullName: fullName ?? this.fullName,
        email: email ?? this.email,
        isRegistering: isRegistering ?? this.isRegistering,
        isRegistered: isRegistered ?? this.isRegistered);
  }

  @override
  String toString() {
    return 'SignupState(photoUrl: $photoUrl, fullName: $fullName, email: $email, isRegistering: $isRegistering, isRegistered: $isRegistered)';
  }
}
