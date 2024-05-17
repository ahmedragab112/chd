import 'package:chdtask/core/model/login_model.dart';
import 'package:chdtask/features/login/data/models/login_request_body.dart';

abstract class LoginRemoteDataSouce {
  Future<OtpDataModel> login({required LoginRequestBody loginData});
}
