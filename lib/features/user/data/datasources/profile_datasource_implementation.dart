import 'package:chdtask/core/api/api_manger.dart';
import 'package:chdtask/core/cache/cache_helper.dart';
import 'package:chdtask/core/di/di.dart';
import 'package:chdtask/core/utils/strings/app_strings.dart';
import 'package:chdtask/features/user/data/datasources/profile_datasource.dart';
import 'package:chdtask/features/user/data/models/profile_data_model.dart';

class ProfileDataSourceImplementation implements ProfileDataSource {
  final ApiManager apiManager;

  const ProfileDataSourceImplementation({required this.apiManager});

  @override
  Future<ProfileDataModel> getProfile() async {
    return await apiManager.userProfile(
        token: locator<CacheHelper>().getString(AppStrings.cacheKeyUserToken),
        xDid: locator<CacheHelper>().getString(AppStrings.deviceIdentityKey));
  }
}
