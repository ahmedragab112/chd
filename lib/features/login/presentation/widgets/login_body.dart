import 'package:animate_do/animate_do.dart';
import 'package:chdtask/config/router/app_routes.dart';
import 'package:chdtask/core/extension/extension.dart';
import 'package:chdtask/core/utils/colors/app_color.dart';
import 'package:chdtask/core/utils/regex/app_regex.dart';
import 'package:chdtask/core/utils/spaceing/spaceing.dart';
import 'package:chdtask/core/utils/strings/app_strings.dart';
import 'package:chdtask/core/utils/widget/custom_richtext.dart';
import 'package:chdtask/core/utils/widget/custom_textfiled.dart';
import 'package:chdtask/core/utils/widget/title_text.dart';
import 'package:chdtask/features/login/presentation/manager/login_cubit.dart';
import 'package:chdtask/features/login/presentation/widgets/custom_egypt_flag.dart';
import 'package:chdtask/features/login/presentation/widgets/custom_login_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
              prefixIcon: const CustomEgyptFlage(),
              validator: (value) {
                if (value!.isEmpty || !AppRegex.hasMatchPhoneNumber(value)) {
                  return AppStrings.pleaseEnterValidPhone;
                }
                return null;
              },
            ),
          ),
          const VerticalSpace(31),
          FadeInRight(
            duration: const Duration(milliseconds: 1000),
            child: CustomTextFiled(
              validator: (value) {
                if (value!.isEmpty) {
                  return AppStrings.thisFiledIsRequired;
                }
                return null;
              },
              controller: bloc.identityController,
              hintText: AppStrings.identity,
              prefixIcon: Icon(
                FontAwesomeIcons.idCard,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          const VerticalSpace(52),
          BounceInUp(
              delay: const Duration(milliseconds: 1000),
              child: const CustomLoginButton()),
          const VerticalSpace(50),
          BounceInUp(
            child: const Divider(
              color: AppColor.greyColor,
              thickness: .5,
            ),
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
