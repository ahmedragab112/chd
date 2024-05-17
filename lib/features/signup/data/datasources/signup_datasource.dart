import 'package:chdtask/core/model/login_model.dart';
import 'package:chdtask/features/signup/data/models/signup_body.dart';

abstract class SignUpDataSource {
 
 Future<OtpDataModel>singupUser({required SingUpBody singUpBody});
}