import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../_utils/configs/theme_config.dart';
import '../../../../_utils/constants/string_constants.dart';
import '../../../../_utils/res/dimen.dart';
import '../../../../_utils/ui_components/buttons.dart';
import '../../controller/instruction_and_test_bloc.dart';

class InstructionView extends StatelessWidget {
  const InstructionView({Key? key, required this.state}) : super(key: key);

  final InstructionAndTestState state;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
          style: TextStyle(
            fontSize: AppDimen.size15,
          ),
        ),
        Row(
          children: [
            Checkbox(
              activeColor: AppTheme.secondaryColor,
              value: state.readInstructions,
              onChanged: (value) {
                context
                    .read<InstructionAndTestBloc>()
                    .add(const ReadInstructions());
              },
            ),
            const Expanded(
              child: Text(
                AppConst.readAboveInstructions,
                style: TextStyle(
                  fontSize: AppDimen.size15,
                ),
              ),
            )
          ],
        ),
        const Spacer(),
        PrimaryButton(
          isDisabled: !state.readInstructions,
          onPressed: () {
            context.read<InstructionAndTestBloc>().add(const StartTest());
          },
          btnText: AppConst.proceed,
          buttonColor:
              state.readInstructions ? AppTheme.secondaryColor : Colors.white,
          customTextStyle: TextStyle(
            fontSize: AppDimen.size20,
            color:
                state.readInstructions ? Colors.white : AppTheme.secondaryColor,
          ),
        ),
      ],
    );
  }
}
