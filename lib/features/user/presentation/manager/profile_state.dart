import 'package:chdtask/features/user/domain/entities/profile_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_state.freezed.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = _Initial;
  const factory ProfileState.loading() = _Loading;
  const factory ProfileState.success({required ProfileEntity profileEntity}) =
      _Success;
  const factory ProfileState.failure({required String error}) = _Failure;
}
