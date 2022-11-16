import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prepowl/modules/home/view/home_page.dart';
import 'package:prepowl/modules/login/controller/login_bloc.dart';

import '../../../../_utils/configs/theme_config.dart';
import '../../../../_utils/constants/string_constants.dart';
import '../../../../_utils/res/dimen.dart';

class OtpForm extends StatefulWidget {
  const OtpForm({
    Key? key,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _OtpFormState createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  FocusNode? pin2FocusNode;
  FocusNode? pin3FocusNode;
  FocusNode? pin4FocusNode;
  FocusNode? pin5FocusNode;
  FocusNode? pin6FocusNode;

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _codeController = TextEditingController();
  @override
  void initState() {
    super.initState();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
    pin5FocusNode = FocusNode();
    pin6FocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    pin2FocusNode!.dispose();
    pin3FocusNode!.dispose();
    pin4FocusNode!.dispose();
    pin5FocusNode!.dispose();
    pin6FocusNode!.dispose();
  }

  void nextField(String value, FocusNode? focusNode) {
    if (value.length == 1) {
      focusNode!.requestFocus();
    }
  }

  void _verifyOtp(BuildContext context, String verificationId) {
    context.read<PhoneAuthBloc>().add(VerifySentOtpEvent(
        otpCode: _codeController.text, verificationId: verificationId));
    // codeController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhoneAuthBloc, PhoneAuthState>(
        builder: (context, state) {
      return Column(
        children: [
          Form(
            key: _formKey,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  height: AppDimen.size50,
                  width: AppDimen.size50,
                  child: TextFormField(
                    cursorColor: AppTheme.primaryColorLight,
                    obscureText: true,
                    style: const TextStyle(fontSize: AppDimen.size24),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: otpInputDecoration,
                    onChanged: (value) => nextField(value, pin2FocusNode),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Container(
                  alignment: Alignment.center,
                  height: AppDimen.size50,
                  width: AppDimen.size50,
                  child: TextFormField(
                    cursorColor: AppTheme.primaryColorLight,
                    focusNode: pin2FocusNode,
                    obscureText: true,
                    style: const TextStyle(fontSize: AppDimen.size24),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: otpInputDecoration,
                    onChanged: (value) => nextField(value, pin3FocusNode),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Container(
                  alignment: Alignment.center,
                  height: AppDimen.size50,
                  width: AppDimen.size50,
                  child: TextFormField(
                    cursorColor: AppTheme.primaryColorLight,
                    focusNode: pin3FocusNode,
                    obscureText: true,
                    style: const TextStyle(fontSize: AppDimen.size24),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: otpInputDecoration,
                    onChanged: (value) => nextField(value, pin4FocusNode),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Container(
                  alignment: Alignment.center,
                  height: AppDimen.size50,
                  width: AppDimen.size50,
                  child: TextFormField(
                    cursorColor: AppTheme.primaryColorLight,
                    focusNode: pin4FocusNode,
                    obscureText: true,
                    style: const TextStyle(fontSize: AppDimen.size24),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: otpInputDecoration,
                    onChanged: (value) => nextField(value, pin5FocusNode),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Container(
                  alignment: Alignment.center,
                  height: AppDimen.size50,
                  width: AppDimen.size50,
                  child: TextFormField(
                    cursorColor: AppTheme.primaryColorLight,
                    focusNode: pin5FocusNode,
                    obscureText: true,
                    style: const TextStyle(fontSize: AppDimen.size24),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: otpInputDecoration,
                    onChanged: (value) => nextField(value, pin6FocusNode),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Container(
                  alignment: Alignment.center,
                  height: AppDimen.size50,
                  width: AppDimen.size50,
                  child: TextFormField(
                    cursorColor: AppTheme.primaryColorLight,
                    focusNode: pin6FocusNode,
                    obscureText: true,
                    style: const TextStyle(fontSize: AppDimen.size24),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: otpInputDecoration,
                    onChanged: (value) {
                      if (value.length == 1) {
                        pin4FocusNode!.unfocus();
                        // Then you need to check is the code is correct or not
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: defaultPadding * 2),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppDimen.size40, vertical: AppDimen.size15),
              primary: AppTheme.primaryColorLight,
              shape: const StadiumBorder(),
            ),
            child: Text(
              AppConst.validateOTP.toUpperCase(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: AppDimen.size16,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                if (state is PhoneAuthCodeSentSuccess) {
                  _verifyOtp(context, state.verificationId);
                }
              }
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const HomePage();
                  },
                ),
              );
            },
          ),
        ],
      );
    });
  }
}
