import 'package:chdtask/core/utils/colors/app_color.dart';
import 'package:chdtask/core/utils/styles/app_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class LightTheme {
  static ThemeData lightTheme = ThemeData(
    
    scaffoldBackgroundColor: AppColor.backGroundColor,
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        elevation: 0.0,
        alignment: Alignment.center,
        enableFeedback: false,
      ),
    ),
    textTheme: TextTheme(
      bodySmall: AppTextStyle.font14GreySemiBold,
      bodyMedium: AppTextStyle.font18SemiBoldPrimeryPink,
      bodyLarge: AppTextStyle.font24ExtraBoldBlack,
    ),
    primaryColor: AppColor.primeryColor,
    iconTheme: IconThemeData(color: AppColor.primeryColor, size: 20.w),
    inputDecorationTheme: InputDecorationTheme(
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: AppColor.textFiledBoarderColor,
          width: 1,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: AppColor.textFiledBoarderColor,
          width: 1,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: AppColor.textFiledBoarderColor,
          width: 1,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide:
            const BorderSide(color: AppColor.textFiledBoarderColor, width: 1),
      ),
      filled: true,
      fillColor: AppColor.textFiledFilledColor,
    ),
    brightness: Brightness.light,
    useMaterial3: true,
  );
}
