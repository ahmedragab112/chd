import 'package:chdtask/features/verify/domain/entities/verify_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_state.freezed.dart';

@freezed
class VerifyState with _$VerifyState {
  const factory VerifyState.initial() = _Initial;
  const factory VerifyState.loading() = _Loading;
  const factory VerifyState.success({required VerifyEntity verifyEntity}) =
      _Success;
  const factory VerifyState.failure({required String error}) = _Failure;
}
