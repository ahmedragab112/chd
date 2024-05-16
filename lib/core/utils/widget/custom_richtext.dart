import 'package:chdtask/core/utils/colors/app_color.dart';
import 'package:chdtask/core/utils/styles/app_textstyle.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';


class CustomRichText extends StatelessWidget {
  const CustomRichText(
      {super.key,
      required this.text,
      required this.headLineText,
      required this.onTap,
      this.textAlign = TextAlign.center});
  final String text;
  final String headLineText;
  final TextAlign textAlign;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: textAlign,
      text: TextSpan(children: [
        TextSpan(
          text: text,
          style: AppTextStyle.font18SemiBoldPrimeryPink
              .copyWith(color: AppColor.greyColor, fontSize: 14),
        ),
        const TextSpan(text: '  '),
        TextSpan(
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              onTap();
            },
          text: headLineText,
          style: AppTextStyle.font18SemiBoldPrimeryPink.copyWith(
              decoration: TextDecoration.underline,
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColor.primeryColor),
        )
      ]),
    );
  }
}
