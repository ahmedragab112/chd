import 'package:chdtask/core/utils/colors/app_color.dart';
import 'package:chdtask/core/utils/styles/app_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomDataContainer extends StatelessWidget {
  const CustomDataContainer({super.key, required this.txt});
  final String txt;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColor.greyColor, width: 1),
      ),
      child: Text(
        txt,
        style: AppTextStyle.font14GreySemiBold.copyWith(color: Colors.black),
        textAlign: TextAlign.start,
      ),
    );
  }
}
