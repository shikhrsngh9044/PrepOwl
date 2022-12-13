import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../_utils/res/dimen.dart';
import '../controller/doubt_bloc.dart';

class DoubtScreen extends StatelessWidget {
  const DoubtScreen({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  Widget build(
    BuildContext context,
  ) {
    return BlocProvider(
      create: (
        context,
      ) =>
          DoubtandCommentBloc()..add(const GetDoubtAndComment()),
      child: const DoubtScreenUI(),
    );
  }
}

class DoubtScreenUI extends StatelessWidget {
  const DoubtScreenUI({super.key});

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      body: BlocConsumer<DoubtandCommentBloc, DoubtAndCommentState>(
        listener: (
          context,
          state,
        ) {},
        builder: (
          context,
          state,
        ) {
          return Center(
            child: Text(
              state.doubtList.toString(),
              style: const TextStyle(
                fontSize: AppDimen.size15,
              ),
            ),
          );
        },
      ),
    );
  }
}
