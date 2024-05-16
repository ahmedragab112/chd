import 'package:json_annotation/json_annotation.dart';
part 'error_model.g.dart';

@JsonSerializable()
class ApiResponseModel {
  final String? statusMsg;
  final String? message;
  final Errors? errors;
  const ApiResponseModel({this.statusMsg, this.message, this.errors});
  factory ApiResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ApiResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApiResponseModelToJson(this);
}

@JsonSerializable()
class Errors {
  final String? value;
  final String? msg;
  final String? param;
  final String? location;

  const Errors({this.value, this.msg, this.param, this.location});

  factory Errors.fromJson(Map<String, dynamic> json) => _$ErrorsFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorsToJson(this);
}
