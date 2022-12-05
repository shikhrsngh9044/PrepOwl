import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileState(filepath: File(''))) {
    on<UpdateFilePath>(
      (event, emit) async {
        emit(state.copyWith(filepath: event.imageFile));
      },
    );

    on<SubmitData>(
      (event, emit) async {
        emit(state.copyWith(isLoading: true));
        try {
          final ref =
              FirebaseFirestore.instance.collection("users").doc(event.uid);
          await ref.set({
            "id": event.uid,
            "name": event.name,
            "email": event.email,
            "profilePic": event.profilePic,
          });
          emit(state.copyWith(
            isLoading: false,
            isSuccess: true,
          ));
        } catch (e) {
          emit(state.copyWith(
            isLoading: false,
            isSuccess: false,
          ));
        }
        emit(state.copyWith(
          isLoading: false,
          isSuccess: true,
        ));
      },
    );
  }
}
