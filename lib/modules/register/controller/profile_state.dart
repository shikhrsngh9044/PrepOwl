part of 'profile_bloc.dart';

class ProfileState {
  final File filepath;
  final bool isLoading;
  final bool isSuccess;

  ProfileState(
      {required this.filepath, this.isLoading = false, this.isSuccess = false});

  ProfileState copyWith({
    File? filepath,
    bool? isLoading,
    bool? isSuccess,
  }) {
    return ProfileState(
      filepath: filepath ?? this.filepath,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }

  @override
  String toString() =>
      'ProfileState(filepath: $filepath, isLoading: $isLoading, isSuccess: $isSuccess)';
}
