import 'package:flutter/material.dart';


class AppRouter {
  Route generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    //final arguments = settings.arguments;

    switch (settings.name) {
      // case Routes.onBoardingView:
      //   return MaterialPageRoute(
      //     builder: (context) => const OnboardingView(),
      //   );
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
