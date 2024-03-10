import 'package:get_it/get_it.dart';


final getIt = GetIt.instance;

void setupServiceLocator() {
  // getIt.registerSingleton<ApiService>(
  //   ApiService(
  //     Dio(),
  //   ),
  // );
  // getIt.registerSingleton<HomeRepo>(
  //   HomeRepo(getIt.get<ApiService>()),
  // );
}
