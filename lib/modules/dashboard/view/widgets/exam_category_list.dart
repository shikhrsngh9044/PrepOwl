import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../controller/dashboard_bloc.dart';

import '../../../../_utils/res/dimen.dart';

class ExamCategoryList extends StatelessWidget {
  const ExamCategoryList({Key? key, required this.state}) : super(key: key);

  final DashboardState state;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: ((context, index) {
        return Column(
          children: [
            // Header //
            GestureDetector(
              onTap: () {
                context
                    .read<DashboardBloc>()
                    .add(GetExamList(state.examCategoryList[index].id, index));
              },
              child: Container(
                  margin: const EdgeInsets.only(right: AppDimen.size15),
                  padding: const EdgeInsets.all(AppDimen.size15),
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        AppDimen.size10,
                      ),
                    ),
                  ),
                  child: Text(
                    state.examCategoryList[index].title,
                  )),
            ),
          ],
        );
      }),
      itemCount: state.examCategoryList.length,
    );
  }
}


// if (state.examList.isNotEmpty && index == state.selectedIndex)
//               ListView.builder(
//                 scrollDirection: Axis.vertical,
//                 shrinkWrap: true,
//                 itemCount: state.examList.length,
//                 physics: const NeverScrollableScrollPhysics(),
//                 itemBuilder: (context, index) {
//                   return Text(state.examList[index].title);
//                 },
//               ),