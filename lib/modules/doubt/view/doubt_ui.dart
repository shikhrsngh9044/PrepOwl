import 'package:flutter/material.dart';
import 'package:prepowl/_utils/constants/string_constants.dart';
import 'package:prepowl/modules/doubt/view/tabs/all_doubt_tab.dart';
import 'package:prepowl/modules/doubt/view/tabs/my_doubt_tab.dart';

class DoubtScreen extends StatelessWidget {
  const DoubtScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50.0),
            child: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              bottom: const TabBar(
                unselectedLabelColor: Colors.grey,
                tabs: <Widget>[
                  Tab(
                    child: Text(
                      AppConst.all,
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                  Tab(
                      child: Text(
                    AppConst.myDoubts,
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  )),
                ],
              ),
            ),
          ),
          body: const TabBarView(
            children: <Widget>[AllDoubtScreen(), MyDoubtScreen()],
          ),
        ));
  }
}
