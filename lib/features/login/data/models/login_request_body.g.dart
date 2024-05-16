// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginRequestBody _$LoginRequestBodyFromJson(Map<String, dynamic> json) =>
    LoginRequestBody(
      phone: json['phone'] as String?,
      dialCode: json['dialCode'] as String?,
      identity: json['identity'] as String?,
    );

Map<String, dynamic> _$LoginRequestBodyToJson(LoginRequestBody instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'dialCode': instance.dialCode,
      'identity': instance.identity,
    };
