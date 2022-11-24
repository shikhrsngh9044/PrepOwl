import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prepowl/_utils/configs/theme_config.dart';
import 'package:prepowl/_utils/constants/string_constants.dart';
import 'package:prepowl/_utils/res/dimen.dart';

import 'package:prepowl/modules/register/controller/profile_bloc.dart';

class BottomSheetScreen extends StatelessWidget {
  const BottomSheetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc(),
      child: const BottomSheetScreenUI(),
    );
  }
}

class BottomSheetScreenUI extends StatefulWidget {
  const BottomSheetScreenUI({
    Key? key,
  }) : super(key: key);

  @override
  State<BottomSheetScreenUI> createState() => _BottomSheetScreenUIState();
}

class _BottomSheetScreenUIState extends State<BottomSheetScreenUI> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      padding: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 20.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          GestureDetector(
              onTap: () {},
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppDimen.size50, vertical: AppDimen.size15),
                  backgroundColor: AppTheme.primaryColorLight,
                  shape: const StadiumBorder(),
                ),
                child: Text(
                  AppConst.camera.toUpperCase(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: AppDimen.size16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  // Get.offAndToNamed(RouteNames.loginPage);
                },
              )),
          GestureDetector(
              onTap: () {},
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppDimen.size50, vertical: AppDimen.size15),
                  backgroundColor: AppTheme.primaryColorLight,
                  shape: const StadiumBorder(),
                ),
                child: Text(
                  AppConst.gallary.toUpperCase(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: AppDimen.size16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  context.read<ProfileBloc>().add(const UpdateFilePath());
                  Navigator.pop(context);
                },
              )),
        ],
      ),
    );
  }
}
