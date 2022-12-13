import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../_utils/constants/routes.dart';
import '../../../_utils/constants/string_constants.dart';
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
          InstructionAndTestBloc()..add(GetTestQuestions(Get.arguments)),
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
      body: BlocConsumer<InstructionAndTestBloc, InstructionAndTestState>(
        listener: (
          context,
          state,
        ) {
          if (state.correctAnswers != -1) {
            var data = {
              'answerCount': state.correctAnswers,
              'questionsLength':
                  state.instructionAndQuestionsList[0].questions.length,
            };
            Get.offAndToNamed(
              RouteNames.testReport,
              arguments: data,
            );
          }
        },
        builder: (
          context,
          state,
        ) {
          return state.instructionAndQuestionsList.isEmpty
              ? const Center(
                  child: Text(
                    AppConst.noTestsFound,
                  ),
                )
              : state.proceedToStartTest
                  ? TestView(
                      state: state,
                    )
                  : InstructionView(
                      state: state,
                    );
        },
      ),
    );
  }
}
