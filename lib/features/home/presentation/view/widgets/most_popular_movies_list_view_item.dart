import 'package:cinemax/core/api_service/constant.dart';
import 'package:cinemax/core/helpers/responsive_spacing.dart';
import 'package:cinemax/core/theming/app_colors.dart';
import 'package:cinemax/core/theming/font_styles.dart';
import 'package:cinemax/core/theming/font_weight_helper.dart';
import 'package:cinemax/core/widgets/custom_cached_network_image.dart';
import 'package:cinemax/features/details/presentation/view/most_popular_movies_details_view.dart';
import 'package:cinemax/features/favourites/data/models/favourites_model.dart';
import 'package:cinemax/features/favourites/presentation/manager/favourites_provider.dart';
import 'package:cinemax/features/home/data/models/most_popular_movies_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class MostPopularMoviesListViewItem extends StatelessWidget {
  const MostPopularMoviesListViewItem(
      {super.key,
      required this.mostPopularMoviesList,
      required this.index,
      required this.isDarkTheme});

  final List<MostPopularMoviesModel> mostPopularMoviesList;
  final int index;
  final bool isDarkTheme;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MostPopularMoviesDetailsView(
              id: mostPopularMoviesList[index].id,
              title: mostPopularMoviesList[index].title,
            ),
          ),
        );
      },
      child: SizedBox(
        width: 140.w,
        height: 150.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: Stack(
                children: [
                  CustomCachedNetworkImage(
                    imageUrl: mostPopularMoviesList[index].bigImage,
                    height: 200.h,
                    width: 150.w,
                  ),
                  Positioned(
                    top: 10.h,
                    right: 10.w,
                    child: Consumer<FavouritesProvider>(
                      builder: (BuildContext context, FavouritesProvider value,
                          Widget? child) {
                        return GestureDetector(
                          onTap: () {
                            context.read<FavouritesProvider>().insertFavourite(
                                  favouritesModel: FavouritesModel(
                                    title: mostPopularMoviesList[index].title,
                                    email: email,
                                    year: mostPopularMoviesList[index]
                                        .year
                                        .toString(),
                                    rating: mostPopularMoviesList[index].rating,
                                    image: mostPopularMoviesList[index].image,
                                    isFavourite: 'true',
                                    sorting: mostPopularMoviesList[index].genre,
                                  ),
                                );
                          },
                          child: Icon(
                            context
                                    .read<FavouritesProvider>()
                                    .isFavoriteProduct(
                                        mostPopularMoviesList[index].title)
                                ? Icons.bookmark
                                : Icons.bookmark_outline,
                            color: context
                                    .read<FavouritesProvider>()
                                    .isFavoriteProduct(
                                        mostPopularMoviesList[index].title)
                                ? AppColors.kPrimaryColor
                                : null,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            verticalSpacer(12),
            Text(
              mostPopularMoviesList[index].title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: FontStyles.font16whiteMedium.copyWith(
                color: isDarkTheme ? null : AppColors.kBackGroundColor,
              ),
            ),
            verticalSpacer(5),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.star,
                  color: AppColors.kPrimaryColor,
                  size: 18.w,
                ),
                horizontalSpacer(5),
                Text(
                  "${mostPopularMoviesList[index].rating}/10",
                  style: FontStyles.font14GrayRegular.copyWith(
                    fontWeight: FontWeightHelper.medium,
                  ),
                ),
                horizontalSpacer(5),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
