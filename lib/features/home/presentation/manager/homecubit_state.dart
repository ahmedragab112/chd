import 'package:chdtask/features/home/domain/entities/product_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'homecubit_state.freezed.dart';


@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.loading() = _Loading;
  const factory HomeState.success({required ProductEntity productEntity}) = _Success;
  const factory HomeState.failure({required String error}) = _Failure;
}
