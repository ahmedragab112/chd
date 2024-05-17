import 'package:chdtask/core/api/api_response.dart';
import 'package:chdtask/core/entities/login_entity.dart';
import 'package:chdtask/core/error/error_handler.dart';
import 'package:chdtask/features/signup/data/datasources/signup_datasource.dart';
import 'package:chdtask/features/signup/data/models/signup_body.dart';
import 'package:chdtask/features/signup/domain/repositories/signup_domain_repo.dart';

class SignUpDataRepo implements SignUpDomainRepo {
  final SignUpDataSource singUpRemoteDataSource;

  SignUpDataRepo({required this.singUpRemoteDataSource});
  @override
  Future<ApiResponse<OtpEntity>> singupUser({required SingUpBody singUpBody}) async{
    try {
      var data = await singUpRemoteDataSource.singupUser(singUpBody: singUpBody);
      return ApiResponse.data(data);
    } catch (e) {
      return ApiResponse.error(errorHandler: ErrorHandler.handle(e));
    }
  }
}
