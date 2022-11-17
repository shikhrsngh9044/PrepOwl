part of 'login_bloc.dart';

class LoginState {
  final UserDTO? userDTO;
  final String errorMessage;
  final bool isLoading;
  final bool isAuthenticated;
  final bool isUnauthenticated;

  LoginState({
    this.userDTO,
    this.errorMessage = '',
    this.isLoading = false,
    this.isAuthenticated = false,
    this.isUnauthenticated = false,
  });

  LoginState copyWith({
    UserDTO? userDTO,
    String? errorMessage,
    bool? isLoading,
    bool? isAuthenticated,
    bool? isUnauthenticated,
  }) {
    return LoginState(
      userDTO: userDTO ?? this.userDTO,
      errorMessage: errorMessage ?? this.errorMessage,
      isLoading: isLoading ?? this.isLoading,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      isUnauthenticated: isUnauthenticated ?? this.isUnauthenticated,
    );
  }

  @override
  String toString() =>
      'LoginState(userDTO: $userDTO, errorMessage: $errorMessage, isLoading: $isLoading, isAuthenticated: $isAuthenticated, isUnauthenticated: $isUnauthenticated,)';
}
