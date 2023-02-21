// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

class AuthState {
  final String phoneNumber;
  final String otp;
  final bool isLoading;
  final bool isNewUser;
  final bool isAuthenticated;
  final bool isOtpGenerated;
  final Option<Either<Failure, Unit>>? failureOrSuccess;

  AuthState({
    this.phoneNumber = "",
    this.otp = "",
    this.isLoading = false,
    this.isNewUser = false,
    this.failureOrSuccess,
    this.isOtpGenerated = false,
    this.isAuthenticated = false,
  });

  AuthState copyWith({
    String? phoneNumber,
    String? otp,
    bool? isLoading,
    bool? isNewUser,
    bool? isAuthenticated,
    bool? isOtpGenerated,
    Option<Either<Failure, Unit>>? failureOrSuccess,
  }) {
    return AuthState(
      phoneNumber: phoneNumber ?? this.phoneNumber,
      otp: otp ?? this.otp,
      isLoading: isLoading ?? this.isLoading,
      isNewUser: isNewUser ?? this.isNewUser,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      isOtpGenerated: isOtpGenerated ?? this.isOtpGenerated,
      failureOrSuccess: failureOrSuccess ?? this.failureOrSuccess,
    );
  }
}
