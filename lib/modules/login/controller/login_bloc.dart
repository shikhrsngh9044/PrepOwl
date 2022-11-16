import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/login_dto.dart';
import '../repo/login_repo.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
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
            loginDTO: r,
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
