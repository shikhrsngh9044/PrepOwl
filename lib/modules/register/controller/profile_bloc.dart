import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileState(filepath: File(''))) {
    on<UpdateFilePath>(
      (event, emit) async {
        emit(state.copyWith(filepath: event.imageFile));
      },
    );
  }
}
