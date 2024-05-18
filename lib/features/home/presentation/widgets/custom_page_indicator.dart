import 'package:chdtask/core/model/pic_model.dart';
import 'package:chdtask/core/utils/colors/app_color.dart';
import 'package:chdtask/features/home/presentation/manager/homecubit_cubit.dart';
import 'package:chdtask/features/home/presentation/manager/homecubit_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SliderIndecator extends StatelessWidget {
  const SliderIndecator({super.key, });

  @override
  Widget build(BuildContext context) {
    var cubit=context.read<HomeCubit>();
    return Center(
      child: BlocBuilder<HomeCubit, HomeState>(
        buildWhen: (previous, current) => current is ChangeSliderIndex,
        builder: (context, state) {
          return AnimatedSmoothIndicator(
            curve: Curves.ease,
            count: picList.length,
            effect: ExpandingDotsEffect(
              activeDotColor: AppColor.primeryColor,
              dotHeight: 9.h,
              dotWidth: 9.w,
            ),
            activeIndex: cubit.activeIndex,
          );
        },
      ),
    );
  }
}
