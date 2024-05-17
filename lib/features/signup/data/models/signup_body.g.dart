// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SingUpBody _$SingUpBodyFromJson(Map<String, dynamic> json) => SingUpBody(
      dialCode: json['dial_code'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      identity: json['identity'] as String?,
      phone: json['phone'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$SingUpBodyToJson(SingUpBody instance) =>
    <String, dynamic>{
      'dial_code': instance.dialCode,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'identity': instance.identity,
      'phone': instance.phone,
      'type': instance.type,
    };
