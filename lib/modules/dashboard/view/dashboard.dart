import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('${Get.arguments['name']}'),
          Text('${Get.arguments['email']}'),
          Text('${Get.arguments['uid']}'),
        ],
      ),
    );
  }
}
