import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sizer/sizer.dart';

import '../../../../_utils/configs/theme_config.dart';
import '../../../../_utils/constants/string_constants.dart';
import '../../../../_utils/res/dimen.dart';
import '../../controller/auth_bloc.dart';

class OtpUI extends StatelessWidget {
  const OtpUI({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AuthBloc, AuthState, String>(
      selector: (state) => state.otp,
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            PinCodeTextField(
              appContext: context,
              length: 6,
              onChanged: (value) =>
                  context.read<AuthBloc>().add(ChangeOTP(value)),
            ),
            SizedBox(height: 4.h),
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
                context.read<AuthBloc>().add(VerifyPhoneNumber());
              },
            ),
          ],
        );
      },
    );
  }
}
