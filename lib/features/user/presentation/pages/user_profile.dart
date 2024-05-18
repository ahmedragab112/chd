import 'package:animate_do/animate_do.dart';
import 'package:chdtask/config/router/app_routes.dart';
import 'package:chdtask/core/cache/cache_helper.dart';
import 'package:chdtask/core/di/di.dart';
import 'package:chdtask/core/extension/extension.dart';
import 'package:chdtask/core/utils/colors/app_color.dart';
import 'package:chdtask/core/utils/spaceing/spaceing.dart';
import 'package:chdtask/core/utils/strings/app_strings.dart';
import 'package:chdtask/core/utils/styles/app_textstyle.dart';
import 'package:chdtask/core/utils/widget/custom_button.dart';
import 'package:chdtask/features/user/presentation/manager/profile_cubit.dart';
import 'package:chdtask/features/user/presentation/manager/profile_state.dart';
import 'package:chdtask/features/user/presentation/widgets/data_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<ProfileCubit>();
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    alignment: Alignment.centerLeft,
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.black,
                    ),
                  ),
                  const VerticalSpace(24),
                  FadeIn(
                    child: Center(
                      child: Image.asset(
                        'assets/images/avatar.png',
                        width: 66.w,
                        height: 66.h,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const VerticalSpace(24),
                  BlocBuilder<ProfileCubit, ProfileState>(
                    builder: (context, state) =>
                        state.maybeWhen(
                          loading: () {
                            return const Center(
                              child: CircularProgressIndicator(
                                color: AppColor.primeryColor,
                              ),
                            );
                          },
                          orElse: () {
                            return BounceInUp(
                              child: Text(
                                'Welcome , ${cubit.profileEntity?.data?.name ?? ''}',
                                style: AppTextStyle.font18SemiBoldPrimeryPink
                                    .copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: AppColor.greyColor),
                                textAlign: TextAlign.start,
                              ),
                            );
                          },
                        ) ??
                        const SizedBox(),
                  ),
                  const VerticalSpace(12),
                  BounceInUp(
                    child: Text(
                      'Personal Details',
                      style: AppTextStyle.font18SemiBoldPrimeryPink.copyWith(
                          fontWeight: FontWeight.w500, color: Colors.black),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  const VerticalSpace(20),
                  BounceInRight(
                    child: Text(
                      'Phone',
                      style: AppTextStyle.font14GreySemiBold
                          .copyWith(fontWeight: FontWeight.w500),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  const VerticalSpace(15),
                  BlocBuilder<ProfileCubit, ProfileState>(
                    builder: (context, state) =>
                        state.maybeWhen(
                          loading: () {
                            return const Center(
                              child: CircularProgressIndicator(
                                color: AppColor.primeryColor,
                              ),
                            );
                          },
                          orElse: () {
                            return BounceInRight(
                              child: CustomDataContainer(
                                txt: cubit.profileEntity?.data?.phone
                                        .toString() ??
                                    '',
                              ),
                            );
                          },
                        ) ??
                        const SizedBox(),
                  ),
                  const VerticalSpace(28),
                  BounceInUp(
                    child: Text(
                      'Password',
                      style: AppTextStyle.font14GreySemiBold
                          .copyWith(fontWeight: FontWeight.w500),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  const VerticalSpace(28),
                  BounceInLeft(
                    child: const CustomDataContainer(
                      txt: '***********************',
                    ),
                  ),
                  const VerticalSpace(28),
                  BounceInUp(
                    child: const Divider(
                      color: AppColor.greyColor,
                      thickness: .5,
                    ),
                  ),
                  const VerticalSpace(36),
                  BounceInDown(
                    child: CustomButton(
                      text: 'Log Out',
                      onTap: () async {
                        await locator<CacheHelper>().clear().then((value) {
                          context.pushReplacementNamed(AppRoutes.signIn);
                        });
                      },
                    ),
                  ),
                  const VerticalSpace(36),
                  FadeInDown(
                    child: SizedBox(
                      width: double.infinity,
                      height: 30.h,
                      child: RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(children: [
                          TextSpan(
                            text: AppStrings.byClickingThe,
                            style: AppTextStyle.font12RegularPrimery
                                .copyWith(color: AppColor.greyPrimary),
                          ),
                          TextSpan(
                              text: AppStrings.logOut,
                              style: AppTextStyle.font12RegularPrimery),
                          TextSpan(
                              text: AppStrings.youWillBackToLogin,
                              style: AppTextStyle.font12RegularPrimery
                                  .copyWith(color: AppColor.greyPrimary))
                        ]),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ).setPadding(context, horizontal: 16, vertical: 6),
      ),
    );
  }
}
