import 'package:freezed_annotation/freezed_annotation.dart';
part 'homecubit_state.freezed.dart';


@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = Initial;
  const factory HomeState.loading() = Loading;
  const factory HomeState.success() = Success;
  const factory HomeState.failure({required String error}) = Failure;
  const factory HomeState.changeSliderIndex() = ChangeSliderIndex;
}
