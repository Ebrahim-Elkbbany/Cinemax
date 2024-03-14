import 'package:cinemax/core/helpers/responsive_spacing.dart';
import 'package:cinemax/core/theming/app_colors.dart';
import 'package:cinemax/core/theming/font_styles.dart';
import 'package:cinemax/core/theming/font_weight_helper.dart';
import 'package:cinemax/core/widgets/custom_cached_network_image.dart';
import 'package:cinemax/core/widgets/custom_text_button.dart';
import 'package:cinemax/features/home/presentation/manager/home_provider.dart';
import 'package:cinemax/features/home/presentation/view/see_all_most_popular_movies_view.dart';
import 'package:cinemax/features/home/presentation/view/widgets/most_popular_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class MostPopularMoviesSec extends StatelessWidget {
  const MostPopularMoviesSec({
    super.key,
    required this.isDarkTheme,
  });

  final bool isDarkTheme;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<HomeProvider>(context);
    return Padding(
      padding: EdgeInsets.only(left: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Most Popular',
                style: FontStyles.font20WhiteBold.copyWith(
                  fontWeight: FontWeight.w600,
                  color: isDarkTheme ? null : AppColors.kBackGroundColor,
                ),
              ),
              const Spacer(),
              CustomTextButton(
                text: 'See more',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SeeAllMostPopularMoviesView(
                                mostPopularMoviesList:
                                    provider.mostPopularMoviesList,
                                isLoading: provider.mostPopularMoviesIsLoading,
                              )));
                },
              ),
              horizontalSpacer(20),
            ],
          ),
          verticalSpacer(16),
          SizedBox(
            height: 300.h,
            child: provider.mostPopularMoviesList.isNotEmpty &&
                    !provider.mostPopularMoviesIsLoading
                ? ListView.separated(
                    itemCount: 5,
                    separatorBuilder: (context, index) => horizontalSpacer(20),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => SizedBox(
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
                                  imageUrl: provider
                                      .mostPopularMoviesList[index].bigImage,
                                  height: 200.h,
                                  width: 150.w,
                                ),
                                // Positioned(
                                //     top: 10.h,
                                //     right: 10.w,
                                //     child: Consumer<FavouritesProvider>(
                                //       builder: (BuildContext context, FavouritesProvider value, Widget? child) {
                                //         return GestureDetector(
                                //           onTap: () {
                                //             context.read<FavouritesProvider>()
                                //                 .insertFavourite(
                                //               favouritesModel: FavouritesModel(
                                //                   title: title,
                                //                   email: email,
                                //                   year: year,
                                //                   timeline: timeline,
                                //                   rating: rating,
                                //                   image: image,
                                //                   isFavourite: 'true'
                                //               ),
                                //             );
                                //           },
                                //           child: Icon(
                                //             context.read<FavouritesProvider>().isFavoriteProduct(title)
                                //                 ? Icons.bookmark
                                //                 : Icons.bookmark_outline,
                                //             color:
                                //             // context.read<FavouritesProvider>().isFavoriteProduct(title)
                                //             //     ? AppColors.kPrimaryColor
                                //             //     : null,
                                //           ),
                                //         );
                                //       },
                                //     )),
                              ],
                            ),
                          ),
                          verticalSpacer(12),
                          Text(
                            provider.mostPopularMoviesList[index].title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: FontStyles.font16whiteMedium.copyWith(
                              color: isDarkTheme
                                  ? null
                                  : AppColors.kBackGroundColor,
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
                                "${provider.mostPopularMoviesList[index].rating}/10",
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
                  )
                : Center(
                    child: provider.mostPopularMoviesError != null
                        ? Text(
                            provider.topMoviesError!,
                            style: FontStyles.font18whiteMedium.copyWith(
                              color: isDarkTheme
                                  ? null
                                  : Colors.black
                                      .withOpacity(0.20000000298023224),
                            ),
                          )
                        : const MostPopularShimmer(),
                  ),
          ),
        ],
      ),
    );
  }
}
