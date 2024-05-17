import 'package:json_annotation/json_annotation.dart';

part 'verify_body.g.dart';
@JsonSerializable()
class VerifyBody {
  String? phone;
  String? identity;
  @JsonKey(name: 'fcm_token')
  String? fcmToken;
  String? otp;

  VerifyBody({this.phone, this.identity, this.fcmToken, this.otp});

  factory VerifyBody.fromJson(Map<String, dynamic> json) =>
      _$VerifyBodyFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyBodyToJson(this);

 
}
