

import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';
@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.loading() = _Loading;
  const factory LoginState.success() = _Success;
  const factory LoginState.failure({required String error}) = _Failure;
  const factory LoginState.changeObsuerText() = _ObscureText;
}
