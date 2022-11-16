import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../_utils/configs/theme_config.dart';
import '../../../../_utils/helpers/validation.dart';
import '../../../../_utils/res/dimen.dart';
import '../../../../_utils/constants/string_constants.dart';
import '../../../otpScreen/view/otp_screen.dart';

class LoginForm extends StatelessWidget {
  LoginForm({
    Key? key,
  }) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  void _onGenerateOTPPressed(BuildContext context) {
    bool isValidated = _formKey.currentState?.validate() ?? false;
    if (isValidated) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const OtpScreen();
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Center(
            child: TextFormField(
              validator: (value) {
                return Validation.phoneNumberValidation(value);
              },
              inputFormatters: [
                LengthLimitingTextInputFormatter(10),
                FilteringTextInputFormatter.digitsOnly
              ],
              maxLength: 10,
              keyboardType: TextInputType.number,
              cursorColor: AppTheme.primaryColorLight,
              decoration: InputDecoration(
                counterText: "",
                hintText: AppConst.hintText,
                labelText: AppConst.mobile,
                labelStyle: const TextStyle(color: AppTheme.primaryColorLight),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      width: 3, color: AppTheme.primaryColorLight),
                  borderRadius: BorderRadius.circular(AppDimen.size15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      width: 3, color: AppTheme.primaryColorLight),
                  borderRadius: BorderRadius.circular(AppDimen.size15),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      width: 3, color: AppTheme.primaryColorLight),
                  borderRadius: BorderRadius.circular(AppDimen.size15),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      width: 3, color: AppTheme.primaryColorLight),
                  borderRadius: BorderRadius.circular(AppDimen.size15),
                ),
              ),
            ),
          ),
          const SizedBox(height: AppDimen.size60),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppDimen.size40, vertical: AppDimen.size16),
              primary: AppTheme.primaryColorLight,
              shape: const StadiumBorder(),
            ),
            child: Text(
              AppConst.generateOTP.toUpperCase(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: AppDimen.size16,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () {
              _onGenerateOTPPressed(context);
            },
          ),
          const SizedBox(height: AppDimen.size60),
        ],
      ),
    );
  }
}
