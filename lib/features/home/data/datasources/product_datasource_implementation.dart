import 'package:chdtask/core/api/api_manger.dart';
import 'package:chdtask/core/cache/cache_helper.dart';
import 'package:chdtask/core/di/di.dart';
import 'package:chdtask/core/utils/strings/app_strings.dart';
import 'package:chdtask/features/home/data/datasources/home_datasource.dart';
import 'package:chdtask/features/home/data/models/product_data_model.dart';

class HomeDataSourceImplementation implements HomeDataSource {
  final ApiManager apiManager;
  HomeDataSourceImplementation({required this.apiManager});
  @override
  Future<ProductDataModel> product() async {
    return await apiManager.getProduct(
        token: locator<CacheHelper>().getString(AppStrings.cacheKeyUserToken),
        xDid: locator<CacheHelper>().getString(AppStrings.deviceIdentityKey));
  }
}
