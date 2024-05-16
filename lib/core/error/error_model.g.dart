// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResponseModel _$ApiResponseModelFromJson(Map<String, dynamic> json) =>
    ApiResponseModel(
      statusMsg: json['statusMsg'] as String?,
      message: json['message'] as String?,
      errors: json['errors'] == null
          ? null
          : Errors.fromJson(json['errors'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ApiResponseModelToJson(ApiResponseModel instance) =>
    <String, dynamic>{
      'statusMsg': instance.statusMsg,
      'message': instance.message,
      'errors': instance.errors,
    };

Errors _$ErrorsFromJson(Map<String, dynamic> json) => Errors(
      value: json['value'] as String?,
      msg: json['msg'] as String?,
      param: json['param'] as String?,
      location: json['location'] as String?,
    );

Map<String, dynamic> _$ErrorsToJson(Errors instance) => <String, dynamic>{
      'value': instance.value,
      'msg': instance.msg,
      'param': instance.param,
      'location': instance.location,
    };
