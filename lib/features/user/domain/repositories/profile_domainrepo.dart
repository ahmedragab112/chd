import 'package:chdtask/core/api/api_response.dart';
import 'package:chdtask/features/user/domain/entities/profile_entity.dart';

abstract class ProfileDomainRepo {

  Future<ApiResponse<ProfileEntity>> getProfile();
}
