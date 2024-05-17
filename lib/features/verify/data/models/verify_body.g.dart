// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyBody _$VerifyBodyFromJson(Map<String, dynamic> json) => VerifyBody(
      phone: json['phone'] as String?,
      identity: json['identity'] as String?,
      fcmToken: json['fcm_token'] as String?,
      otp: json['otp'] as String?,
    );

Map<String, dynamic> _$VerifyBodyToJson(VerifyBody instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'identity': instance.identity,
      'fcm_token': instance.fcmToken,
      'otp': instance.otp,
    };
