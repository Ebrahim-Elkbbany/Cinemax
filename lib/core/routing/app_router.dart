import 'package:cinemax/core/helpers/cache_helper.dart';
import 'package:cinemax/core/routing/routes.dart';
import 'package:cinemax/features/auth/presentation/manager/login_provider.dart';
import 'package:cinemax/features/auth/presentation/manager/register_provider.dart';
import 'package:cinemax/features/auth/presentation/view/login_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../features/auth/presentation/view/register_view.dart';
import '../../features/onboarding/presenattion/view/onboarding_view.dart';


class AppRouter {
  dynamic onBoarding = CacheHelper.getData(key: 'onboarding');
  dynamic token = CacheHelper.getData(key: 'token');
  Route generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    //final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.initialRoutes:
        return MaterialPageRoute(builder:(context) =>  onBoarding == null ? OnboardingView() :(
            token == null ? ChangeNotifierProvider(
              create: (context) => LoginProvider(),
              child: const LoginView(),
            ) : ChangeNotifierProvider(
              create: (context) => RegisterProvider(),
              child: const ResisterView(),
            )
        ));
      case Routes.onBoardingView:
        return MaterialPageRoute(
          builder: (context) => const OnboardingView(),
        );
      case Routes.loginView:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
            create: (context) => LoginProvider(),
            child: const LoginView(),
          ),
        );
      case Routes.registerView:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
            create: (context) => RegisterProvider(),
            child: const ResisterView(),
          ),
        );
      // case Routes.homeView:
      //   return MaterialPageRoute(
      //     builder: (context) => ChangeNotifierProvider(
      //       create: (context) => HomeProvider(getIt.get<HomeRepo>())..getMostPopularMovies()..getLatestMovies(),
      //       child: const HomeView(),
      //     ),
      //   );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
