import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prepowl/_utils/configs/theme_config.dart';
import 'package:prepowl/_utils/constants/string_constants.dart';
import 'package:prepowl/_utils/helpers/global.dart';
import 'package:prepowl/_utils/res/dimen.dart';
import 'package:prepowl/modules/register/controller/profile_bloc.dart';
import 'package:prepowl/modules/register/view/register_details_ui/profile_pic.dart';

import '../../../../_utils/helpers/validation.dart';

class CompleteRegisterForm extends StatefulWidget {
  const CompleteRegisterForm({Key? key, required this.state}) : super(key: key);

  final ProfileState state;

  @override
  CompleteRegisterFormState createState() => CompleteRegisterFormState();
}

class CompleteRegisterFormState extends State<CompleteRegisterForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _fullNameFocus = FocusNode();

  _returnErrorText() {
    bool isValidated = _formKey.currentState?.validate() ?? false;
    if (isValidated) {
      printDebug("object");
    }
  }

  File? imageFile;
  @override
  Widget build(BuildContext context) {
    // _nameController.text = Get.arguments['name'] ?? "";
    // _emailController.text = Get.arguments['email'] ?? "";
    return Form(
      key: _formKey,
      child: Column(
        children: [
          ProfilePic(state: widget.state),
          const SizedBox(height: 20),
          TextFormField(
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
            decoration: nameInputDecoration,
          ),
          const SizedBox(height: 30),
          TextFormField(
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
            ],
            decoration: emailInputDecoration,
          ),
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
              _returnErrorText();
              // Get.offAndToNamed(RouteNames.loginPage);
            },
          )
        ],
      ),
    );
  }
}
