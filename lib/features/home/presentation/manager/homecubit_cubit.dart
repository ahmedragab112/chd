import 'package:bloc/bloc.dart';
import 'package:chdtask/features/home/domain/entities/product_entity.dart';
import 'package:chdtask/features/home/domain/usecases/home_usecase.dart';
import 'package:chdtask/features/home/presentation/manager/homecubit_state.dart';

class HomeCubit extends Cubit<HomeState> {
  ProductEntity? productEntity;
  HomeUseCase homeUseCase;
  HomeCubit({required this.homeUseCase}) : super(const HomeState.initial());

  Future<void> getProduct() async {
    emit(const HomeState.loading());
    var data = await homeUseCase.getProduct();
    data.when(
      data: (data) {
        productEntity = data;
        emit(const HomeState.success());
      },
      error: (errorHandler) =>
          emit(HomeState.failure(error: errorHandler.apiErrorModel.message!)),
    );
  }
}
