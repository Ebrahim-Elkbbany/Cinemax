import 'package:cinemax/core/api_service/constant.dart';
import 'package:cinemax/core/helpers/responsive_spacing.dart';
import 'package:cinemax/core/theming/app_colors.dart';
import 'package:cinemax/core/theming/font_styles.dart';
import 'package:cinemax/core/theming/font_weight_helper.dart';
import 'package:cinemax/features/favourites/data/models/favourites_model.dart';
import 'package:cinemax/features/favourites/presentation/manager/favourites_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MoviesDetailsFirstSec extends StatelessWidget {
  const MoviesDetailsFirstSec({super.key,
    required this.isDarkTheme,
    required this.controller,
    required this.movieName, required this.description, required this.year, required this.rating, required this.image, required this.sorting});

  final bool isDarkTheme;
  final YoutubePlayerController controller;
  final String movieName;
  final String description;
  final String image;
  final String year;
  final String rating;
  final List<String> sorting;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        YoutubePlayer(
          controller: controller,
          showVideoProgressIndicator: true,
          progressIndicatorColor: AppColors.kPrimaryColor,
          progressColors: const ProgressBarColors(
            playedColor: AppColors.kPrimaryColor,
            handleColor: AppColors.kPrimaryColor,
          ),
        ),
        verticalSpacer(25),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery
                    .of(context)
                    .size
                    .width / 1.5,
                child: Text(
                  movieName,
                  style: FontStyles.font20WhiteBold.copyWith(
                    fontWeight: FontWeight.w600,
                    color: isDarkTheme ? null : AppColors.kBackGroundColor,
                  ),
                ),
              ),
              const Spacer(),
                   ChangeNotifierProvider(
                     create: (context) => FavouritesProvider()..getFavourite(),
                     child: Consumer<FavouritesProvider>(
                      builder: (BuildContext context, FavouritesProvider value,
                          Widget? child) {
                        return GestureDetector(
                          onTap: () {
                            context.read<FavouritesProvider>()
                                .insertFavourite(
                              favouritesModel: FavouritesModel(
                                title: movieName,
                                email: email,
                                year: year,
                                rating: rating,
                                image: image,
                                isFavourite: 'true',
                                sorting: sorting,
                              ),
                            );
                          },
                          child: Icon(
                            context.read<FavouritesProvider>().isFavoriteProduct(
                                movieName)
                                ? Icons.bookmark
                                : Icons.bookmark_outline,
                            color:
                            context.read<FavouritesProvider>().isFavoriteProduct(
                                movieName)
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
        verticalSpacer(5),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                year,
                style: FontStyles.font14GrayRegular.copyWith(
                  fontWeight: FontWeight.w600,
                  color: isDarkTheme
                      ? AppColors.kSecondaryColor
                      : AppColors.kBackGroundColor,
                ),
              ),
              verticalSpacer(10),
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
                    "$rating/10",
                    style: FontStyles.font14GrayRegular.copyWith(
                      fontWeight: FontWeightHelper.semiBold,
                    ),
                  ),
                  horizontalSpacer(5),
                ],
              ),
              verticalSpacer(15),
              SizedBox(
                  height: 25.h,
                  child: ListView.separated(
                    separatorBuilder: (context, index) =>
                        horizontalSpacer(5),
                    itemBuilder: (context, index) =>
                        Container(
                          height: 25.h,
                          width: 90.h,
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(
                              horizontal: 2.w, vertical: 2.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            color: AppColors.kPrimaryColor.withOpacity(
                              isDarkTheme ? 0.8 : 0.4,
                            ),
                          ),
                          child: Text(
                            'Action'.toUpperCase(),
                            style: FontStyles.font13GrayRegular.copyWith(
                              color: isDarkTheme
                                  ? AppColors.kSecondaryColor
                                  : AppColors.kBackGroundColor,
                            ),
                          ),
                        ),
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                  )),
              verticalSpacer(20),
              Text(
                'Description',
                style: FontStyles.font20WhiteBold.copyWith(
                  fontWeight: FontWeight.w600,
                  color: isDarkTheme ? null : AppColors.kBackGroundColor,
                ),
              ),
              verticalSpacer(5),
              Text(
                description,
                style: FontStyles.font14GrayRegular.copyWith(
                  fontWeight: FontWeightHelper.semiBold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
