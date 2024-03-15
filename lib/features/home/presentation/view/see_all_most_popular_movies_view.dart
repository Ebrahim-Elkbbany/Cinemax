import 'package:cinemax/core/helpers/responsive_spacing.dart';
import 'package:cinemax/core/widgets/custom_movies_list_item.dart';
import 'package:cinemax/core/widgets/custom_movies_list_shimmer_item.dart';
import 'package:cinemax/features/details/presentation/view/most_popular_movies_details_view.dart';
import 'package:cinemax/features/favourites/presentation/manager/favourites_provider.dart';
import 'package:cinemax/features/home/data/models/most_popular_movies_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SeeAllMostPopularMoviesView extends StatelessWidget {
  const SeeAllMostPopularMoviesView({
    super.key,
    required this.mostPopularMoviesList,
    required this.isLoading,
  });

  final List<MostPopularMoviesModel> mostPopularMoviesList;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Most Popular Movies'),
      ),
      body: !isLoading
          ? ChangeNotifierProvider(
              create: (context) => FavouritesProvider()..getFavourite(),
              child: Consumer<FavouritesProvider>(
                builder: (context, value, child) {
                  return ListView.separated(
                    separatorBuilder: (context, index) => verticalSpacer(15),
                    padding: EdgeInsets.only(left: 10.w, top: 20.h),
                    itemCount: mostPopularMoviesList.length,
                    itemBuilder: (context, index) => CustomMoviesListItem(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MostPopularMoviesDetailsView(
                                id: mostPopularMoviesList[index].id,
                                title: mostPopularMoviesList[index].title,
                              )),
                        );
                      },
                      imageUrl: mostPopularMoviesList[index].bigImage,
                      title: mostPopularMoviesList[index].title,
                      year: mostPopularMoviesList[index].year.toString(),
                      rating: mostPopularMoviesList[index].rating.toString(),
                      sorting: mostPopularMoviesList[index].genre,
                    ),
                  );
                },
              ),
            )
          : const CustomMoviesListShimmer(),
    );
  }
}
