import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/user_dto.dart';
import '../repo/login_repo.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    on<FacebookLogin>((event, emit) async {
      emit(state.copyWith(
        isLoading: true,
      ));
      final result = await LoginRepoImp().facebookLogin();
      final updatedState = result.fold(
        (l) => state.copyWith(
          isLoading: false,
          errorMessage: l.response.toString(),
          isUnauthenticated: true,
          isAuthenticated: false,
        ),
        (r) {
          return state.copyWith(
            isLoading: false,
            userDTO: r,
            isUnauthenticated: false,
            isAuthenticated: true,
          );
        },
      );
      emit(updatedState);
    });

    on<FacebookLogout>((event, emit) async {
      emit(state.copyWith(
        isLoading: true,
      ));
      final result = await LoginRepoImp().facebookLogout();
      final updatedState = result.fold(
        (l) => state.copyWith(
            isLoading: false,
            errorMessage: l.response.toString(),
            isUnauthenticated: true),
        (r) {
          return state.copyWith(
            isLoading: false,
            isUnauthenticated: true,
            isAuthenticated: false,
          );
        },
      );
      emit(updatedState);
    });

    on<GenerateOtp>(
      (event, emit) {
        emit(state.copyWith(isOtpGenerated: true));
      },
    );

    on<ShowHideResendOTP>(
      (event, emit) {
        emit(state.copyWith(showResendOtp: true));
      },
    );

    on<GoogleLogin>((event, emit) async {
      emit(state.copyWith(
        isLoading: true,
      ));

      final result = await LoginRepoImp().googleLogin();

      final updatedState = result.fold(
        (l) => state.copyWith(
          isLoading: false,
          errorMessage: l.response.toString(),
          isUnauthenticated: true,
          isAuthenticated: false,
        ),
        (r) {
          return state.copyWith(
            isLoading: false,
            userDTO: r,
            isUnauthenticated: false,
            isAuthenticated: true,
          );
        },
      );

      emit(updatedState);
    });

    on<GoogleLogout>((event, emit) async {
      emit(state.copyWith(
        isLoading: true,
      ));

      final result = await LoginRepoImp().googleLogout();

      final updatedState = result.fold(
        (l) => state.copyWith(
            isLoading: false,
            errorMessage: l.response.toString(),
            isUnauthenticated: true),
        (r) {
          return state.copyWith(
            isLoading: false,
            isUnauthenticated: true,
            isAuthenticated: false,
          );
        },
      );

      emit(updatedState);
    });
  }
}
