import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../_utils/entities/api_response.dart';
import '../model/user_dto.dart';
import '../repo/login_repo.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthState()) {
    on<ChangePhoneNumber>((event, emit) async {
      emit(state.copyWith(phoneNumber: event.value));
    });

    on<ChangeOTP>((event, emit) async {
      emit(state.copyWith(otp: event.value));
    });

    on<VerifyPhoneNumber>((event, emit) async {
      emit(state.copyWith(isLoading: true));

      final result = await LoginRepoImp()
          .verifyPhoneNumber(phoneNumber: "+91${state.phoneNumber}");

      final updatedState = result.fold(
        (l) => state.copyWith(
          isLoading: false,
          failureOrSuccess: optionOf(left(l)),
        ),
        (r) => state.copyWith(
          isLoading: false,
          isOtpGenerated: true,
          failureOrSuccess: optionOf(right(unit)),
        ),
      );

      emit(updatedState);
    });

    on<VerifyOTP>((event, emit) async {
      emit(state.copyWith(isLoading: true));

      final result = await LoginRepoImp().signInWithSmsCode(smsCode: state.otp);

      final updatedState = result.fold(
        (l) => state.copyWith(
          isLoading: false,
          otp: "",
          failureOrSuccess: optionOf(left(l)),
        ),
        (r) => state.copyWith(
          isLoading: false,
          failureOrSuccess: optionOf(right(unit)),
        ),
      );

      emit(updatedState);
    });

    on<GoogleLogin>((event, emit) async {
      emit(state.copyWith(
        isLoading: true,
      ));

      final result = await LoginRepoImp().googleLogin();

      final updatedState = result.fold(
        (l) => state.copyWith(
          isLoading: false,
          isAuthenticated: false,
        ),
        (r) => state.copyWith(
          isLoading: false,
          isAuthenticated: true,
        ),
      );

      emit(updatedState);
    });
  }
}
