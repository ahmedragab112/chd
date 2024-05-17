import 'package:chdtask/features/home/data/models/product_data_model.dart';

abstract class HomeDataSource {
  Future<ProductDataModel> product();
}
