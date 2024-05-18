import 'package:animate_do/animate_do.dart';
import 'package:chdtask/core/extension/extension.dart';
import 'package:chdtask/core/model/pic_model.dart';
import 'package:chdtask/core/utils/colors/app_color.dart';
import 'package:chdtask/core/utils/spaceing/spaceing.dart';
import 'package:chdtask/core/utils/styles/app_textstyle.dart';
import 'package:chdtask/features/home/presentation/widgets/custom_page_indicator.dart';
import 'package:chdtask/features/home/presentation/widgets/product_slider.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({
    super.key,
    required this.title,
    required this.description,
    required this.picModel,
  });
  final String title;
  final String description;
  final PicModel picModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: BounceInDown(
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
            ),
            const SliverToBoxAdapter(
              child: VerticalSpace(30),
            ),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BounceInUp(
                    child: ProductSlider(
                      picModel: picModel,
                    ),
                  ),
                  const VerticalSpace(20),
                  BounceInRight(child: const SliderIndecator()),
                  const VerticalSpace(20),
                  BounceInLeft(
                    child: Text(
                      title,
                      style: AppTextStyle.font18SemiBoldPrimeryPink,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  const VerticalSpace(20),
                  BounceInDown(
                    child: Text(
                      description.replaceAll(RegExp(r'\n\s+'), '\n'),
                      style: AppTextStyle.font14GreySemiBold,
                    ),
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
