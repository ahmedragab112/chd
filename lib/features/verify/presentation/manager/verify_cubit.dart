import 'package:bloc/bloc.dart';
import 'package:chdtask/core/cache/cache_helper.dart';
import 'package:chdtask/core/di/di.dart';
import 'package:chdtask/core/utils/strings/app_strings.dart';
import 'package:chdtask/features/verify/data/models/verify_body.dart';
import 'package:chdtask/features/verify/domain/usecases/verify_usecase.dart';
import 'package:chdtask/features/verify/presentation/manager/verify_state.dart';
import 'package:flutter/material.dart';

class VerifyCubit extends Cubit<VerifyState> {
  VerifyUseCase verifyUseCase;
  final formKey = GlobalKey<FormState>();

  final TextEditingController otpController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  VerifyCubit({required this.verifyUseCase})
      : super(const VerifyState.initial());

  Future<void> verify() async {
    emit(const VerifyState.loading());
    final result = await verifyUseCase.verify(
        verifyBody: VerifyBody(
      fcmToken: '234',
      identity: locator<CacheHelper>().getString(AppStrings.deviceIdentityKey),
      otp: otpController.text,
      phone: phoneController.text,
    ));
    result.when(
        data: (data) async {
          emit(VerifyState.success(verifyEntity: data));
          await locator<CacheHelper>().setInstance(
              data: "${data.tokenType} ${data.accessToken}",
              key: AppStrings.cacheKeyUserToken);
        },
        error: (error) =>
            emit(VerifyState.failure(error: error.apiErrorModel.message!)));
  }
}
