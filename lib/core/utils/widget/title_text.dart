import 'package:chdtask/core/utils/styles/app_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitileText extends StatelessWidget {
  const TitileText({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200.w,
      child: Text(
        text,
        style: AppTextStyle.font36BoldBlack,
        textAlign: TextAlign.start,
        maxLines: 2,
      ),
    );
  }
}
