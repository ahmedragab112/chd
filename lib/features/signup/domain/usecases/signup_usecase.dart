import 'package:chdtask/core/api/api_response.dart';
import 'package:chdtask/core/entities/login_entity.dart';
import 'package:chdtask/features/signup/data/models/signup_body.dart';
import 'package:chdtask/features/signup/domain/repositories/signup_domain_repo.dart';

class SignUpUseCase{

  final SignUpDomainRepo signUpDomainRepo;

  SignUpUseCase({required this.signUpDomainRepo});

  Future<ApiResponse<OtpEntity>> singupUser({required SingUpBody singUpBody}) async => await signUpDomainRepo.singupUser(singUpBody: singUpBody);
}