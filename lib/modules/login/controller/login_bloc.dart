import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState(isOtpGenerated: false, showResendOtp: false)) {
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
  }
}
