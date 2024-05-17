import 'package:animate_do/animate_do.dart';
import 'package:chdtask/config/router/app_router.dart';
import 'package:chdtask/config/router/app_routes.dart';
import 'package:chdtask/core/extension/extension.dart';
import 'package:chdtask/core/utils/spaceing/spaceing.dart';
import 'package:chdtask/core/utils/strings/app_strings.dart';
import 'package:chdtask/core/utils/widget/custom_richtext.dart';
import 'package:chdtask/core/utils/widget/title_text.dart';
import 'package:chdtask/features/verify/presentation/widgets/custom_verifybutton.dart';
import 'package:chdtask/features/verify/presentation/widgets/verify_modual.dart';
import 'package:chdtask/features/verify/presentation/widgets/verify_richtext.dart';
import 'package:flutter/material.dart';

class VerifyBody extends StatelessWidget {
  const VerifyBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BounceInDown(
          duration: kanimationDuration,
          child: const TitileText(
            text: AppStrings.verifyRestCode,
          ),
        ),
        const VerticalSpace(18),
        const VerifyModual(),
        const VerticalSpace(30),
        FadeInUp(
          duration: kanimationDuration,
          child: const VerifyRichText(
            text: AppStrings.theCodeWeSend,
          ),
        ),
        const VerticalSpace(18),
        FadeInUp(
          duration: kanimationDuration,
          child: CustomRichText(
            text: "Can't receive code?",
            headLineText: "Back To Login",
            onTap: () {
              context.pushNamedAndRemoveUntil(AppRoutes.signIn);
            },
          ),
        ),
        const VerticalSpace(30),
        ElasticIn(duration: kanimationDuration, child: const VerifyButton()),
      ],
    ).setPadding(context, horizontal: 15, vertical: 15);
  }
}
