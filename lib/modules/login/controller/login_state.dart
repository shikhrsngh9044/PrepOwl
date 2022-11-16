part of 'login_bloc.dart';

class LoginState {
  final LoginDTO? loginDTO;
  final String errorMessage;
  final bool isLoading;
  final bool isAuthenticated;
  final bool isUnauthenticated;

  LoginState({
    this.loginDTO,
    this.errorMessage = '',
    this.isLoading = false,
    this.isAuthenticated = false,
    this.isUnauthenticated = false,
  });

  LoginState copyWith({
    LoginDTO? loginDTO,
    String? errorMessage,
    bool? isLoading,
    bool? isAuthenticated,
    bool? isUnauthenticated,
  }) {
    return LoginState(
      loginDTO: loginDTO ?? this.loginDTO,
      errorMessage: errorMessage ?? this.errorMessage,
      isLoading: isLoading ?? this.isLoading,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      isUnauthenticated: isUnauthenticated ?? this.isUnauthenticated,
    );
  }

  @override
  String toString() =>
      'LoginState(loginDTO: $loginDTO, errorMessage: $errorMessage, isLoading: $isLoading, isAuthenticated: $isAuthenticated, isUnauthenticated: $isUnauthenticated,)';
}
