import 'package:chdtask/core/di/di.dart';
import 'package:chdtask/core/extension/extension.dart';
import 'package:chdtask/core/model/pic_model.dart';
import 'package:chdtask/core/utils/colors/app_color.dart';
import 'package:chdtask/core/utils/spaceing/spaceing.dart';
import 'package:chdtask/core/utils/styles/app_textstyle.dart';
import 'package:chdtask/features/home/domain/entities/product_entity.dart';
import 'package:chdtask/features/home/presentation/manager/homecubit_cubit.dart';
import 'package:chdtask/features/home/presentation/pages/product_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomProduct extends StatelessWidget {
  const CustomProduct({
    super.key,
    required this.dataEntity,
    required this.picModel,
  });
  final DataEntity dataEntity;
  final PicModel picModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(BlocProvider(
          create: (context) => locator<HomeCubit>(),
          child: ProductDetails(
            description: dataEntity.description ?? '',
            title: dataEntity.name ?? '',
            picModel: picModel,
          ),
        ));
      },
      child: Card(
        elevation: 5,
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
                child: Image.asset(
                  picModel.paths[0],
                  width: double.infinity,
                  fit: BoxFit.fill,
                  height: 100.h,
                ),
              )),
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
      ),
    );
  }
}
