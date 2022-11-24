part of 'profile_bloc.dart';

class ProfileState {
  final File filepath;

  ProfileState({required this.filepath});

  ProfileState copyWith({
    File? filepath,
  }) {
    return ProfileState(
      filepath: filepath ?? this.filepath,
    );
  }

  @override
  String toString() => 'ProfileState(filepath: $filepath)';
}
