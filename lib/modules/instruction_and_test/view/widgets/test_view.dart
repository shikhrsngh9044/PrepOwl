import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../_utils/configs/theme_config.dart';
import '../../../../_utils/res/dimen.dart';
import '../../../../_utils/ui_components/buttons.dart';
import '../../controller/instruction_and_test_bloc.dart';

class TestView extends StatelessWidget {
  TestView({Key? key, required this.state}) : super(key: key);

  final InstructionAndTestState state;

  final PageController _pageViewController = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  color: Colors.white,
                  width: double.infinity,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Question ${state.selectedQuestionIndex + 1}",
                            style: const TextStyle(
                              fontSize: AppDimen.size18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                            "01:00",
                            style: TextStyle(
                              fontSize: AppDimen.size18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: AppDimen.size20,
                      ),
                      const Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                      ),
                      const SizedBox(
                        height: AppDimen.size20,
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemBuilder: (listViewContext, listViewIndex) {
                          return RadioListTile(
                            title: Text(
                              'Option ${listViewIndex + 1}',
                              style: const TextStyle(
                                fontSize: AppDimen.size15,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            dense: true,
                            value: true,
                            onChanged: (bool? value) {},
                            groupValue: false,
                            toggleable: true,
                            activeColor: AppTheme.secondaryColor,
                          );
                        },
                        itemCount: 4,
                      ),
                      const Spacer(),
                      state.selectedQuestionIndex == 9
                          ? PrimaryButton(
                              btnText: "Submit",
                              onPressed: () {},
                              customTextStyle: const TextStyle(
                                fontSize: AppDimen.size20,
                                color: Colors.white,
                              ),
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                state.selectedQuestionIndex != 0
                                    ? CircleAvatar(
                                        backgroundColor:
                                            AppTheme.secondaryColor,
                                        child: IconButton(
                                          color: Colors.white,
                                          onPressed: () {
                                            context
                                                .read<InstructionAndTestBloc>()
                                                .add(
                                                  UpdateSelectedQuestionIndex(
                                                    "backward",
                                                    state.selectedQuestionIndex,
                                                  ),
                                                );
                                          },
                                          icon: const Icon(
                                            Icons.arrow_back_ios_new_rounded,
                                          ),
                                        ),
                                      )
                                    : const Text(""),
                                CircleAvatar(
                                  backgroundColor: AppTheme.secondaryColor,
                                  child: IconButton(
                                    color: Colors.white,
                                    onPressed: () {
                                      context
                                          .read<InstructionAndTestBloc>()
                                          .add(
                                            UpdateSelectedQuestionIndex(
                                              "forward",
                                              state.selectedQuestionIndex,
                                            ),
                                          );
                                    },
                                    icon: const Icon(
                                      Icons.arrow_forward_ios_rounded,
                                    ),
                                  ),
                                ),
                              ],
                            )
                    ],
                  ),
                );
              },
              controller: _pageViewController,
              onPageChanged: (int index) {},
              itemCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
