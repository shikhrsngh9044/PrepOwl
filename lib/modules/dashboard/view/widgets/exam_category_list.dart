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
      itemBuilder: ((context, index) {
        return Padding(
          padding: state.examList.isNotEmpty && index == state.selectedIndex
              ? const EdgeInsets.only(bottom: AppDimen.size14)
              : const EdgeInsets.only(bottom: AppDimen.size5),
          child: Column(
            children: [
              // Header //
              GestureDetector(
                onTap: () {
                  // printDebug("Exam category ${index + 1} clicked");
                  context.read<DashboardBloc>().add(
                      GetAllExamList(state.examCategoryList[index].id, index));
                },
                child: Container(
                    height: state.examList.isNotEmpty &&
                            index == state.selectedIndex
                        ? 50
                        : 100,
                    margin: const EdgeInsets.only(bottom: AppDimen.size10),
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
              if (state.examList.isNotEmpty && index == state.selectedIndex)
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: state.examList.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Text(state.examList[index].title);
                  },
                ),
            ],
          ),
        );
      }),
      itemCount: state.examCategoryList.length,
    );
  }
}
