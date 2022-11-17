import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prepowl/modules/home/view/home_page.dart';
import 'package:prepowl/modules/login/controller/login_bloc.dart';
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

  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  // ignore: override_on_non_overriding_member
  void dispose() {
    _phoneNumberController.dispose();
  }

  void _onGenerateOTPPressed(BuildContext context) {
    bool isValidated = _formKey.currentState!.validate();
    if (isValidated) {
      _sendOtp(phoneNumber: _phoneNumberController.text, context: context);
    }
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return OtpUIScreen(phoneNumberController: _phoneNumberController);
        },
      ),
    );
  }

  void _sendOtp({required String phoneNumber, required BuildContext context}) {
    context.read<PhoneAuthBloc>().add(
          SendOtpToPhoneEvent(
            phoneNumber: phoneNumber,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PhoneAuthBloc, PhoneAuthState>(
      listener: (context, state) {
        if (state is PhoneAuthVerified) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (_) => const HomePage(),
            ),
          );
        }

        if (state is PhoneAuthError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error),
            ),
          );
        }
      },
      child:
          BlocBuilder<PhoneAuthBloc, PhoneAuthState>(builder: (context, state) {
        if (state is PhoneAuthLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
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
                    LengthLimitingTextInputFormatter(13),
                    //FilteringTextInputFormatter.digitsOnly
                  ],
                  maxLength: 13,
                  keyboardType: TextInputType.number,
                  cursorColor: AppTheme.primaryColorLight,
                  decoration: InputDecoration(
                    counterText: "",
                    hintText: AppConst.hintText,
                    labelText: AppConst.mobile,
                    labelStyle:
                        const TextStyle(color: AppTheme.primaryColorLight),
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
      }),
    );
  }
}
