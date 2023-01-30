// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../configs/theme_config.dart';
import '../constants/string_constants.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentSelected;
  final ValueChanged<int> onChange;

  const CustomBottomNavigationBar({
    Key? key,
    required this.currentSelected,
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (index) {
        onChange(index);
      },
      elevation: 15,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      currentIndex: currentSelected,
      unselectedItemColor: AppTheme.secondaryColor,
      selectedItemColor: AppTheme.primaryColor,
      selectedLabelStyle: Theme.of(context)
          .textTheme
          .bodyLarge!
          .copyWith(fontWeight: FontWeight.w600, fontSize: 14)
          .quickSand(),
      unselectedLabelStyle: Theme.of(context)
          .textTheme
          .bodyLarge!
          .copyWith(fontWeight: FontWeight.w600, fontSize: 12)
          .quickSand(),
      items: const [
        BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.only(bottom: 4.0),
            child: Icon(
              Icons.public,
              size: 23,
            ),
          ),
          label: LabelConstants.home,
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.only(bottom: 4.0),
            child: Icon(
              Icons.hiking,
              size: 23,
            ),
          ),
          label: LabelConstants.trips,
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.only(bottom: 4.0),
            child: Icon(
              Icons.mood,
              size: 23,
            ),
          ),
          label: LabelConstants.profile,
        ),
      ],
    );
  }
}
