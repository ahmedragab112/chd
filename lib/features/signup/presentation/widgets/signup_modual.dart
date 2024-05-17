import 'package:animate_do/animate_do.dart';
import 'package:chdtask/core/utils/regex/app_regex.dart';
import 'package:chdtask/core/utils/spaceing/spaceing.dart';
import 'package:chdtask/core/utils/strings/app_strings.dart';
import 'package:chdtask/core/utils/widget/custom_textfiled.dart';
import 'package:chdtask/features/login/presentation/widgets/custom_egypt_flag.dart';
import 'package:chdtask/features/signup/presentation/manager/singup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpModual extends StatelessWidget {
  const SignUpModual({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var bloc = context.read<SingupCubit>();
    return Form(
      key: bloc.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          FadeInRight(
            duration: const Duration(milliseconds: 1000),
            child: CustomTextFiled(
              controller: bloc.firstNameController,
              hintText: AppStrings.firstName,
              prefixIcon: Icon(
                Icons.person,
                color: Theme.of(context).primaryColor,
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return AppStrings.pleaseEnterValidName;
                }
                return null;
              },
            ),
          ),
          const VerticalSpace(31),
          FadeInLeft(
            duration: const Duration(milliseconds: 1000),
            child: CustomTextFiled(
              validator: (value) {
                if (value!.isEmpty) {
                  return AppStrings.thisFiledIsRequired;
                }
                return null;
              },
              controller: bloc.lastNameController,
              hintText: AppStrings.lastName,
              prefixIcon: Icon(
                Icons.person,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          const VerticalSpace(31),
          FadeInRight(
            duration: const Duration(milliseconds: 1000),
            child: CustomTextFiled(
                validator: (phoneNumber) {
                  if (phoneNumber!.isEmpty || !AppRegex.hasMatchPhoneNumber(phoneNumber)) {
                  return  AppStrings.enterOnlyEgyptionNumber;
                  }
                  return null;
                },
                controller: bloc.phoneController,
                hintText: AppStrings.phone,
                prefixIcon: const CustomEgyptFlage()),
          ),
          const VerticalSpace(31),
        ],
      ),
    );
  }
}
