import 'package:chdtask/core/utils/spaceing/spaceing.dart';
import 'package:chdtask/core/utils/styles/app_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomEgyptFlage extends StatelessWidget {
  const CustomEgyptFlage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/egyptflag.png',
            width: 20.w,
            height: 20.h,
            fit: BoxFit.fill,
          ),
          const HorizantelSpace(5),
          Text(
            '+20',
            style: AppTextStyle.font14GreySemiBold
                .copyWith(color: Colors.black, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
