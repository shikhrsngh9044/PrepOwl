import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prepowl/_utils/constants/string_constants.dart';

import '../../../../_utils/configs/theme_config.dart';
import '../../controller/doubt_bloc.dart';
import '../../controller/doubt_event.dart';
import '../../controller/doubt_state.dart';

class AddMyDoubt extends StatelessWidget {
  const AddMyDoubt({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DoubtBloc()..add(DropDownExamCategory()),
      child: AddMyDoubtUI(),
    );
  }
}

class AddMyDoubtUI extends StatelessWidget {
  // final List<String> items;

  String? selectedItem = "Item 1";

  AddMyDoubtUI({super.key});
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
      body: BlocBuilder<DoubtBloc, DoubtState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              children: <Widget>[
                if (state.isLoading)
                  CircularProgressIndicator()
                else
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
                          enabledBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 0.0),
                          ),
                          border: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 0.0),
                          ),
                          hintStyle: TextStyle(color: Colors.grey[800]),
                          hintText: "Name",
                          fillColor: Colors.white),
                      value: selectedItem,
                      onChanged: (String? value) {
                        selectedItem = value;
                        context.read<DoubtBloc>().add(DropDownExamCategory());
                      },
                      items: List<DropdownMenuItem<String>>.generate(
                        state.examCategoryList.length,
                        (index) => DropdownMenuItem(
                          value: state.examCategoryList[index].title,
                          child: Text(
                            state.examCategoryList[index].title,
                            style: const TextStyle(fontSize: 24),
                          ),
                        ),
                      ).toList(),
                    ),
                  ),
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
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
          );
        },
      ),
    );
  }
}
