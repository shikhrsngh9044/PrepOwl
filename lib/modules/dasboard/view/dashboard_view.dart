import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prepowl/_utils/constants/string_constants.dart';
import 'package:prepowl/modules/dasboard/view/widgets/drawer_page.dart';
import 'widgets/exam_category_list.dart';
import 'widgets/bottom_navigator.dart';
import '../../../_utils/res/dimen.dart';
import '../controller/dashboard_bloc.dart';

import '../../../_utils/configs/theme_config.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboardBloc()..add(GetSelectedExamCategory()),
      child: const DashboardUI(),
    );
  }
}

class DashboardUI extends StatelessWidget {
  const DashboardUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AppConst.appName,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: AppTheme.secondaryColor,
      ),
      body: BlocBuilder<DashboardBloc, DashboardState>(
        builder: (context, state) {
          return SizedBox(
            child: Padding(
              padding: const EdgeInsets.all(AppDimen.size20),
              child: ListView(
                children: [
                  const Text(
                    'Hi User, Welcome to PrepOwlFork',
                    style: TextStyle(
                      fontSize: AppDimen.size22,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Divider(
                    thickness: 0,
                    height: 20,
                  ),
                  const Text(
                    AppConst.getStarted,
                    style: TextStyle(
                      fontSize: AppDimen.size16,
                    ),
                  ),
                  const SizedBox(
                    height: AppDimen.size15,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height - 200,
                    child: ExamCategoryList(state: state),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      drawer: const DrawerPage(),
      bottomNavigationBar: const BottomNavigator(),
    );
  }
}
