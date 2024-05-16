import 'package:animate_do/animate_do.dart';
import 'package:chdtask/config/router/app_routes.dart';
import 'package:chdtask/core/extension/extension.dart';
import 'package:chdtask/core/utils/colors/app_color.dart';
import 'package:chdtask/core/utils/regex/app_regex.dart';
import 'package:chdtask/core/utils/spaceing/spaceing.dart';
import 'package:chdtask/core/utils/strings/app_strings.dart';
import 'package:chdtask/core/utils/styles/app_textstyle.dart';
import 'package:chdtask/core/utils/widget/custom_button.dart';
import 'package:chdtask/core/utils/widget/custom_richtext.dart';
import 'package:chdtask/core/utils/widget/custom_textfiled.dart';
import 'package:chdtask/core/utils/widget/title_text.dart';
import 'package:chdtask/features/login/presentation/manager/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = context.read<LoginCubit>();
    return Form(
      key: bloc.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          BounceInDown(
            duration: const Duration(milliseconds: 1000),
            child: const TitileText(
              text: AppStrings.welcomeBack,
            ),
          ),
          const VerticalSpace(35),
          FadeInLeft(
            duration: const Duration(milliseconds: 1000),
            child: CustomTextFiled(
              controller: bloc.phoneController,
              hintText: AppStrings.phone,
              prefixIcon: Image.asset(
                'assets/images/egyptflag.png',
                width: 30.w,
                height: 30.h,
              ),
              validator: (value) {
                if (value!.isEmpty || !AppRegex.hasMatchPhoneNumber(value)) {
                  return AppStrings.pleaseEnterValidPhone;
                }
                return null;
              },
            ),
          ),
          const VerticalSpace(31),
          GestureDetector(
            onTap: () {
              context.pushNamed(AppRoutes.forgotPassword);
            },
            child: Text(
              AppStrings.forgotPassword,
              textAlign: TextAlign.end,
              style: AppTextStyle.font12RegularPrimery,
            ),
          ),
          const VerticalSpace(52),
          BounceInUp(
            delay: const Duration(milliseconds: 1000),
            child: CustomButton(
              text: AppStrings.login,
              onTap: () async {
                if (bloc.formKey.currentState!.validate()) {
                  await bloc.login();
                }
              },
            ),
          ),
          const VerticalSpace(75),
          FadeInUp(
            from: 200,
            child: Text(
              AppStrings.orContinueWith,
              style: AppTextStyle.font12RegularPrimery
                  .copyWith(color: AppColor.greyColor),
              textAlign: TextAlign.center,
            ),
          ),
          const VerticalSpace(20),
          const Divider(
            color: AppColor.greyColor,
            thickness: .2,
          ),
          const VerticalSpace(20),
          BounceInRight(
            duration: const Duration(milliseconds: 1000),
            child: CustomRichText(
              text: AppStrings.creatAccount,
              headLineText: AppStrings.signup,
              onTap: () {
                context.pushReplacementNamed(AppRoutes.signUp);
              },
            ),
          ),
        ],
      ).setPadding(context, vertical: 20, horizontal: 20),
    );
  }
}
