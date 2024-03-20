import 'package:cinemax/core/helpers/responsive_spacing.dart';

import 'package:cinemax/core/widgets/custom_movies_list_item.dart';
import 'package:cinemax/core/widgets/custom_movies_list_shimmer_item.dart';
import 'package:cinemax/features/details/presentation/view/top_movies_details_view.dart';
import 'package:cinemax/features/favourites/presentation/manager/favourites_provider.dart';
import 'package:cinemax/features/home/data/models/movies_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SeeAllTopMoviesView extends StatelessWidget {
  const SeeAllTopMoviesView({
    super.key,
    required this.topMoviesList,
    required this.isLoading,
  });

  final List<MoviesModel> topMoviesList;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Series'),
      ),
      body: !isLoading
          ? ChangeNotifierProvider(
              create: (context) => FavouritesProvider()..getFavourite(),
              child: Consumer<FavouritesProvider>(
                builder: (context, value, child) {
                  return ListView.separated(
                    separatorBuilder: (context, index) => verticalSpacer(15),
                    padding: EdgeInsets.only(left: 10.w, top: 20.h),
                    itemCount: topMoviesList.length,
                    itemBuilder: (context, index) => CustomMoviesListItem(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TopMovieDetailsView(
                              title: topMoviesList[index].title,
                              id: topMoviesList[index].id,
                            ),
                          ),
                        );
                      },
                      imageUrl: topMoviesList[index].bigImage,
                      title: topMoviesList[index].title,
                      year: topMoviesList[index].year,
                      rating: topMoviesList[index].rating.toString(),
                      sorting: topMoviesList[index].genre,
                    ),
                  );
                },
              ),
            )
          : const CustomMoviesListShimmer(),
    );
  }
}
