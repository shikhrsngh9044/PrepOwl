import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:prepowl/_utils/configs/theme_config.dart';
import 'package:prepowl/_utils/constants/asset_constants.dart';
import 'package:prepowl/_utils/constants/string_constants.dart';
import 'package:prepowl/_utils/res/dimen.dart';

import '../../../../_utils/helpers/validation.dart';

class CompleteProfileForm extends StatefulWidget {
  const CompleteProfileForm({super.key});

  @override
  CompleteProfileFormState createState() => CompleteProfileFormState();
}

class CompleteProfileFormState extends State<CompleteProfileForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _fullNameFocus = FocusNode();
  File? imageFile;
  @override
  Widget build(BuildContext context) {
    // _nameController.text = Get.arguments['name'] ?? "";
    // _emailController.text = Get.arguments['email'] ?? "";
    return Form(
      key: _formKey,
      child: Column(
        children: [
          profileImage(),
          const SizedBox(height: 20),
          _nameTextForm(),
          const SizedBox(height: 30),
          _emailTextForm(),
          const SizedBox(height: 40),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppDimen.size100, vertical: AppDimen.size15),
              backgroundColor: AppTheme.primaryColorLight,
              shape: const StadiumBorder(),
            ),
            child: Text(
              AppConst.continuePage.toUpperCase(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: AppDimen.size16,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () {
              // Get.offAndToNamed(RouteNames.loginPage);
            },
          )
        ],
      ),
    );
  }

  Widget profileImage() {
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          imageFile == null
              ? const CircleAvatar(
                  backgroundImage: AssetImage(Assets.customprofileicon))
              : CircleAvatar(
                  backgroundImage: FileImage(
                    imageFile!,
                  ),
                ),
          Positioned(
            right: -16,
            bottom: 0,
            child: SizedBox(
              height: 50,
              width: 50,
              child: CircleAvatar(
                backgroundColor: Colors.white.withOpacity(0.5),
                child: IconButton(
                    onPressed: () {
                      _openBottomSheet();
                    },
                    iconSize: 30,
                    icon: const Icon(Icons.camera_alt_rounded)),
              ),
            ),
          )
        ],
      ),
    );
  }

  _openBottomSheet() {
    return showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return Container(
              height: 250,
              padding: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 20.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  GestureDetector(
                      onTap: () {},
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: AppDimen.size100,
                              vertical: AppDimen.size15),
                          backgroundColor: AppTheme.primaryColorLight,
                          shape: const StadiumBorder(),
                        ),
                        child: Text(
                          AppConst.camera.toUpperCase(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: AppDimen.size16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {
                          // Get.offAndToNamed(RouteNames.loginPage);
                        },
                      )),
                  const SizedBox(height: 15.0),
                  GestureDetector(
                      onTap: () {},
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: AppDimen.size100,
                              vertical: AppDimen.size15),
                          backgroundColor: AppTheme.primaryColorLight,
                          shape: const StadiumBorder(),
                        ),
                        child: Text(
                          AppConst.gallary.toUpperCase(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: AppDimen.size16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {
                          _getFromGallery();
                          Navigator.pop(context);
                        },
                      )),
                  const SizedBox(height: 15.0),
                  GestureDetector(
                      onTap: () {},
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: AppDimen.size100,
                              vertical: AppDimen.size15),
                          backgroundColor: AppTheme.primaryColorLight,
                          shape: const StadiumBorder(),
                        ),
                        child: Text(
                          AppConst.cancel.toUpperCase(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: AppDimen.size16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {
                          // Get.offAndToNamed(RouteNames.loginPage);
                        },
                      )),
                ],
              ));
        });
  }

  _getFromGallery() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  Widget _nameTextForm() {
    return TextFormField(
      cursorColor: AppTheme.primaryColorLight,
      keyboardType: TextInputType.text,
      autofocus: false,
      controller: _nameController,
      focusNode: _fullNameFocus,
      textInputAction: TextInputAction.next,
      validator: (value) {
        return Validation.nameValidation(value);
      },
      inputFormatters: [
        LengthLimitingTextInputFormatter(70),
        FilteringTextInputFormatter.allow(
          RegExp(r'[A-Za-z ]'),
        )
      ],
      decoration: InputDecoration(
        hintText: AppConst.nameHint,
        contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 30.0),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(
            color: AppTheme.primaryColorLight,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(
            color: AppTheme.primaryColorLight,
            width: 2.0,
          ),
        ),
      ),
    );
  }

  Widget _emailTextForm() {
    return TextFormField(
      cursorColor: AppTheme.primaryColorLight,
      keyboardType: TextInputType.emailAddress,
      autofocus: true,
      controller: _emailController,
      focusNode: _emailFocus,
      textInputAction: TextInputAction.next,
      validator: (value) {
        return Validation.emailValidation(value);
      },
      inputFormatters: [
        LengthLimitingTextInputFormatter(50),
        FilteringTextInputFormatter.allow(
          RegExp(r'[A-Za-z0-9@._]'),
        )
      ],
      decoration: InputDecoration(
        hintText: AppConst.emailhint,
        contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 30.0),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(
            color: AppTheme.primaryColorLight,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(
            color: AppTheme.primaryColorLight,
            width: 2.0,
          ),
        ),
      ),
    );
  }
}
