import 'package:cinemax/core/helpers/cache_helper.dart';
import 'package:cinemax/core/helpers/service_locator.dart';
import 'package:cinemax/core/routing/routes.dart';
import 'package:cinemax/features/auth/presentation/manager/login_provider.dart';
import 'package:cinemax/features/auth/presentation/manager/register_provider.dart';
import 'package:cinemax/features/auth/presentation/view/login_view.dart';
import 'package:cinemax/features/favourites/presentation/manager/favourites_provider.dart';
import 'package:cinemax/features/favourites/presentation/view/favourites_view.dart';
import 'package:cinemax/features/home/data/repos/home_repo.dart';
import 'package:cinemax/features/home/presentation/manager/home_provider.dart';
import 'package:cinemax/features/layout/layout_view.dart';
import 'package:cinemax/features/profile/presentation/manager/account_editing_provider.dart';
import 'package:cinemax/features/profile/presentation/views/account_view.dart';
import 'package:cinemax/features/profile/presentation/views/language_view.dart';
import 'package:cinemax/features/profile/presentation/views/them_view.dart';
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
        return MaterialPageRoute(
            builder: (context) => onBoarding == null
                ? const OnboardingView()
                : (token == null
                    ? ChangeNotifierProvider(
                        create: (context) => LoginProvider(),
                        child: const LoginView(),
                      )
                    : const LayoutView()));
      case Routes.onBoardingView:
        return MaterialPageRoute(
          builder: (context) => const OnboardingView(),
        );
      case Routes.favoritesView:
        return MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider(
              create: (context) => FavouritesProvider()..getFavourite(),
              child: const FavouritesView()),
        );
      case Routes.layoutView:
        return MaterialPageRoute(
          builder: (context) => const LayoutView(),
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
      case Routes.homeView:
        return MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider(
            create: (context) => HomeProvider(
              getIt.get<HomeRepo>(),
            )
              ..getTopMovies()
              ..getMostPopularMovies(),
          ),
        );
      case Routes.languageView:
        return MaterialPageRoute(
          builder: (context) => const LanguageView(),
        );
      case Routes.accountEditingView:
        return MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider<AccountEditingProvider>(
            create: (context) => AccountEditingProvider()..getUserData(),
            child: const AccountEditingView(),
          ),
        );
      case Routes.themeView:
        return MaterialPageRoute(
          builder: (context) => const ThemeView(),
        );
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
