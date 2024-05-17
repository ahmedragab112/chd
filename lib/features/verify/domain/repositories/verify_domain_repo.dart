import 'package:chdtask/core/api/api_response.dart';
import 'package:chdtask/features/verify/data/models/verify_body.dart';
import 'package:chdtask/features/verify/domain/entities/verify_entity.dart';

abstract class VerifyDomainRepo {
  Future<ApiResponse<VerifyEntity>> verify({required VerifyBody verifyBody});
}
