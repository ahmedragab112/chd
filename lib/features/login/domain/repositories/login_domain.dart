import 'package:chdtask/core/api/api_response.dart';
import 'package:chdtask/features/login/data/models/login_request_body.dart';
import 'package:chdtask/core/entities/login_entity.dart';

abstract class LoginDomainRepo {
  Future<ApiResponse<OtpEntity>> login({required LoginRequestBody loginData});
}
