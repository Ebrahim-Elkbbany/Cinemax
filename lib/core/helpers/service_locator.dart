import 'package:cinemax/core/api_service/api_service.dart';
import 'package:cinemax/features/home/data/repos/home_repo.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';


final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(
    ApiService(
      Dio(),
    ),
  );
  getIt.registerSingleton<HomeRepo>(
    HomeRepo(getIt.get<ApiService>()),
  );
}
