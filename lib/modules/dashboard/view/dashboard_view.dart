import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prepowl/_utils/constants/enums.dart';
import 'package:prepowl/modules/dashboard/view/widgets/exam_list.dart';
import 'package:prepowl/modules/doubt/view/doubt_ui.dart';
import 'package:prepowl/modules/profile/view/profile_ui.dart';
import 'package:prepowl/modules/search/view/search_ui.dart';

import '../../../_utils/configs/theme_config.dart';
import '../../../_utils/constants/string_constants.dart';
import '../controller/dashboard_bloc.dart';
import 'widgets/bottom_navigator.dart';
import 'widgets/drawer_page.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboardBloc()
        ..add(GetSelectedExamCategory())
        ..add(GetAllExamList(0))
        ..add(GetBottomIndex(NavbarItem.dashboard)),
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
          if (state.navbarItem == NavbarItem.dashboard) {
            return ExamListUI(
              state: state,
            );
          } else if (state.navbarItem == NavbarItem.search) {
            return const SearchScreen();
          } else if (state.navbarItem == NavbarItem.doubt) {
            return const DoubtScreen();
          } else {
            return const ProfileScreen();
          }
        },
      ),
      drawer: const DrawerPage(),
      bottomNavigationBar: BlocBuilder<DashboardBloc, DashboardState>(
        builder: (context, state) {
          return BottomNavigator(state: state);
        },
      ),
    );
  }
}
