import 'package:cinemax/core/helpers/responsive_spacing.dart';
import 'package:cinemax/core/helpers/service_locator.dart';
import 'package:cinemax/core/theming/font_styles.dart';
import 'package:cinemax/features/details/data/repos/details_repo.dart';
import 'package:cinemax/features/details/presentation/manager/details_provider.dart';
import 'package:cinemax/features/details/presentation/view/widgets/director_writer_sec.dart';
import 'package:cinemax/features/details/presentation/view/widgets/director_writer_shimmer_sec.dart';
import 'package:cinemax/features/details/presentation/view/widgets/movies_details_first_sec.dart';
import 'package:cinemax/features/details/presentation/view/widgets/movies_details_shimmer.dart';
import 'package:cinemax/features/profile/presentation/manager/app_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MostPopularMoviesDetailsView extends StatelessWidget {
  const MostPopularMoviesDetailsView({
    super.key,
    required this.id,
    required this.title,
  });

  final String id;
  final String title;

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Provider.of<AppThemeProvider>(context).isDarkTheme;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            title,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        body: ChangeNotifierProvider(
          create: (context) => DetailsProvider(getIt.get<DetailsRepo>())
            ..getMostPopularMovies(id: id),
          child: SingleChildScrollView(
            child: Consumer<DetailsProvider>(
              builder: (context, value, child) => value
                              .mostPopularMoviesModel !=
                          null &&
                      !value.mostPopularMoviesIsLoading
                  ? Column(
                      children: [
                        MoviesDetailsFirstSec(
                          sorting:  value.mostPopularMoviesModel!.genre,
                          isDarkTheme: isDarkTheme,
                          controller: YoutubePlayerController(
                              initialVideoId: YoutubePlayer.convertUrlToId(
                                  value.mostPopularMoviesModel!.trailer)!,
                              flags: const YoutubePlayerFlags(
                                autoPlay: false,
                              )),
                          movieName: value.mostPopularMoviesModel!.title,
                          description:
                              value.mostPopularMoviesModel!.description,
                          year: value.mostPopularMoviesModel!.year.toString(),
                          rating:
                              value.mostPopularMoviesModel!.rating.toString(),
                          image:
                              value.mostPopularMoviesModel!.bigImage.toString(),
                        ),
                        verticalSpacer(20),
                        DirectorWriterSec(
                            isDarkTheme: isDarkTheme,
                            writers: value.mostPopularMoviesModel!.writers,
                            director: value.mostPopularMoviesModel!.director)
                      ],
                    )
                  : value.mostPopularMoviesModel != null
                      ? SizedBox(
                          height: 300.h,
                          child: Text(
                            value.mostPopularMoviesError!,
                            style: FontStyles.font18whiteMedium.copyWith(
                              color: isDarkTheme
                                  ? null
                                  : Colors.black
                                      .withOpacity(0.20000000298023224),
                            ),
                          ))
                      : Column(
                          children: [
                            const MoviesDetailsFirstSecShimmer(),
                            verticalSpacer(20),
                            DirectorWriterShimmerSec(isDarkTheme: isDarkTheme),
                          ],
                        ),
            ),
          ),
        ));
  }
}
