import 'package:chdtask/config/router/app_routes.dart';
import 'package:chdtask/core/extension/extension.dart';
import 'package:chdtask/core/function/tosta.dart';
import 'package:chdtask/core/utils/colors/app_color.dart';
import 'package:chdtask/core/utils/strings/app_strings.dart';
import 'package:chdtask/core/utils/styles/app_textstyle.dart';
import 'package:chdtask/features/login/presentation/manager/login_cubit.dart';
import 'package:chdtask/features/login/presentation/manager/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomLoginButton extends StatelessWidget {
  const CustomLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<LoginCubit>();
    return InkWell(
      onTap: () async {
        if (cubit.formKey.currentState!.validate()) {
          await cubit.login();
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
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            state.whenOrNull(
              success: (data) {
                successToast(context,
                    title: 'Success Login with OTP',
                    description: 'OTP: ${data.otp}');

                context.pushNamed(AppRoutes.verify);
              },
              failure: (error) =>
                  errorToast(context, title: 'Error', description: error),
            );
          },
          builder: (context, state) =>
              state.maybeWhen(
                loading: () => const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
                orElse: () => Text(
                  AppStrings.login,
                  style: AppTextStyle.font20SemiBoldWhite,
                ),
              ) ??
              const SizedBox(),
        ),
      ),
    );
  }
}
