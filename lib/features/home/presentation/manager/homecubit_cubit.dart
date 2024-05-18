import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:chdtask/features/home/domain/entities/product_entity.dart';
import 'package:chdtask/features/home/domain/usecases/home_usecase.dart';
import 'package:chdtask/features/home/presentation/manager/homecubit_state.dart';

class HomeCubit extends Cubit<HomeState> {
  ProductEntity? productEntity;
  HomeUseCase homeUseCase;
  HomeCubit({required this.homeUseCase}) : super(const HomeState.initial());
  int activeIndex = 0;

  Future<void> getProduct() async {
    emit(const HomeState.loading());
    var data = await homeUseCase.getProduct();
    data.when(
      data: (data) {
        productEntity = data;
        emit(const HomeState.success());
      },
      error: (errorHandler) {
        log(errorHandler.apiErrorModel.message!);
        emit(HomeState.failure(error: errorHandler.apiErrorModel.message!));
      },
    );
  }
  void changeSliderIndex(int index) {
    emit(const HomeState.initial());
    activeIndex = index;
    emit(const HomeState.changeSliderIndex());
  }
}
