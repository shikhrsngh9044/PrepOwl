part of 'profile_bloc.dart';

abstract class ProfileEvent {
  const ProfileEvent();
}

class UpdateFilePath extends ProfileEvent {
  const UpdateFilePath();
}
