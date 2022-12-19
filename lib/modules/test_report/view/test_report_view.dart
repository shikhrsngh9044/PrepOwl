import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../_utils/configs/theme_config.dart';
import '../../../_utils/constants/string_constants.dart';
import '../../../_utils/res/dimen.dart';
import '../controller/test_report_bloc.dart';

class TestReport extends StatelessWidget {
  const TestReport({
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
          TestReportBloc()
            ..add(GetTestReport(
              Get.arguments['answerCount'],
              Get.arguments['questionsLength'],
            )),
      child: const TestReportUI(),
    );
  }
}

class TestReportUI extends StatelessWidget {
  const TestReportUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TestReportBloc, TestReportState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(AppDimen.size10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.close_rounded,
                    ),
                  ),
                ),
                Column(
                  children: [
                    Text(
                      state.percentage >= 60
                          ? AppConst.congratulations
                          : AppConst.betterLuckNextTime,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: AppDimen.size40,
                        fontStyle: FontStyle.italic,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: AppDimen.size25,
                    ),
                    CircularPercentIndicator(
                      radius: AppDimen.size120,
                      lineWidth: AppDimen.size20,
                      animation: true,
                      percent: state.percentage / 100,
                      center: Text(
                        "${state.percentage.toStringAsFixed(0)}%",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: AppDimen.size40,
                        ),
                      ),
                      footer: Column(
                        children: const [
                          SizedBox(
                            height: AppDimen.size20,
                          ),
                          Text(
                            AppConst.yourScore,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: AppDimen.size25,
                            ),
                          ),
                        ],
                      ),
                      circularStrokeCap: CircularStrokeCap.round,
                      progressColor: AppTheme.secondaryColor,
                    ),
                  ],
                ),
                const Text(""),
              ],
            ),
          );
        },
      ),
    );
  }
}
