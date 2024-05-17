import 'package:chdtask/core/entities/login_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'singup_state.freezed.dart';

@freezed
class SingupState with _$SingupState {
  const factory SingupState.initial() = _Initial;
  const factory SingupState.loading() = _Loading;
  const factory SingupState.success({required OtpEntity signupEntity}) =
      _Success;
  const factory SingupState.failure({required String error}) = _Failure;
}
