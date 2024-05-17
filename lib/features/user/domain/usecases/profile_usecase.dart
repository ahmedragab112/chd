import 'package:chdtask/core/api/api_response.dart';
import 'package:chdtask/features/user/domain/entities/profile_entity.dart';
import 'package:chdtask/features/user/domain/repositories/profile_domainrepo.dart';

class ProfileUseCase {
  final ProfileDomainRepo profileDomainRepo;

  const ProfileUseCase({required this.profileDomainRepo});

  Future<ApiResponse<ProfileEntity>> getProfile() async =>
      await profileDomainRepo.getProfile();
}
