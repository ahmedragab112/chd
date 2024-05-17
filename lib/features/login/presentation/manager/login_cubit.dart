import 'package:bloc/bloc.dart';
import 'package:chdtask/core/cache/cache_helper.dart';
import 'package:chdtask/core/di/di.dart';
import 'package:chdtask/core/utils/strings/app_strings.dart';
import 'package:chdtask/features/login/data/models/login_request_body.dart';
import 'package:chdtask/features/login/domain/usecases/login_usecase.dart';
import 'package:chdtask/features/login/presentation/manager/login_state.dart';
import 'package:flutter/material.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginUseCase loginUseCase;
  LoginCubit({required this.loginUseCase}) : super(const LoginState.initial());

  bool isobscureText = true;
  var formKey = GlobalKey<FormState>();

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController identityController = TextEditingController();

  Future<void> login() async {
    emit(const LoginState.loading());
    final result = await loginUseCase.login(
      loginData: LoginRequestBody(
        dialCode: "20",
        identity: identityController.text,
        phone: phoneController.text,
      ),
    );
    result.when(
        data: (data) async{
          emit(LoginState.success(loginEntity: data));
         await locator<CacheHelper>().setInstance(
              data: identityController.text, key: AppStrings.deviceIdentityKey);
        },
        error: (error) =>
            emit(LoginState.failure(error: error.apiErrorModel.message!)));
  }
}
