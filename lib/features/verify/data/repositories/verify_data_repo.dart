import 'package:chdtask/core/api/api_response.dart';
import 'package:chdtask/core/error/error_handler.dart';
import 'package:chdtask/features/verify/data/datasources/verify_datasoucre.dart';
import 'package:chdtask/features/verify/data/models/verify_body.dart';
import 'package:chdtask/features/verify/domain/entities/verify_entity.dart';
import 'package:chdtask/features/verify/domain/repositories/verify_domain_repo.dart';

class VerifyDataRepo implements VerifyDomainRepo {
  VerifyDataSource dataSource;
  VerifyDataRepo({required this.dataSource});
  @override
  Future<ApiResponse<VerifyEntity>> verify(
      {required VerifyBody verifyBody}) async {
    try {
      var data = await dataSource.verify(verifyCodeBody: verifyBody);
      return ApiResponse.data(data);
    } catch (e) {
      return ApiResponse.error(errorHandler: ErrorHandler.handle(e));
    }
  }
}
