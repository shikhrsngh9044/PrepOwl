import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../../../_utils/configs/theme_config.dart';
import '../../../../_utils/constants/string_constants.dart';
import '../../../../_utils/helpers/global.dart';
import '../../../../_utils/res/dimen.dart';
import '../../controller/profile_bloc.dart';
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
  Map<String, dynamic>? arguments = {};

  _returnErrorText() {
    bool isValidated = _formKey.currentState?.validate() ?? false;
    if (isValidated) {
      context.read<ProfileBloc>().add(SubmitData(
            Get.arguments['uid'],
            _nameController.text,
            _emailController.text,
            widget.state.filepath.path,
          ));
    }
  }

  @override
  void initState() {
    if (mounted && (arguments == null || arguments!.isEmpty)) {
      arguments = Get.arguments;
      _nameController.text = arguments?['name'] ?? "";
      _emailController.text = arguments?['email'] ?? "";
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
          const SizedBox(height: AppDimen.size30),
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
          const SizedBox(height: AppDimen.size30),
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
            },
          )
        ],
      ),
    );
  }
}
