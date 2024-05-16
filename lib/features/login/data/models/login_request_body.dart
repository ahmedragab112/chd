import 'package:json_annotation/json_annotation.dart';
part 'login_request_body.g.dart';

@JsonSerializable()
class LoginRequestBody {
  String? phone;
  String? dialCode;
  String? identity;

  LoginRequestBody({this.phone, this.dialCode, this.identity});

  factory LoginRequestBody.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRequestBodyToJson(this);
}
