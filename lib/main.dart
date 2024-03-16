import 'package:cinemax/core/helpers/cache_helper.dart';
import 'package:cinemax/core/routing/app_router.dart';
import 'package:cinemax/core/routing/routes.dart';
import 'package:cinemax/core/theming/app_theme.dart';
import 'package:cinemax/features/profile/presentation/manager/app_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'core/helpers/service_locator.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  await CacheHelper.init();
  setupServiceLocator();
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const CineMaxApp());
}

class CineMaxApp extends StatelessWidget {
  const CineMaxApp({super.key});


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder:(context, child) =>  ChangeNotifierProvider(
        create:(context) =>  AppThemeProvider(),
        builder:(context, child) {
          final themeProvider = Provider.of<AppThemeProvider>(context);
          return MaterialApp( debugShowCheckedModeBanner: false,
            initialRoute: Routes.initialRoutes,
            theme:  themeProvider.isDarkTheme ?darkTheme :lightTheme,
            onGenerateRoute: AppRouter().generateRoute,
          );
        }
      ),
    );
  }
}
