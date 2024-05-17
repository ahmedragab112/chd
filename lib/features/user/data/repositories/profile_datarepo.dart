import 'package:chdtask/core/api/api_response.dart';
import 'package:chdtask/core/error/error_handler.dart';
import 'package:chdtask/features/user/data/datasources/profile_datasource.dart';
import 'package:chdtask/features/user/domain/entities/profile_entity.dart';
import 'package:chdtask/features/user/domain/repositories/profile_domainrepo.dart';

class ProfileDataRepo implements ProfileDomainRepo {
  final ProfileDataSource profileDataSource;

  const ProfileDataRepo({required this.profileDataSource});

  @override
  Future<ApiResponse<ProfileEntity>> getProfile() async {
    try {
      var data = await profileDataSource.getProfile();
      return ApiResponse.data(data);
    } catch (e) {
      return ApiResponse.error(errorHandler: ErrorHandler.handle(e));
    }
  }
}
