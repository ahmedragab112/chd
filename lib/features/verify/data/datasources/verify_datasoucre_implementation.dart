import 'package:chdtask/core/api/api_manger.dart';
import 'package:chdtask/features/verify/data/datasources/verify_datasoucre.dart';
import 'package:chdtask/features/verify/data/models/verify_body.dart';
import 'package:chdtask/features/verify/data/models/verify_data_model.dart';

class VerifyDatasourceImplementation implements VerifyDataSource {
  ApiManager apiManager;
  VerifyDatasourceImplementation({required this.apiManager});
  @override
  Future<VerifyDataModel> verify({required VerifyBody verifyCodeBody}) async => await apiManager.verify(verifyCodeBody);
}
