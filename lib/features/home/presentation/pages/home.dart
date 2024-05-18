import 'package:animate_do/animate_do.dart';
import 'package:chdtask/core/extension/extension.dart';
import 'package:chdtask/core/model/pic_model.dart';
import 'package:chdtask/core/utils/colors/app_color.dart';
import 'package:chdtask/core/utils/spaceing/spaceing.dart';
import 'package:chdtask/features/home/presentation/manager/homecubit_cubit.dart';
import 'package:chdtask/features/home/presentation/manager/homecubit_state.dart';
import 'package:chdtask/features/home/presentation/widgets/custom_product.dart';
import 'package:chdtask/features/home/presentation/widgets/home_drawer_body.dart';
import 'package:chdtask/features/home/presentation/widgets/title_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const Drawer(
          child: DrawerBody(),
        ),
        body: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: TitleAndMenu(),
            ),
            const SliverToBoxAdapter(
              child: VerticalSpace(20),
            ),
            BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                var cubit = context.read<HomeCubit>();
                return state.whenOrNull(
                      failure: (error) {
                        return SliverFillRemaining(
                          child: Center(
                            child: Text(error),
                          ),
                        );
                      },
                      loading: () {
                        return const SliverFillRemaining(
                            child: Center(
                          child: CircularProgressIndicator(
                            color: AppColor.primeryColor,
                          ),
                        ));
                      },
                      success: () {
                        return SliverGrid.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 20,
                                    childAspectRatio: 3 / 6,
                                    crossAxisSpacing: 20),
                            itemBuilder: (context, index) => index.isEven
                                ? BounceInLeft(
                                    child: CustomProduct(
                                      dataEntity:
                                          cubit.productEntity!.data![index],
                                      picModel: picList[index],
                                    ),
                                  )
                                : BounceInRight(
                                    child: CustomProduct(
                                      dataEntity:
                                          cubit.productEntity!.data![index],
                                      picModel: picList[index],
                                    ),
                                  ),
                            itemCount: cubit.productEntity!.data!.length);
                      },
                    ) ??
                    const SliverFillRemaining(child: SizedBox());
              },
            ),
          ],
        ).setPadding(context, horizontal: 10, vertical: 20),
      ),
    );
  }
}
