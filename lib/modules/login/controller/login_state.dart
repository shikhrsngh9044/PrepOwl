part of 'login_bloc.dart';

class LoginState {
  final UserDTO? userDTO;
  final String errorMessage;
  final bool isLoading;
  final bool isAuthenticated;
  final bool isUnauthenticated;
  final bool isOtpGenerated;
  final bool showResendOtp;

  LoginState({
    this.userDTO,
    this.errorMessage = '',
    this.isLoading = false,
    this.isAuthenticated = false,
    this.isUnauthenticated = false,
    this.isOtpGenerated = false,
    this.showResendOtp = false,
  });

  LoginState copyWith({
    UserDTO? userDTO,
    String? errorMessage,
    bool? isLoading,
    bool? isAuthenticated,
    bool? isUnauthenticated,
    bool? isOtpGenerated,
    bool? showResendOtp,
  }) {
    return LoginState(
      userDTO: userDTO ?? this.userDTO,
      errorMessage: errorMessage ?? this.errorMessage,
      isLoading: isLoading ?? this.isLoading,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      isUnauthenticated: isUnauthenticated ?? this.isUnauthenticated,
      isOtpGenerated: isOtpGenerated ?? this.isOtpGenerated,
      showResendOtp: showResendOtp ?? this.showResendOtp,
    );
  }

  @override
  String toString() {
    return 'LoginState(userDTO: $userDTO, errorMessage: $errorMessage, isLoading: $isLoading, isAuthenticated: $isAuthenticated, isUnauthenticated: $isUnauthenticated, isOtpGenerated: $isOtpGenerated, showResendOtp: $showResendOtp)';
  }
}
