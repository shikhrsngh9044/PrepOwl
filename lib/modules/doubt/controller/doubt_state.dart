// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'doubt_bloc.dart';

class DoubtAndCommentState {
  final List<DoubtDTO> doubtList;
  final bool isLoading;
  DoubtAndCommentState({
    this.doubtList = const [],
    this.isLoading = false,
  });

  DoubtAndCommentState copyWith({
    List<DoubtDTO>? doubtList,
    bool? isLoading,
  }) {
    return DoubtAndCommentState(
      doubtList: doubtList ?? this.doubtList,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  String toString() =>
      'DoubtAndCommentState(doubtList: $doubtList, isLoading: $isLoading)';
}
