import 'package:chdtask/config/router/app_routes.dart';
import 'package:chdtask/core/extension/extension.dart';
import 'package:chdtask/core/function/tosta.dart';
import 'package:chdtask/core/utils/colors/app_color.dart';
import 'package:chdtask/core/utils/strings/app_strings.dart';
import 'package:chdtask/core/utils/styles/app_textstyle.dart';
import 'package:chdtask/features/signup/presentation/manager/singup_cubit.dart';
import 'package:chdtask/features/signup/presentation/manager/singup_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSignUpButton extends StatelessWidget {
  const CustomSignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<SingupCubit>();
    return InkWell(
      onTap: () async {
        if (cubit.formKey.currentState!.validate()) {
          await cubit.signUp();
        }
      },
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        height: 55.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.r),
          color: AppColor.primeryColor,
        ),
        child: BlocConsumer<SingupCubit, SingupState>(
          listener: (context, state) {
            state.whenOrNull(
              success: (data) {
                successToast(context,
                    title: 'Success Signup with OTP',
                    description: 'OTP: ${data.otp}');
                context.pushReplacementNamed(AppRoutes.verify);
              },
              failure: (error) {
                errorToast(context, title: 'Error', description: error);
              },
            );
          },
          builder: (context, state) {
            return state.maybeWhen(
                  loading: () => const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ),
                  orElse: () => Text(
                    AppStrings.signup,
                    style: AppTextStyle.font20SemiBoldWhite,
                  ),
                ) ??
                const SizedBox();
          },
        ),
      ),
    );
  }
}
