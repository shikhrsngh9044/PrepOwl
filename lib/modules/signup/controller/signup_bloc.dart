import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import '../repo/signup_repo.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupState()) {
    on<GetMail>((event, emit) async {
      final coreBox = Hive.box("core");
      final email = coreBox.get("email");
      emit(state.copyWith(
        isRegistering: true,
        email: email,
      ));
      final result = await SignupRepoImp().googleLogin();

      final updatedState = result.fold(
        (l) => state.copyWith(isRegistering: false, isRegistered: false),
        (r) => state.copyWith(
            isRegistering: false, email: email, isRegistered: true),
      );

      emit(updatedState);
    });
  }
}
