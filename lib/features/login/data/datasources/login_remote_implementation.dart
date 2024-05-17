import 'package:chdtask/core/api/api_manger.dart';
import 'package:chdtask/features/login/data/datasources/login_remote_datasource.dart';
import 'package:chdtask/core/model/login_model.dart';
import 'package:chdtask/features/login/data/models/login_request_body.dart';

class LoginRemoteDataSoucreImplementation implements LoginRemoteDataSouce {
  final ApiManager apiManager;

  const LoginRemoteDataSoucreImplementation({required this.apiManager});
  @override
  Future<OtpDataModel> login({required LoginRequestBody loginData}) async =>
      await apiManager.login(loginData);
}
