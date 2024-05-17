import 'package:chdtask/core/api/api_manger.dart';
import 'package:chdtask/core/api/dio_singleton.dart';
import 'package:chdtask/core/cache/cache_helper.dart';
import 'package:chdtask/features/home/data/datasources/product_datasource_implementation.dart';
import 'package:chdtask/features/home/data/repositories/home_data_repo.dart';
import 'package:chdtask/features/home/domain/usecases/home_usecase.dart';
import 'package:chdtask/features/home/presentation/manager/homecubit_cubit.dart';
import 'package:chdtask/features/login/data/datasources/login_remote_implementation.dart';
import 'package:chdtask/features/login/data/repositories/login_data_repo.dart';
import 'package:chdtask/features/login/domain/usecases/login_usecase.dart';
import 'package:chdtask/features/login/presentation/manager/login_cubit.dart';
import 'package:chdtask/features/signup/data/datasources/signup_datasoucre_implementation.dart';
import 'package:chdtask/features/signup/data/repositories/signup_data_repo.dart';
import 'package:chdtask/features/signup/domain/usecases/signup_usecase.dart';
import 'package:chdtask/features/signup/presentation/manager/singup_cubit.dart';
import 'package:chdtask/features/user/data/datasources/profile_datasource_implementation.dart';
import 'package:chdtask/features/user/data/repositories/profile_datarepo.dart';
import 'package:chdtask/features/user/domain/usecases/profile_usecase.dart';
import 'package:chdtask/features/user/presentation/manager/profile_cubit.dart';
import 'package:chdtask/features/verify/data/datasources/verify_datasoucre_implementation.dart';
import 'package:chdtask/features/verify/data/repositories/verify_data_repo.dart';
import 'package:chdtask/features/verify/domain/usecases/verify_usecase.dart';
import 'package:chdtask/features/verify/presentation/manager/verify_cubit.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator
      .registerLazySingleton<ApiManager>(() => ApiManager(DioFactory.getDio()));
  locator.registerLazySingleton(() =>
      LoginRemoteDataSoucreImplementation(apiManager: locator<ApiManager>()));

  locator.registerLazySingleton<CacheHelper>(() => CacheHelper());

  locator.registerLazySingleton(() => LoginDataRepo(
        loginRemoteDataSouce: locator<LoginRemoteDataSoucreImplementation>(),
      ));

  locator.registerLazySingleton<LoginUseCase>(() => LoginUseCase(
        loginDomainRepo: locator<LoginDataRepo>(),
      ));
  locator.registerFactory<LoginCubit>(
      () => LoginCubit(loginUseCase: locator<LoginUseCase>()));

  locator.registerLazySingleton(() => SignUpDataSoucreImplementation(
      apiManager: ApiManager(DioFactory.getDio())));

  locator.registerLazySingleton(() => SignUpDataRepo(
        singUpRemoteDataSource: locator<SignUpDataSoucreImplementation>(),
      ));

  locator.registerLazySingleton(() => SignUpUseCase(
        signUpDomainRepo: locator<SignUpDataRepo>(),
      ));

  locator.registerFactory(() => SingupCubit(
        signUpUseCase: locator<SignUpUseCase>(),
      ));
      locator.registerLazySingleton(() => VerifyDatasourceImplementation(
      apiManager: ApiManager(DioFactory.getDio())));

  locator.registerLazySingleton(() => VerifyDataRepo(
        dataSource: locator<VerifyDatasourceImplementation>(),
      ));

  locator.registerLazySingleton(() => VerifyUseCase(
        verifyDomainRepo: locator<VerifyDataRepo>(),
      ));

  locator.registerFactory(() => VerifyCubit(
        verifyUseCase: locator<VerifyUseCase>(),
      ));

        locator.registerLazySingleton(() => HomeDataSourceImplementation(
     apiManager:   ApiManager(DioFactory.getDio())));

  locator.registerLazySingleton(() => HomeDataRepo(
        dataSource: locator<HomeDataSourceImplementation>(),
      ));

  locator.registerLazySingleton(() => HomeUseCase(
        homeDomainRepo: locator<HomeDataRepo>(),
      ));

  locator.registerFactory(() => HomeCubit(
        homeUseCase: locator<HomeUseCase>(),
      ));
           locator.registerLazySingleton(() => ProfileDataSourceImplementation(
     apiManager:   ApiManager(DioFactory.getDio())));

  locator.registerLazySingleton(() => ProfileDataRepo(
        profileDataSource: locator<ProfileDataSourceImplementation>(),
      ));

  locator.registerLazySingleton(() => ProfileUseCase(
        profileDomainRepo: locator<ProfileDataRepo>(),
      ));

  locator.registerFactory(() => ProfileCubit(
        profileUseCase: locator<ProfileUseCase>(),
      ));
}
