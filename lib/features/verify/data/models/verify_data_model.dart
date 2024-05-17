import 'package:chdtask/features/verify/domain/entities/verify_entity.dart';

class VerifyDataModel extends VerifyEntity{
  int? status;
  VerifyDataModel(
      {super.message, super.accessToken, super.tokenType, this.status});

  VerifyDataModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['access_token'] = accessToken;
    data['token_type'] = tokenType;
    data['status'] = status;
    return data;
  }
}
