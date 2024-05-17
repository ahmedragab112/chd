import 'package:json_annotation/json_annotation.dart';

part 'signup_body.g.dart';

@JsonSerializable()
class SingUpBody {
  @JsonKey(name: 'dial_code')
  String? dialCode;
  @JsonKey(name: 'first_name')
  String? firstName;
  @JsonKey(name: 'last_name')
  String? lastName;
  String? identity;
  String? phone;
  String? type;

  SingUpBody(
      {this.dialCode,
      this.firstName,
      this.lastName,
      this.identity,
      this.phone,
      this.type});

  factory SingUpBody.fromJson(Map<String, dynamic> json) =>
      _$SingUpBodyFromJson(json);

  Map<String, dynamic> toJson() => _$SingUpBodyToJson(this);
}
