import 'package:bloc/bloc.dart';
import 'package:chdtask/features/verify/data/models/verify_body.dart';
import 'package:chdtask/features/verify/domain/usecases/verify_usecase.dart';
import 'package:chdtask/features/verify/presentation/manager/verify_state.dart';

class VerifyCubit extends Cubit<VerifyState> {
  VerifyUseCase verifyUseCase;
  VerifyCubit({required this.verifyUseCase})
      : super(const VerifyState.initial());

  Future<void> verify() async {
    emit(const VerifyState.loading());
    final result = await verifyUseCase.verify(
        verifyBody: VerifyBody(
      fcmToken: '',
      identity: '',
      otp: '',
      phone: '',
    ));
    result.when(
        data: (data) => emit(VerifyState.success(verifyEntity: data)),
        error: (error) =>
            emit(VerifyState.failure(error: error.apiErrorModel.message!)));
  }
}
