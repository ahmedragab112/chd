import 'package:chdtask/core/api/api_response.dart';
import 'package:chdtask/core/error/error_handler.dart';
import 'package:chdtask/features/login/data/datasources/login_remote_datasource.dart';
import 'package:chdtask/features/login/data/models/login_request_body.dart';
import 'package:chdtask/features/login/domain/entities/login_entity.dart';
import 'package:chdtask/features/login/domain/repositories/login_domain.dart';

class LoginDataRepo implements LoginDomainRepo {
  final LoginRemoteDataSouce loginRemoteDataSouce;

  LoginDataRepo({required this.loginRemoteDataSouce});
  @override
  Future<ApiResponse<LoginEntity>> login(
      {required LoginRequestBody loginData}) async {
    try {
      var data = await loginRemoteDataSouce.login(loginData: loginData);
      return ApiResponse.data(data);
    } catch (e) {
      return ApiResponse.error(errorHandler: ErrorHandler.handle(e));
    }
  }
}
