import 'package:chdtask/core/utils/colors/app_color.dart';
import 'package:chdtask/core/utils/spaceing/spaceing.dart';
import 'package:chdtask/core/utils/styles/app_textstyle.dart';
import 'package:chdtask/features/home/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomProduct extends StatelessWidget {
  const CustomProduct({super.key, required this.dataEntity});
  final DataEntity dataEntity;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColor.primeryColor, width: 1),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            dataEntity.name ?? '',
            style: AppTextStyle.font18SemiBoldPrimeryPink,
          ),
          const VerticalSpace(12),
          Text(
            dataEntity.description ?? '',
            style: AppTextStyle.font14GreySemiBold
                .copyWith(fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
