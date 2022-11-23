import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../_utils/constants/asset_constants.dart';
import '../../../../_utils/constants/string_constants.dart';
import '../../../../_utils/res/dimen.dart';

// ignore: must_be_immutable
class OTPScreenTopImage extends StatelessWidget {
  const OTPScreenTopImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
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
            "We sent your code to ",
            style: TextStyle(
                fontSize: AppDimen.size20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: defaultPadding),
          const Text(
            AppConst.codeLine,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: AppDimen.size18),
          ),
        ],
      ),
    );
  }
}
