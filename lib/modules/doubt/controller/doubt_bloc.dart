import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prepowl/modules/doubt/model/doubt_dto.dart';

import '../repo/doubt_repo.dart';
part 'doubt_event.dart';
part 'doubt_state.dart';

class DoubtandCommentBloc
    extends Bloc<DoubtAndCommentEvent, DoubtAndCommentState> {
  DoubtandCommentBloc()
      : super(
          DoubtAndCommentState(),
        ) {
    on<GetDoubtAndComment>(
      (
        event,
        emit,
      ) async {
        final result =
            await DoubtAndCommentRepositoryImpl().getDoubtAndCommentList();

        final updatedState = result.fold(
          (l) => state.copyWith(
            doubtList: [],
          ),
          (r) {
            return state.copyWith(
              doubtList: r,
            );
          },
        );
        emit(
          updatedState,
        );
      },
    );
  }
}
