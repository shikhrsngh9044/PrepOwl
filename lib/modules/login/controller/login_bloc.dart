import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/user_dto.dart';
import '../repo/login_repo.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;

    on<SendOtpToPhoneEvent>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      try {
        await LoginRepoImp().verifyPhone(
          phoneNumber: event.phoneNumber,
          verificationCompleted: (PhoneAuthCredential credential) async {
            add(OnPhoneAuthVerificationCompleteEvent(credential: credential));
          },
          codeSent: (String verificationId, int? resendToken) {
            add(OnPhoneOtpSent(
                verificationId: verificationId, token: resendToken));
          },
          verificationFailed: (FirebaseAuthException e) {
            add(OnPhoneAuthErrorEvent(error: e.code));
          },
          codeAutoRetrievalTimeout: (String verificationId) {},
        );
        emit(state.copyWith(isLoading: false));
      } catch (e) {
        emit(state.copyWith(errorMessage: e.toString(), isLoading: false));
      }
    });

    on<VerifySentOtpEvent>((event, emit) {
      try {
        emit(state.copyWith(isLoading: true));

        PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: event.verificationId,
          smsCode: event.otpCode,
        );
        add(OnPhoneAuthVerificationCompleteEvent(credential: credential));
        emit(state.copyWith(isLoading: false, isAuthenticated: true));
      } catch (e) {
        emit(state.copyWith(errorMessage: e.toString(), isLoading: false));
      }
    });

    on<OnPhoneOtpSent>((event, emit) =>
        emit(state.copyWith(verificationId: event.verificationId)));

    on<OnPhoneAuthErrorEvent>(
        (event, emit) => emit(state.copyWith(errorMessage: event.error)));

    on<OnPhoneAuthVerificationCompleteEvent>((event, emit) async {
      try {
        await firebaseAuth.signInWithCredential(event.credential).then((user) {
          if (user.user != null) {
            emit(state.copyWith(isAuthenticated: true));
          }
        });
      } on FirebaseAuthException catch (e) {
        emit(state.copyWith(errorMessage: e.code));
      } catch (e) {
        emit(state.copyWith(errorMessage: e.toString()));
      }
    });

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
