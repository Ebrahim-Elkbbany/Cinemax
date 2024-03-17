import 'package:cinemax/core/api_service/constant.dart';
import 'package:cinemax/core/helpers/responsive_spacing.dart';
import 'package:cinemax/core/theming/app_colors.dart';
import 'package:cinemax/core/theming/font_styles.dart';
import 'package:cinemax/core/widgets/custom_button.dart';
import 'package:cinemax/core/widgets/custom_cached_network_image.dart';
import 'package:cinemax/features/details/presentation/view/top_movies_details_view.dart';
import 'package:cinemax/features/favourites/data/models/favourites_model.dart';
import 'package:cinemax/features/favourites/presentation/manager/favourites_provider.dart';
import 'package:cinemax/features/home/presentation/manager/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImagePageViewSec extends StatelessWidget {
  const ImagePageViewSec({super.key, required this.isDarkTheme});
  final bool isDarkTheme;

  @override
  Widget build(BuildContext context) {
    var provider= Provider.of<HomeProvider>(context);
    PageController? pageController = PageController();
    return  SizedBox(
      height: 500.h,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          if(!provider.topMoviesIsLoading)SizedBox(
            height: 500.h,
            child: PageView.builder(
              itemCount: 5  ,
              controller: pageController,
              itemBuilder: (context, index) {
                provider.index= index;
               return CustomCachedNetworkImage(
                  imageUrl: provider.topMoviesList.isNotEmpty ?provider.topMoviesList[index].bigImage :"0",
                  width: double.infinity,
                  height: 500.h,
                );
              }

            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 60,
              decoration: BoxDecoration(
                color: isDarkTheme
                    ? AppColors.kBackGroundColor
                    : AppColors.kSecondaryColor,
              ),
            ),
          ),
          Positioned(
            bottom: 50,
            right: 0,
            left: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 110,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: const Alignment(0.00, -1.00),
                  end: const Alignment(0, 1),
                  colors: isDarkTheme
                      ? [
                    Colors.black.withOpacity(0),
                    Colors.black.withOpacity(0.5),
                    Colors.black.withOpacity(0.800000011920929),
                    Colors.black
                  ]
                      : [
                    Colors.white.withOpacity(0),
                    Colors.white.withOpacity(0.5),
                    Colors.white.withOpacity(0.800000011920929),
                    Colors.white
                  ],
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CustomButton(
                    onPressed: () {
                      context.read<FavouritesProvider>()
                          .insertFavourite(
                        favouritesModel: FavouritesModel(
                          title: provider.topMoviesList[provider.index].title,
                          email: email,
                          year: provider.topMoviesList[provider.index].year,
                          rating: provider.topMoviesList[provider.index].rating.toString(),
                          image: provider.topMoviesList[provider.index].bigImage,
                          isFavourite: 'true',
                          sorting: provider.topMoviesList[provider.index].genre,
                        ),
                      );
                    },
                    color: const Color(0xFF333333),
                    buttonName: '+  Wishlist',
                    width: 155.w,
                    height: 48.h,
                    radius: 8,
                    style: FontStyles.font15WhiteMedium
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  const Spacer(),
                  CustomButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                TopMovieDetailsView(
                                  id: provider.topMoviesList[provider.index].id,
                                  title: provider.topMoviesList[provider.index].title,
                                )),
                      );
                    },
                    buttonName: 'Details',
                    width: 155.w,
                    height: 48.h,
                    radius: 8,
                    style: FontStyles.font15WhiteMedium.copyWith(
                      fontWeight: FontWeight.w600,
                      color: isDarkTheme
                          ? const Color(0xFF333333)
                          : AppColors.kSecondaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 110.h,
            child:  Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    'My list',
                    style: FontStyles.font16whiteMedium.copyWith(
                        color: isDarkTheme ? null : AppColors.kBackGroundColor
                    )
                ),
                horizontalSpacer(36.h),
                Text(
                    'Discover',
                    style: FontStyles.font16whiteMedium.copyWith(
                        color: isDarkTheme ? null : AppColors.kBackGroundColor
                    )
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20.h,
            right: 0,
            left: 0,
            child: Center(
              child: SmoothPageIndicator(
                count: 5,
                effect: const WormEffect(
                  dotColor: Colors.grey,
                  dotHeight: 6,
                  dotWidth: 6,
                  spacing: 8,
                  activeDotColor: AppColors.kPrimaryColor,
                ),
                controller: pageController,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
