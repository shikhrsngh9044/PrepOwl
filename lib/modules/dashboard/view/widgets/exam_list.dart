import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prepowl/modules/dashboard/controller/dashboard_bloc.dart';

import '../../../../_utils/configs/theme_config.dart';
import '../../../../_utils/res/dimen.dart';

class ExamListUI extends StatelessWidget {
  final DashboardState state;
  const ExamListUI({super.key, required this.state});
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppDimen.size10),
          child: SizedBox(
            height: AppDimen.size70,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.examCategoryList.length,
              itemBuilder: (listViewContext, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: AppDimen.size10),
                  child: ChoiceChip(
                    label: Text(
                      state.examCategoryList[index].title,
                    ),
                    selected: index == state.selectedIndex,
                    selectedColor: AppTheme.secondaryColor,
                    labelStyle: TextStyle(
                      color: index == state.selectedIndex
                          ? Colors.white
                          : Colors.black,
                    ),
                    onSelected: (value) {
                      if (index == 0) {
                        context
                            .read<DashboardBloc>()
                            .add(GetAllExamList(index));
                      } else {
                        context.read<DashboardBloc>().add(GetExamList(
                            state.examCategoryList[index].id, index));
                      }
                    },
                  ),
                );
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppDimen.size15),
          child: SizedBox(
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: const EdgeInsets.all(AppDimen.size5),
                    padding: const EdgeInsets.all(AppDimen.size15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(
                            AppDimen.size10,
                          ),
                        ),
                        border: Border.all(color: Colors.black)),
                    child: Text(state.examList[index].title),
                  ),
                );
              },
              itemCount: state.examList.length,
            ),
          ),
        ),
      ],
    );
  }
}
