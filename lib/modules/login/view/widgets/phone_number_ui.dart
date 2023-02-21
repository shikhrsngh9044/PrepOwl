import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../_utils/configs/theme_config.dart';
import '../../../../_utils/constants/string_constants.dart';
import '../../../../_utils/constants/widget_constants.dart';
import '../../../../_utils/helpers/validation.dart';
import '../../../../_utils/res/dimen.dart';
import '../../../../_utils/ui_components/widget_extensions.dart';
import '../../controller/auth_bloc.dart';

class PhoneNumberUI extends StatelessWidget {
  const PhoneNumberUI({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AuthBloc, AuthState, String>(
      selector: (state) => state.phoneNumber,
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              maxLength: 10,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              keyboardType: TextInputType.phone,
              cursorColor: AppTheme.primaryColorLight,
              inputFormatters: [
                LengthLimitingTextInputFormatter(10),
                FilteringTextInputFormatter.digitsOnly
              ],
              decoration: WidgetConstants.inputDecoration.copyWith(
                hintText: AppConst.hintText,
                labelText: AppConst.mobile,
                prefix: Text(
                  '(+91)',
                  style: Theme.of(context).textTheme.labelSmall,
                ).addSymmetricPadding(horizontal: AppDimen.size8),
              ),
              validator: (value) {
                return Validation.phoneNumberValidation(value);
              },
              onChanged: (value) =>
                  context.read<AuthBloc>().add(ChangePhoneNumber(value)),
            ),
            SizedBox(height: 4.h),
            ElevatedButton(
              onPressed: state.length < 10
                  ? null
                  : () {
                      context.read<AuthBloc>().add(VerifyPhoneNumber());
                    },
              child: Text(AppConst.generateOTP.toUpperCase()),
            ),
          ],
        );
      },
    );
  }
}
