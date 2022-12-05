import 'package:flutter/material.dart';

import '../../../../_utils/configs/theme_config.dart';
import '../../../../_utils/constants/string_constants.dart';

class BottomNavigator extends StatelessWidget {
  const BottomNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home_rounded),
          label: LabelConstants.home,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search_rounded),
          label: LabelConstants.search,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notes_rounded),
          label: LabelConstants.doubts,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_rounded),
          label: LabelConstants.profile,
        ),
      ],
      currentIndex: 0,
      selectedItemColor: Colors.amber[800],
      unselectedItemColor: AppTheme.secondaryColor,
      selectedLabelStyle:
          const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      showUnselectedLabels: true,
    );
  }
}
