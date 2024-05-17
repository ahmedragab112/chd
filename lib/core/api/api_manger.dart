import 'package:chdtask/core/api/end_point.dart';
import 'package:chdtask/core/model/login_model.dart';
import 'package:chdtask/features/home/data/models/product_data_model.dart';
import 'package:chdtask/features/login/data/models/login_request_body.dart';
import 'package:chdtask/features/signup/data/models/signup_body.dart';
import 'package:chdtask/features/user/data/models/profile_data_model.dart';
import 'package:chdtask/features/verify/data/models/verify_body.dart';
import 'package:chdtask/features/verify/data/models/verify_data_model.dart';
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
  Future<OtpDataModel> signUp(@Body() SingUpBody singUpBody);
  @POST(EndPoint.verifyCodeEndPoint)
  Future<VerifyDataModel> verify(@Body() VerifyBody verifyCodeBody);
  @GET(EndPoint.homeEndPoint)
  Future<ProductDataModel> getProduct(
      {@Header('Authorization') required String token,
      @Header('X-DID') required String xDid});
  @GET(EndPoint.profile)
  Future<ProfileDataModel> userProfile(
      {@Header('Authorization') required String token,
      @Header('X-DID') required String xDid});
}
