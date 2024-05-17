import 'package:chdtask/core/utils/colors/app_color.dart';
import 'package:chdtask/features/home/presentation/manager/homecubit_cubit.dart';
import 'package:chdtask/features/home/presentation/manager/homecubit_state.dart';
import 'package:chdtask/features/home/presentation/widgets/custom_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: CustomScrollView(
        slivers: [
          BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              var cubit = context.read<HomeCubit>();
              return state.whenOrNull(
                    success: () {
                      return SliverGrid.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                          itemBuilder: (context, index) => CustomProduct(
                                dataEntity: cubit.productEntity!.data![index],
                              ),
                          itemCount: cubit.productEntity!.data!.length);
                    },
                  ) ??
                  const SliverToBoxAdapter(
                    child: Center(
                      child: CircularProgressIndicator(
                        color: AppColor.primeryColor,
                      ),
                    ),
                  );
            },
          ),
        ],
      )),
    );
  }
}
