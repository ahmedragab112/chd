
import 'package:chdtask/features/verify/data/models/verify_body.dart';
import 'package:chdtask/features/verify/data/models/verify_data_model.dart';

abstract class VerifyDataSource {

 Future<VerifyDataModel> verify({required VerifyBody verifyCodeBody});

}
