import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prepowl/_utils/constants/string_constants.dart';

import '../../../../_utils/configs/theme_config.dart';
import '../../../onboarding/controller/onboarding_bloc.dart';

class AddMyDoubt extends StatefulWidget {
  const AddMyDoubt({Key? key}) : super(key: key);

  @override
  State<AddMyDoubt> createState() => _AddMyDoubtState();
}

class _AddMyDoubtState extends State<AddMyDoubt> {
  List<String> items = ["Item 1", "Item 2", "Item 3", "Item 4"];
  String? selectedItem = "Item 1";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Ask a Question",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: AppTheme.secondaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 0.0),
                    ),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 0.0),
                    ),
                    hintStyle: TextStyle(color: Colors.grey[800]),
                    hintText: "Name",
                    fillColor: Colors.white),
                value: selectedItem,
                onChanged: (String? value) {
                  setState(() {
                    selectedItem = value;
                  });
                },
                items: items
                    .map(
                      (item) => DropdownMenuItem(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(fontSize: 24),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),

            // child: TextField(
            //   decoration: InputDecoration(
            //     border: OutlineInputBorder(),
            //     labelText: AppConst.title,
            //     hintText: ' Write a Title',
            //   ),
            // ),

            const Padding(
              padding: EdgeInsets.all(15),
              child: TextField(
                maxLines: 10,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: AppConst.description,
                  hintText: 'Write a Description',
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Icon(
                  Icons.camera_alt,
                  size: 50,
                ),
                Text(
                  "Upload Question",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 150,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text(
                  "Post",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
