import 'package:chdtask/core/api/api_response.dart';
import 'package:chdtask/features/login/data/models/login_request_body.dart';
import 'package:chdtask/features/login/domain/entities/login_entity.dart';
import 'package:chdtask/features/login/domain/repositories/login_domain.dart';

class LoginUseCase {
  LoginDomainRepo loginDomainRepo;

  LoginUseCase({required this.loginDomainRepo});
  Future<ApiResponse<LoginEntity>> login(
      {required LoginRequestBody loginData}) async {
    return await loginDomainRepo.login(loginData: loginData);
  }
}
