import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../_utils/constants/asset_constants.dart';
import '../../../../_utils/constants/string_constants.dart';
import '../../../../_utils/res/dimen.dart';

class WelcomeTextImage extends StatelessWidget {
  const WelcomeTextImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          AppConst.appThemeName,
          style:
              TextStyle(fontWeight: FontWeight.bold, fontSize: AppDimen.size24),
        ),
        const SizedBox(height: defaultPadding * 2),
        Row(
          children: [
            const Spacer(),
            Expanded(
              flex: 8,
              child: SvgPicture.asset(Assets.chatIconImage),
            ),
            const Spacer(),
          ],
        ),
        const SizedBox(height: defaultPadding * 2),
      ],
    );
  }
}
