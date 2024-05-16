import 'package:chdtask/core/utils/colors/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle {
  static TextStyle font10RegularGrey = GoogleFonts.montserrat(
    fontSize: 10.sp,
    fontWeight: FontWeight.w400,
    color: AppColor.greyColor,
  );
  static TextStyle font12RegularPrimery = GoogleFonts.montserrat(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: AppColor.primeryColor,
  );
  static TextStyle font24ExtraBoldBlack = GoogleFonts.montserrat(
    fontSize: 24.sp,
    fontWeight: FontWeight.w800,
    color: Colors.black,
  );
  static TextStyle font14GreySemiBold = GoogleFonts.montserrat(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: Colors.grey,
  );
  static TextStyle font18SemiBoldPrimeryPink = GoogleFonts.montserrat(
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
    color: AppColor.primeryColor,
  );

  static TextStyle font36BoldBlack = GoogleFonts.montserrat(
    fontSize: 36.sp,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
  static TextStyle font20SemiBoldWhite = GoogleFonts.montserrat(
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
}
