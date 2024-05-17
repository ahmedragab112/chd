import 'package:animate_do/animate_do.dart';
import 'package:chdtask/config/router/app_router.dart';
import 'package:chdtask/core/utils/colors/app_color.dart';
import 'package:chdtask/core/utils/regex/app_regex.dart';
import 'package:chdtask/core/utils/spaceing/spaceing.dart';
import 'package:chdtask/core/utils/strings/app_strings.dart';
import 'package:chdtask/core/utils/widget/custom_textfiled.dart';
import 'package:chdtask/features/login/presentation/widgets/custom_egypt_flag.dart';
import 'package:chdtask/features/verify/presentation/manager/verify_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyModual extends StatelessWidget {
  const VerifyModual({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var bloc = context.read<VerifyCubit>();

    return Form(
      key: bloc.formKey,
      child: Column(
        children: [
          FadeInRight(
            duration: kanimationDuration,
            child: CustomTextFiled(
                hintText: AppStrings.phone,
                controller: bloc.phoneController,
                validator: (value) {
                  if (value!.isEmpty || !AppRegex.hasMatchPhoneNumber(value)) {
                    return AppStrings.pleaseEnterValidPhone;
                  }
                  return null;
                },
                prefixIcon: const CustomEgyptFlage()),
          ),
          const VerticalSpace(30),
          FadeInLeft(
            duration: kanimationDuration,
            child: CustomTextFiled(
              hintText: AppStrings.optCode,
              controller: bloc.otpController,
              prefixIcon: const Icon(
                Icons.verified_outlined,
                color: AppColor.primeryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
