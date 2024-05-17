import 'package:chdtask/core/extension/extension.dart';
import 'package:chdtask/core/utils/colors/app_color.dart';
import 'package:chdtask/core/utils/spaceing/spaceing.dart';
import 'package:chdtask/core/utils/styles/app_textstyle.dart';
import 'package:chdtask/core/utils/widget/custom_network_image.dart';
import 'package:chdtask/features/home/domain/entities/product_entity.dart';
import 'package:chdtask/features/home/presentation/pages/product_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomProduct extends StatelessWidget {
  const CustomProduct({super.key, required this.dataEntity});
  final DataEntity dataEntity;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(ProductDetails(
          description: dataEntity.description ?? '',
          title: dataEntity.name ?? '',
        ));
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: AppColor.primeryColor, width: 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: CustomNetWorkImage(
                    imagePath:
                        'https://th.bing.com/th/id/OIP.H0LLYgnpWZ0UjKRHpQ5ZFgHaHa?w=177&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7',
                    width: double.infinity,
                    height: 50.h),
              ),
            ),
            const VerticalSpace(12),
            Column(
              children: [
                Text(
                  dataEntity.name ?? '',
                  style: AppTextStyle.font18SemiBoldPrimeryPink,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const VerticalSpace(12),
                Text(
                  dataEntity.description ?? '',
                  style: AppTextStyle.font14GreySemiBold
                      .copyWith(fontWeight: FontWeight.w500),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                const VerticalSpace(10),
                const Row(
                  children: [],
                )
              ],
            ).setAllPadding(8)
          ],
        ),
      ),
    );
  }
}
