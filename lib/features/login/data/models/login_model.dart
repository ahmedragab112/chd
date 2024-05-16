import 'package:chdtask/features/login/domain/entities/login_entity.dart';

class LoginModel extends LoginEntity{
  String? message;
  int? status;
  

  LoginModel({this.message, this.status, super.otp});

  LoginModel.fromJson(Map<String, dynamic> json) {
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
