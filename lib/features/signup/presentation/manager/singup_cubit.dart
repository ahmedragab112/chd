import 'package:bloc/bloc.dart';
import 'package:chdtask/features/signup/data/models/signup_body.dart';
import 'package:chdtask/features/signup/domain/usecases/signup_usecase.dart';
import 'package:chdtask/features/signup/presentation/manager/singup_state.dart';
import 'package:flutter/material.dart';

class SingupCubit extends Cubit<SingupState> {
  final SignUpUseCase signUpUseCase;
  SingupCubit({required this.signUpUseCase})
      : super(const SingupState.initial());
  final formKey = GlobalKey<FormState>();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  Future<void> signUp() async {
    emit(const SingupState.loading());
    final result = await signUpUseCase.singupUser(
      singUpBody: SingUpBody(
          dialCode: '20',
          firstName: firstNameController.text,
          lastName: lastNameController.text,
          identity: 'man',
          phone: phoneController.text,
          type: "individual"),
    );
    result.when(
      data: (data) => emit(SingupState.success(signupEntity: data)),
      error: (error) =>
          emit(SingupState.failure(error: error.apiErrorModel.message!)),
    );
  }
}
