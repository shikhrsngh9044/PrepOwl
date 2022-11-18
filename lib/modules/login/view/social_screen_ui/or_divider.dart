import 'package:flutter/material.dart';

import '../../../../_utils/configs/theme_config.dart';
import '../../../../_utils/res/dimen.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
      width: size.width * 0.8,
      child: Row(
        children: <Widget>[
          buildDivider(),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: AppDimen.size10),
            child: Text(
              "OR",
              style: TextStyle(
                color: AppTheme.primaryColorLight,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          buildDivider(),
        ],
      ),
    );
  }

  Expanded buildDivider() {
    return const Expanded(
      child: Divider(
        color: AppTheme.primaryColorLight,
        height: 1.5,
      ),
    );
  }
}
