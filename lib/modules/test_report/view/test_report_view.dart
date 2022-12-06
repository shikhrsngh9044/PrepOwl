import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../../../_utils/constants/string_constants.dart';
import '../../../_utils/configs/theme_config.dart';
import '../../../_utils/res/dimen.dart';

class TestReport extends StatelessWidget {
  const TestReport({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(AppDimen.size10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.close_rounded,
                ),
              ),
            ),
            Column(
              children: [
                const Text(
                  AppConst.congratulations,
                  style: TextStyle(
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
                  percent: 0.7,
                  center: const Text(
                    "70.0%",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: AppDimen.size40,
                    ),
                  ),
                  footer: Column(
                    children: [
                      const SizedBox(
                        height: AppDimen.size20,
                      ),
                      const Text(
                        AppConst.yourScore,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: AppDimen.size25,
                        ),
                      ),
                      const SizedBox(
                        height: AppDimen.size20,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const Text(
                          AppConst.viewAllAnswers,
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontStyle: FontStyle.italic,
                            fontSize: AppDimen.size14,
                          ),
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
      ),
    );
  }
}
