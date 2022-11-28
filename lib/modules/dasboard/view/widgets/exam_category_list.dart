import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../_utils/res/dimen.dart';
import '../../controller/dashboard_bloc.dart';

class ExamCategoryList extends StatelessWidget {
  const ExamCategoryList({
    Key? key,
    required this.state,
  }) : super(key: key);

  final DashboardState state;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: ((context, index) {
        return Padding(
          padding: state.examList.isNotEmpty && index == 0
              ? const EdgeInsets.only(bottom: AppDimen.size14)
              : const EdgeInsets.only(bottom: AppDimen.size5),
          child: Column(
            children: [
              // Header //
              GestureDetector(
                onTap: () {
                  context
                      .read<DashboardBloc>()
                      .add(GetAllExamList(state.examCategoryList[index].id));
                },
                child: Container(
                  height: state.examList.isNotEmpty && index == 0 ? 50 : 100,
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
                    state.examList[index].title,
                  ),
                ),
              ),
              if (state.examList.isNotEmpty && index == 0)
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.examList.length,
                  itemBuilder: (context, index) {
                    return Text(state.examCategoryList[index].title);
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
