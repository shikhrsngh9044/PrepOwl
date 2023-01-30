import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../_utils/configs/theme_config.dart';
import '../../../../_utils/constants/string_constants.dart';
import '../../../../_utils/helpers/validation.dart';
import '../../../../_utils/res/dimen.dart';
import '../../controller/login_bloc.dart';

class LoginForm extends StatelessWidget {
  LoginForm({
    Key? key,
  }) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _phoneNumberController = TextEditingController();

  void _onGenerateOTPPressed(BuildContext context) {
    bool isValidated = _formKey.currentState!.validate();
    if (isValidated) {
      context.read<LoginBloc>().add(GenerateOtp());

      _sendOtp(phoneNumber: _phoneNumberController.text, context: context);
    }
  }

  void _sendOtp({required String phoneNumber, required BuildContext context}) {
    context.read<LoginBloc>().add(
          SendOtpToPhoneEvent(
            phoneNumber: "+91$phoneNumber",
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Center(
            child: TextFormField(
              controller: _phoneNumberController,
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
                counterText: '',
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
                      width: 2, color: AppTheme.primaryColorLight),
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
                prefix: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppDimen.size8),
                  child: Text(
                    '(+91)',
                    style: TextStyle(
                      fontSize: AppDimen.size20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: AppDimen.size50),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppDimen.size40, vertical: AppDimen.size16),
              backgroundColor: AppTheme.primaryColorLight,
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
          const SizedBox(height: AppDimen.size30),
        ],
      ),
    );
  }
}
