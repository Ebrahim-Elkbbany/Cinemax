import 'package:cinemax/core/helpers/responsive_spacing.dart';
import 'package:cinemax/features/favourites/presentation/manager/favourites_provider.dart';
import 'package:cinemax/features/home/presentation/view/widgets/image_page_view_sec.dart';
import 'package:cinemax/features/home/presentation/view/widgets/most_popular_movies_sec.dart';
import 'package:cinemax/features/home/presentation/view/widgets/top_movies_list_view.dart';
import 'package:cinemax/features/onboarding/presenattion/manager/app_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Provider.of<AppThemeProvider>(context).isDarkTheme;
    Provider.of<FavouritesProvider>(context, listen: true).getFavourite();
    Provider.of<AppThemeProvider>(context).getStatusBar();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ImagePageViewSec(isDarkTheme: isDarkTheme),
              MostPopularMoviesSec(isDarkTheme: isDarkTheme,),
              verticalSpacer(15),
              TopMoviesListView(isDarkTheme: isDarkTheme),
            ],
          ),
        ),
      ),
    );
  }
}
