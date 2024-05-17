import 'package:chdtask/core/utils/colors/app_color.dart';
import 'package:chdtask/core/utils/styles/app_textstyle.dart';
import 'package:flutter/material.dart';

class VerifyRichText extends StatelessWidget {
  const VerifyRichText({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.start,
      text: TextSpan(children: [
        TextSpan(text: "* ", style: AppTextStyle.font12RegularPrimery),
        TextSpan(
            text: text,
            style: AppTextStyle.font12RegularPrimery.copyWith(
              color: AppColor.greyColor,
            )),
        const TextSpan(
          text: "  ",
        ),
      ]),
    );
  }
}
