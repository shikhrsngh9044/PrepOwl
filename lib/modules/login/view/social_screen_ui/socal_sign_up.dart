import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../_utils/configs/theme_config.dart';
import '../../../../_utils/constants/asset_constants.dart';
import 'or_divider.dart';

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
            GestureDetector(
              onTap: () {},
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: AppTheme.primaryColorLight,
                  ),
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(
                  Assets.facebookLogin,
                  height: 20,
                  width: 20,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: AppTheme.primaryColorLight,
                  ),
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(
                  Assets.gmailLogin,
                  height: 20,
                  width: 20,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
