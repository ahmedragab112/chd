import 'package:chdtask/core/api/api_manger.dart';
import 'package:chdtask/core/api/dio_singleton.dart';
import 'package:chdtask/core/cache/cache_helper.dart';
import 'package:chdtask/features/login/data/datasources/login_remote_implementation.dart';
import 'package:chdtask/features/login/data/repositories/login_data_repo.dart';
import 'package:chdtask/features/login/domain/usecases/login_usecase.dart';
import 'package:chdtask/features/login/presentation/manager/login_cubit.dart';
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
}