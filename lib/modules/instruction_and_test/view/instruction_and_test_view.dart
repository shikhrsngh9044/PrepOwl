import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../_utils/configs/theme_config.dart';
import '../../../_utils/constants/string_constants.dart';
import '../../../_utils/res/dimen.dart';
import '../controller/instruction_and_test_bloc.dart';
import 'widgets/instructions_view.dart';
import 'widgets/test_view.dart';

class InstructionAndTest extends StatelessWidget {
  const InstructionAndTest({
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
          InstructionAndTestBloc()..add(GetTestQuestions("1")),
      child: const InstructionAndTestUI(),
    );
  }
}

class InstructionAndTestUI extends StatelessWidget {
  const InstructionAndTestUI({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AppConst.instructions,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: AppTheme.secondaryColor,
      ),
      body: BlocConsumer<InstructionAndTestBloc, InstructionAndTestState>(
        listener: (
          context,
          state,
        ) {},
        builder: (
          context,
          state,
        ) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimen.size20,
              vertical: AppDimen.size15,
            ),
            child: state.proceedToStartTest
                ? TestView(
                    state: state,
                  )
                : InstructionView(
                    state: state,
                  ),
          );
        },
      ),
    );
  }
}
