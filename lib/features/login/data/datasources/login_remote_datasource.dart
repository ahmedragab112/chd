import 'package:chdtask/features/login/data/models/login_model.dart';
import 'package:chdtask/features/login/data/models/login_request_body.dart';


abstract class LoginRemoteDataSouce {
  Future<LoginModel> login({required LoginRequestBody loginData});
}
