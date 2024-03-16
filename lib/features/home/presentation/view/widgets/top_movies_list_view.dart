import 'package:cinemax/core/helpers/responsive_spacing.dart';
import 'package:cinemax/core/theming/font_styles.dart';
import 'package:cinemax/core/widgets/custom_movies_list_item.dart';
import 'package:cinemax/core/widgets/custom_movies_list_shimmer_item.dart';
import 'package:cinemax/core/widgets/custom_text_button.dart';
import 'package:cinemax/features/details/presentation/view/top_movies_details_view.dart';
import 'package:cinemax/features/home/presentation/manager/home_provider.dart';
import 'package:cinemax/features/home/presentation/view/see_all_top_movies_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../../core/theming/app_colors.dart';

class TopMoviesListView extends StatelessWidget {
  const TopMoviesListView({super.key, required this.isDarkTheme});

  final bool isDarkTheme;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<HomeProvider>(context);
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            horizontalSpacer(20),
            Text(
              'Top Movies',
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
                        builder: (context) => SeeAllTopMoviesView(
                              isLoading: provider.topMoviesIsLoading,
                              topMoviesList: provider.topMoviesList,
                            )));
              },
            ),
            horizontalSpacer(20),
          ],
        ),
        verticalSpacer(16),
        provider.topMoviesList.isNotEmpty && !provider.topMoviesIsLoading
            ? ListView.separated(
                separatorBuilder: (context, index) => verticalSpacer(10),
                itemBuilder: (context, index) => CustomMoviesListItem(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TopMovieDetailsView(
                          title:  provider.topMoviesList[index].title,
                          id: provider.topMoviesList[index].id,
                        ),
                      ),
                    );
                  },
                  imageUrl: provider.topMoviesList[index].bigImage,
                  title: provider.topMoviesList[index].title,
                  year: provider.topMoviesList[index].year,
                  rating: provider.topMoviesList[index].rating.toString(),
                  sorting: provider.topMoviesList[index].genre,
                ),
                itemCount: 5,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.only(left: 20),
              )
            : provider.topMoviesError != null
                ? Padding(
                  padding: const EdgeInsets.all(20),
                  child: SizedBox(
                      height: 300.h,
                      child: Center(
                        child: Text(
                          provider.topMoviesError!,
                          style: FontStyles.font18whiteMedium.copyWith(
                            color: isDarkTheme
                                ? null
                                : Colors.black.withOpacity(0.20000000298023224),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                )
                : const CustomMoviesListShimmer(),
      ],
    );
  }
}
