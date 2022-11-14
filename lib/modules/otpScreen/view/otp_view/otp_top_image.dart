import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../_utils/constants/asset_constants.dart';
import '../../../../_utils/res/dimen.dart';

import '../../../../_utils/configs/theme_config.dart';
import '../../../../_utils/constants/string_constants.dart';

class OTPScreenTopImage extends StatelessWidget {
  const OTPScreenTopImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(3, 25, 6, 8),
      child: Column(
        children: [
          Row(
            children: [
              const Spacer(),
              Expanded(
                flex: 3,
                child: SvgPicture.asset(Assets.signIconImage),
              ),
              const Spacer(),
            ],
          ),
          const Text(
            AppConst.otpScreen,
            style: TextStyle(
                fontSize: AppDimen.size20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: defaultPadding),
          const Text(
            AppConst.codeLine,
            style: TextStyle(fontSize: AppDimen.size18),
          ),
          const SizedBox(height: defaultPadding),
          buildTimer(),
          const SizedBox(height: defaultPadding),
        ],
      ),
    );
  }

  Widget buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("This code will expired in "),
        TweenAnimationBuilder(
          tween: Tween(begin: 90.0, end: 0.0),
          duration: const Duration(seconds: 90),
          builder: (_, dynamic value, child) => Text(
            "00:${value.toInt()}",
            style: const TextStyle(color: AppTheme.primaryColorLight),
          ),
        ),
      ],
    );
  }
}
