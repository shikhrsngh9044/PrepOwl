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
  TestView({
    Key? key,
    required this.state,
  }) : super(
          key: key,
        );

  final InstructionAndTestState state;

  final PageController _pageViewController = PageController(
    initialPage: 0,
  );
  final ScrollController _controller = ScrollController();

  void _navigateToQuestions(
    BuildContext context,
    DIRECTION direction,
  ) {
    context.read<InstructionAndTestBloc>().add(
          UpdateSelectedQuestionIndex(
            direction,
            state.selectedQuestionIndex,
          ),
        );
    _scrollToTopOnNavigating();
  }

  void _scrollToTopOnNavigating() {
    _controller.animateTo(
      _controller.position.minScrollExtent,
      duration: const Duration(
        microseconds: 1,
      ),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    final questionList = state.instructionAndQuestionsList[0].questions;

    return SafeArea(
      child: PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (
          context,
          index,
        ) {
          return Stack(
            children: [
              ListView(
                controller: _controller,
                children: [
                  Text(
                    "Question ${state.selectedQuestionIndex + 1}",
                    style: const TextStyle(
                      fontSize: AppDimen.size18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: AppDimen.size20,
                  ),
                  Text(questionList[state.selectedQuestionIndex].question),
                  if (questionList[state.selectedQuestionIndex]
                      .images!
                      .isNotEmpty)
                    SizedBox(
                      height: questionList[state.selectedQuestionIndex]
                                  .images!
                                  .length <=
                              2
                          ? AppDimen.size150
                          : AppDimen.size350,
                      child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Image.network(
                            questionList[state.selectedQuestionIndex]
                                .images![index],
                            height: AppDimen.size25,
                            width: AppDimen.size25,
                          );
                        },
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 1.0,
                          mainAxisSpacing: 1.0,
                        ),
                        itemCount: questionList[state.selectedQuestionIndex]
                            .images
                            ?.length,
                      ),
                    ),
                  const SizedBox(
                    height: AppDimen.size20,
                  ),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (
                        listViewContext,
                        listViewIndex,
                      ) {
                        return RadioListTile(
                          title: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              if (questionList[state.selectedQuestionIndex]
                                  .options[listViewIndex]
                                  .optionTitle!
                                  .isNotEmpty)
                                Expanded(
                                  child: Text(
                                    questionList[state.selectedQuestionIndex]
                                            .options[listViewIndex]
                                            .optionTitle ??
                                        "",
                                    style: const TextStyle(
                                      fontSize: AppDimen.size15,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              if (questionList[state.selectedQuestionIndex]
                                  .options[listViewIndex]
                                  .optionImage!
                                  .isNotEmpty)
                                Image.network(
                                  questionList[state.selectedQuestionIndex]
                                          .options[listViewIndex]
                                          .optionImage ??
                                      "",
                                  height: AppDimen.size50,
                                  width: AppDimen.size50,
                                ),
                            ],
                          ),
                          dense: true,
                          value: true,
                          onChanged: (
                            bool? value,
                          ) {
                            context.read<InstructionAndTestBloc>().add(
                                  UpdateAnsweredOption(
                                    questionList[state.selectedQuestionIndex]
                                        .id,
                                    questionList[state.selectedQuestionIndex]
                                        .options[listViewIndex]
                                        .id,
                                  ),
                                );
                          },
                          groupValue: questionList[state.selectedQuestionIndex]
                                  .options[listViewIndex]
                                  .id ==
                              questionList[state.selectedQuestionIndex]
                                  .selectedOptionID,
                          toggleable: true,
                          activeColor: AppTheme.secondaryColor,
                        );
                      },
                      itemCount: questionList[state.selectedQuestionIndex]
                          .options
                          .length,
                    ),
                  ),
                  const SizedBox(
                    height: AppDimen.size50,
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Opacity(
                      opacity: state.selectedQuestionIndex != 0 ? 1 : 0.0,
                      child: CircleAvatar(
                        backgroundColor: AppTheme.secondaryColor,
                        child: IconButton(
                          color: Colors.white,
                          onPressed: () {
                            if (state.selectedQuestionIndex != 0) {
                              _navigateToQuestions(
                                context,
                                DIRECTION.backward,
                              );
                            }
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios_new_rounded,
                          ),
                        ),
                      ),
                    ),
                    Opacity(
                      opacity:
                          state.selectedQuestionIndex == questionList.length - 1
                              ? 1
                              : 0,
                      child: PrimaryButton(
                        size: SIZES.extraSmall,
                        btnText: AppConst.submit,
                        onPressed: () {
                          if (state.selectedQuestionIndex ==
                              questionList.length - 1) {
                            Get.offAndToNamed(
                              RouteNames.testReport,
                            );
                          }
                        },
                        customTextStyle: const TextStyle(
                          fontSize: AppDimen.size20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Opacity(
                      opacity:
                          state.selectedQuestionIndex != questionList.length - 1
                              ? 1
                              : 0,
                      child: CircleAvatar(
                        backgroundColor: AppTheme.secondaryColor,
                        child: IconButton(
                          color: Colors.white,
                          onPressed: () {
                            if (state.selectedQuestionIndex !=
                                questionList.length - 1) {
                              _navigateToQuestions(
                                context,
                                DIRECTION.forward,
                              );
                            }
                          },
                          icon: const Icon(
                            Icons.arrow_forward_ios_rounded,
                          ),
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
        itemCount: questionList.length,
      ),
    );
  }
}
