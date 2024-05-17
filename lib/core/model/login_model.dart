import 'package:chdtask/core/entities/login_entity.dart';

class OtpDataModel extends OtpEntity {
  String? message;
  int? status;

  OtpDataModel({this.message, this.status, super.otp});

  OtpDataModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    otp = json['otp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['status'] = status;
    data['otp'] = otp;
    return data;
  }
}
