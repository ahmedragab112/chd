import 'package:chdtask/core/api/api_response.dart';
import 'package:chdtask/features/home/domain/entities/product_entity.dart';
import 'package:chdtask/features/home/domain/repositories/home_domain_repo.dart';

class HomeUseCase {
  final HomeDomainRepo homeDomainRepo;
  HomeUseCase({required this.homeDomainRepo});
  Future<ApiResponse<ProductEntity>> getProduct() async =>
      await homeDomainRepo.getProducts();
}
