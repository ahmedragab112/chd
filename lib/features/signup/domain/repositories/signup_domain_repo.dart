import 'package:chdtask/core/api/api_response.dart';
import 'package:chdtask/core/entities/login_entity.dart';
import 'package:chdtask/features/signup/data/models/signup_body.dart';

abstract class SignUpDomainRepo {
  Future<ApiResponse<OtpEntity>> singupUser({required SingUpBody singUpBody});
}
