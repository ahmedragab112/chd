import 'package:chdtask/core/api/api_manger.dart';
import 'package:chdtask/core/model/login_model.dart';
import 'package:chdtask/features/signup/data/datasources/signup_datasource.dart';
import 'package:chdtask/features/signup/data/models/signup_body.dart';

class SignUpDataSoucreImplementation implements SignUpDataSource {
  ApiManager apiManager;
  SignUpDataSoucreImplementation({required this.apiManager});
  @override
  Future<OtpDataModel> singupUser({required SingUpBody singUpBody}) async =>
      await apiManager.signUp(singUpBody);
}
