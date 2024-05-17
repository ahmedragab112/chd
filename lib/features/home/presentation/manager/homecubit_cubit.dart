import 'package:bloc/bloc.dart';
import 'package:chdtask/features/home/domain/usecases/home_usecase.dart';
import 'package:chdtask/features/home/presentation/manager/homecubit_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeUseCase homeUseCase;
  HomeCubit({required this.homeUseCase}) : super(const HomeState.initial());

  Future<void> getProduct() async {
    emit(const HomeState.loading());
    var data = await homeUseCase.getProduct();
    data.when(
      data: (data) => emit(HomeState.success(productEntity: data)),
      error: (errorHandler) =>
          emit(HomeState.failure(error: errorHandler.apiErrorModel.message!)),
    );
  }
}