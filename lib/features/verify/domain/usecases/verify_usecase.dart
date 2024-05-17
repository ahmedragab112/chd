import 'package:chdtask/core/api/api_response.dart';
import 'package:chdtask/features/verify/data/models/verify_body.dart';
import 'package:chdtask/features/verify/domain/entities/verify_entity.dart';
import 'package:chdtask/features/verify/domain/repositories/verify_domain_repo.dart';

class VerifyUseCase {
  VerifyDomainRepo verifyDomainRepo;

  VerifyUseCase({required this.verifyDomainRepo});

  Future<ApiResponse<VerifyEntity>> verify(
      {required VerifyBody verifyBody}) async => await verifyDomainRepo.verify(verifyBody: verifyBody);
}
