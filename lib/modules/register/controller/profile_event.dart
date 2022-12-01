part of 'profile_bloc.dart';

abstract class ProfileEvent {
  const ProfileEvent();
}

class UpdateFilePath extends ProfileEvent {
  File imageFile;
  UpdateFilePath(this.imageFile);
}

class SubmitData extends ProfileEvent {
  String profilePic, uid, name, email;
  SubmitData(this.uid, this.name, this.email, this.profilePic);
}
