import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prepowl/_utils/constants/enums.dart';
import 'package:prepowl/modules/dashboard/controller/dashboard_bloc.dart';

import '../../../../_utils/configs/theme_config.dart';
import '../../../../_utils/constants/string_constants.dart';

class BottomNavigator extends StatelessWidget {
  final DashboardState state;
  const BottomNavigator({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home_rounded),
          label: AppConst.home,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search_rounded),
          label: AppConst.search,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notes_rounded),
          label: AppConst.doubts,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_rounded),
          label: AppConst.profile,
        ),
      ],
      currentIndex: state.bottomIndex,
      onTap: (index) {
        if (index == 0) {
          context
              .read<DashboardBloc>()
              .add(GetBottomIndex(NavbarItem.dashboard));
        } else if (index == 1) {
          context.read<DashboardBloc>().add(GetBottomIndex(NavbarItem.search));
        } else if (index == 2) {
          context.read<DashboardBloc>().add(GetBottomIndex(NavbarItem.doubt));
        } else if (index == 3) {
          context.read<DashboardBloc>().add(GetBottomIndex(NavbarItem.profile));
        }
      },
      selectedItemColor: Colors.amber[800],
      unselectedItemColor: AppTheme.secondaryColor,
      selectedLabelStyle:
          const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      showUnselectedLabels: true,
    );
  }
}
