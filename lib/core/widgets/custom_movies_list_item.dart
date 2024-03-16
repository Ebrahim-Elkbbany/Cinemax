import 'package:cinemax/core/api_service/constant.dart';
import 'package:cinemax/core/helpers/responsive_spacing.dart';
import 'package:cinemax/core/theming/app_colors.dart';
import 'package:cinemax/core/theming/font_styles.dart';
import 'package:cinemax/core/theming/font_weight_helper.dart';
import 'package:cinemax/core/widgets/custom_cached_network_image.dart';
import 'package:cinemax/features/favourites/data/models/favourites_model.dart';
import 'package:cinemax/features/favourites/presentation/manager/favourites_provider.dart';
import 'package:cinemax/features/profile/presentation/manager/app_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CustomMoviesListItem extends StatelessWidget {
  const CustomMoviesListItem(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.rating,
      required this.sorting,
      required this.year, this.onTap});

  final String imageUrl;
  final String title;
  final String rating;
  final String year;
  final List<String> sorting;
  final void Function()? onTap;


  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Provider.of<AppThemeProvider>(context).isDarkTheme;
    return GestureDetector(
     onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: Stack(
              children: [
                CustomCachedNetworkImage(
                  imageUrl: imageUrl,
                  width: 150.w,
                  height: 200.h,
                ),
                Positioned(
                    top: 10.h,
                    right: 10.w,
                    child: Consumer<FavouritesProvider>(
                      builder: (BuildContext context, FavouritesProvider value, Widget? child) {
                        return GestureDetector(
                          onTap: () {
                            context.read<FavouritesProvider>()
                                .insertFavourite(
                              favouritesModel: FavouritesModel(
                                  title: title,
                                  email: email,
                                  year: year,
                                  rating: rating,
                                  image: imageUrl,
                                  isFavourite: 'true',
                                  sorting: sorting,
                              ),
                            );
                          },
                          child: Icon(
                            context.read<FavouritesProvider>().isFavoriteProduct(title)
                                ? Icons.bookmark
                                : Icons.bookmark_outline,
                            color:
                            context.read<FavouritesProvider>().isFavoriteProduct(title)
                                ? AppColors.kPrimaryColor
                                : null,
                          ),
                        );
                      },
                    )),
              ],
            ),
          ),
          horizontalSpacer(15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: Text(
                  title,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: FontStyles.font16whiteMedium.copyWith(
                    color: isDarkTheme ? null : AppColors.kBackGroundColor,
                  ),
                ),
              ),
              verticalSpacer(5),
              Text(
                '($year)',
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
                      fontWeight: FontWeightHelper.medium,
                    ),
                  ),
                  horizontalSpacer(5),
                ],
              ),
              verticalSpacer(10),
              SizedBox(
                  height: 25.h,
                  width: MediaQuery.of(context).size.width / 2,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => horizontalSpacer(5),
                    itemBuilder: (context, index) => Container(
                      height: 25.h,
                      width: 90.h,
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: 2.w,vertical: 2.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: AppColors.kPrimaryColor.withOpacity(
                          isDarkTheme ? 0.8 : 0.4,
                        ),
                      ),
                      child: Text(
                        sorting[index],
                        style: FontStyles.font13GrayRegular.copyWith(
                          color: isDarkTheme
                              ? AppColors.kSecondaryColor
                              : AppColors.kBackGroundColor,
                        ),
                      ),
                    ),
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: sorting.isEmpty ? 0:sorting.length > 1 ? 2 : 1,
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
