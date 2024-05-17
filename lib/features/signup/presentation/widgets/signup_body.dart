import 'package:animate_do/animate_do.dart';
import 'package:chdtask/config/router/app_routes.dart';
import 'package:chdtask/core/extension/extension.dart';
import 'package:chdtask/core/utils/colors/app_color.dart';
import 'package:chdtask/core/utils/spaceing/spaceing.dart';
import 'package:chdtask/core/utils/strings/app_strings.dart';
import 'package:chdtask/core/utils/styles/app_textstyle.dart';
import 'package:chdtask/core/utils/widget/custom_richtext.dart';
import 'package:chdtask/core/utils/widget/title_text.dart';
import 'package:chdtask/features/signup/presentation/manager/singup_cubit.dart';
import 'package:chdtask/features/signup/presentation/widgets/custom_signup_button.dart';
import 'package:chdtask/features/signup/presentation/widgets/signup_modual.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<SingupCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        BounceInDown(
          from: 100,
          child: const TitileText(
            text: AppStrings.creatAccount,
          ),
        ),
        const VerticalSpace(35),
        const SignUpModual(),
        const VerticalSpace(20),
        ElasticIn(
            duration: const Duration(milliseconds: 1000),
            child: const CustomSignUpButton()),
        const VerticalSpace(20),
        FadeInUp(
          duration: const Duration(milliseconds: 1000),
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
        CustomRichText(
          text: AppStrings.alreadyHaveAccount,
          headLineText: AppStrings.login,
          onTap: () {
            context.pushReplacementNamed(AppRoutes.signIn);
          },
        ),
      ],
    ).setPadding(context, vertical: 20, horizontal: 20);
  }
}
