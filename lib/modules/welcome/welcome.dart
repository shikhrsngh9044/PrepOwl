import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../_utils/constants/asset_constants.dart';
import '../../_utils/constants/routes.dart';
import '../../_utils/constants/string_constants.dart';
import '../../_utils/res/dimen.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(Assets.topImage, width: 120),
          ),
          Positioned(
            bottom: 15.h,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  AppConst.appThemeName,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: defaultPadding * 2.0),
                  child: SvgPicture.asset(Assets.chatIconImage),
                ),
                const SizedBox(height: defaultPadding * 3),
                ElevatedButton(
                  child: Text(AppConst.login.toUpperCase()),
                  onPressed: () {
                    Get.offAndToNamed(RouteNames.loginPage);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
