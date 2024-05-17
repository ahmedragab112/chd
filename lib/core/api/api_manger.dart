import 'package:chdtask/core/api/end_point.dart';
import 'package:chdtask/core/model/login_model.dart';
import 'package:chdtask/features/login/data/models/login_request_body.dart';
import 'package:chdtask/features/signup/data/models/signup_body.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'api_manger.g.dart';

@RestApi(baseUrl: ApiConstant.baseUrl)
abstract class ApiManager {
  factory ApiManager(Dio dio, {String baseUrl}) = _ApiManager;

  @POST(EndPoint.loginEndPoint)
  Future<OtpDataModel> login(@Body() LoginRequestBody loginRequestBody);
  @POST(EndPoint.signUpEndPoint)
  Future<OtpDataModel> signUp(@Body()SingUpBody singUpBody );
}
