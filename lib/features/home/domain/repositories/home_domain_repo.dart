import 'package:chdtask/core/api/api_response.dart';
import 'package:chdtask/features/home/domain/entities/product_entity.dart';

abstract class HomeDomainRepo {
  Future<ApiResponse<ProductEntity>> getProducts();
}
