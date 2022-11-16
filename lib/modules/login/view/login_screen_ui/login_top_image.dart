import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../_utils/constants/asset_constants.dart';
import '../../../../_utils/res/dimen.dart';

import '../../../../_utils/constants/string_constants.dart';

class LoginScreenTopImage extends StatelessWidget {
  const LoginScreenTopImage({
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
            AppConst.phoneNumberText,
            style: TextStyle(
                fontSize: AppDimen.size20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: defaultPadding),
          const Text(
            AppConst.verfivationCodeText,
            style: TextStyle(fontSize: AppDimen.size18),
          ),
          const SizedBox(height: defaultPadding),
        ],
      ),
    );
  }
}
