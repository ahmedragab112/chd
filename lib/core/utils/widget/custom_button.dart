import 'package:chdtask/core/utils/colors/app_color.dart';
import 'package:chdtask/core/utils/styles/app_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, this.onTap});
  final String text;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        height: 55.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.r),
            color: AppColor.primeryColor),
        child: Text(
          text,
          style: AppTextStyle.font20SemiBoldWhite,
        ),
      ),
    );
  }
}
