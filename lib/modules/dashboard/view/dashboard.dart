import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Dashboard extends StatelessWidget {
  Dashboard({Key? key, this.name, this.email, this.uid}) : super(key: key);

  String? name, email, uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(name ?? ''),
          Text(email ?? ''),
          Text(uid ?? ''),
        ],
      ),
    );
  }
}
