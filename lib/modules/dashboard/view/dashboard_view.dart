import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../_utils/configs/theme_config.dart';
import '../../../_utils/constants/routes.dart';
import '../../../_utils/constants/string_constants.dart';
import '../../../_utils/res/dimen.dart';
import '../controller/dashboard_bloc.dart';
import 'widgets/bottom_navigator.dart';
import 'widgets/drawer_page.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  Widget build(
    BuildContext context,
  ) {
    return BlocProvider(
      create: (
        context,
      ) =>
          DashboardBloc()
            ..add(
              GetSelectedExamCategory(),
            )
            ..add(
              GetAllTestList(0),
            ),
      child: const DashboardUI(),
    );
  }
}

class DashboardUI extends StatelessWidget {
  const DashboardUI({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AppConst.appName,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: AppTheme.secondaryColor,
      ),
      body: BlocBuilder<DashboardBloc, DashboardState>(
        builder: (
          context,
          state,
        ) {
          return ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimen.size10,
                ),
                child: SizedBox(
                  height: AppDimen.size70,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.examCategoryList.length,
                    itemBuilder: (
                      listViewContext,
                      index,
                    ) {
                      return Padding(
                        padding: const EdgeInsets.only(
                          right: AppDimen.size10,
                        ),
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
                          onSelected: (
                            value,
                          ) {
                            if (index == 0) {
                              context.read<DashboardBloc>().add(
                                    GetAllTestList(
                                      index,
                                    ),
                                  );
                            } else {
                              context.read<DashboardBloc>().add(
                                    GetTestList(
                                      state.examCategoryList[index].id,
                                      index,
                                    ),
                                  );
                            }
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimen.size15,
                ),
                child: state.testList.isEmpty
                    ? const Center(
                        child: Text(
                          AppConst.noTestsFound,
                        ),
                      )
                    : ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (
                          context,
                          index,
                        ) {
                          return GestureDetector(
                            onTap: () {
                              Get.toNamed(RouteNames.instructionAndTest,
                                  arguments: state.testList[index].id);
                            },
                            child: Container(
                              margin: const EdgeInsets.all(
                                AppDimen.size5,
                              ),
                              padding: const EdgeInsets.all(
                                AppDimen.size15,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(
                                    AppDimen.size10,
                                  ),
                                ),
                                border: Border.all(
                                  color: Colors.black,
                                ),
                              ),
                              child: Text(
                                state.testList[index].testName,
                              ),
                            ),
                          );
                        },
                        itemCount: state.testList.length,
                      ),
              ),
            ],
          );
        },
      ),
      drawer: const DrawerPage(),
      bottomNavigationBar: const BottomNavigator(),
    );
  }
}
