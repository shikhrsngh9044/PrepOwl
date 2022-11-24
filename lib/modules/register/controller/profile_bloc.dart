import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileState(filepath: File(''))) {
    on<UpdateFilePath>(
      (event, emit) async {
        XFile? pickedFile = await ImagePicker().pickImage(
          source: ImageSource.gallery,
          maxWidth: 1800,
          maxHeight: 1800,
        );
        if (pickedFile != null) {
          emit(state.copyWith(filepath: File(pickedFile.path)));
        } else {
          emit(state.copyWith(filepath: File('')));
        }
      },
    );
  }
}
