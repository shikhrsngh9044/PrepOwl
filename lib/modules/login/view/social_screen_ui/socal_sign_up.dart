import 'package:flutter/material.dart';
import '../../../../_utils/constants/asset_constants.dart';
import 'or_divider.dart';
import 'social_icon.dart';

class SocalLogin extends StatelessWidget {
  const SocalLogin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const OrDivider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SocalIcon(
              iconSrc: Assets.facebookLogin,
              press: () {},
            ),
            SocalIcon(
              iconSrc: Assets.gmailLogin,
              press: () {},
            ),
          ],
        ),
      ],
    );
  }
}
