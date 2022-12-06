import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../_utils/configs/theme_config.dart';
import '../../../../_utils/constants/enums.dart';
import '../../../../_utils/constants/routes.dart';
import '../../../../_utils/constants/string_constants.dart';
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
      child: PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Stack(
            children: [
              ListView(
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
                  Image.network(
                      "https://iim-cat-questions-answers.2iim.com/quant/arithmetic/set-theory/figa/set-13.PNG"),
                  const SizedBox(
                    height: AppDimen.size20,
                  ),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (listViewContext, listViewIndex) {
                        return RadioListTile(
                          title: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Option ${listViewIndex + 1}',
                                style: const TextStyle(
                                  fontSize: AppDimen.size15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              // Image.network(
                              //   "https://iim-cat-questions-answers.2iim.com/quant/arithmetic/set-theory/figa/set-13.PNG",
                              //   scale: 2,
                              // ),
                            ],
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
                  ),
                  const SizedBox(
                    height: AppDimen.size40,
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: state.selectedQuestionIndex == 9
                    ? PrimaryButton(
                        btnText: AppConst.submit,
                        onPressed: () {
                          Get.offAndToNamed(
                            RouteNames.testReport,
                          );
                        },
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
                                  backgroundColor: AppTheme.secondaryColor,
                                  child: IconButton(
                                    color: Colors.white,
                                    onPressed: () {
                                      context
                                          .read<InstructionAndTestBloc>()
                                          .add(
                                            UpdateSelectedQuestionIndex(
                                              DIRECTION.backward,
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
                                context.read<InstructionAndTestBloc>().add(
                                      UpdateSelectedQuestionIndex(
                                        DIRECTION.forward,
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
                      ),
              )
            ],
          );
        },
        controller: _pageViewController,
        onPageChanged: (int index) {},
        itemCount: 10,
      ),
    );
  }
}
