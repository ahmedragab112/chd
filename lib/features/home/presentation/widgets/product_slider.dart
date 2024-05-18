import 'package:carousel_slider/carousel_slider.dart';
import 'package:chdtask/core/model/pic_model.dart';
import 'package:chdtask/features/home/presentation/manager/homecubit_cubit.dart';
import 'package:chdtask/features/home/presentation/widgets/slider_iteam.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductSlider extends StatelessWidget {
  const ProductSlider({super.key, required this.picModel});
  final PicModel picModel;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: picModel.paths
            .map((e) => SliderIteam(
                  image: e,
                ))
            .toList(),
            
        options: CarouselOptions(
          onPageChanged: (index, reason) {
            context.read<HomeCubit>().changeSliderIndex(index);
          },
          height: 200.h,
          viewportFraction: 1,
          initialPage: 0,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 2),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.ease,
        ));
  }
}
