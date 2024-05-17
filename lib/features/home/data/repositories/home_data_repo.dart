import 'package:chdtask/core/api/api_response.dart';
import 'package:chdtask/core/error/error_handler.dart';
import 'package:chdtask/features/home/data/datasources/home_datasource.dart';
import 'package:chdtask/features/home/domain/entities/product_entity.dart';
import 'package:chdtask/features/home/domain/repositories/home_domain_repo.dart';

class HomeDataRepo implements HomeDomainRepo {
  HomeDataSource dataSource;
  HomeDataRepo({required this.dataSource});
  @override
  Future<ApiResponse<ProductEntity>> getProducts() async {
    try {
      var data = await dataSource.product();
      return ApiResponse.data(data);
    } catch (e) {
      return ApiResponse.error(errorHandler: ErrorHandler.handle(e));
    }
  }
}
