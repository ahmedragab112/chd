import 'package:chdtask/core/extension/extension.dart';
import 'package:chdtask/core/utils/colors/app_color.dart';
import 'package:chdtask/core/utils/spaceing/spaceing.dart';
import 'package:chdtask/core/utils/styles/app_textstyle.dart';
import 'package:chdtask/core/utils/widget/custom_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails(
      {super.key, required this.title, required this.description});
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      color: AppColor.primeryColor,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Details',
                      style: AppTextStyle.font18SemiBoldPrimeryPink,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            const SliverToBoxAdapter(
              child: VerticalSpace(30),
            ),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomNetWorkImage(
                      imagePath:
                          'https://th.bing.com/th/id/OIP.H0LLYgnpWZ0UjKRHpQ5ZFgHaHa?w=177&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7',
                      width: double.infinity,
                      height: 200.h),
                  const VerticalSpace(20),
                  Text(
                    title,
                    style: AppTextStyle.font18SemiBoldPrimeryPink,
                    textAlign: TextAlign.start,
                  ),
                  const VerticalSpace(20),
                  Text(
                    description.replaceAll(RegExp(r'\n\s+'), '\n'),
                    style: AppTextStyle.font14GreySemiBold,
                  ),
                ],
              ),
            )
          ],
        ).setPadding(context, horizontal: 20, vertical: 10),
      ),
    );
  }
}
