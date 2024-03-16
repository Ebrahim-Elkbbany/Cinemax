import 'dart:convert';

import 'package:cinemax/core/helpers/responsive_spacing.dart';
import 'package:cinemax/core/theming/app_colors.dart';
import 'package:cinemax/core/theming/font_styles.dart';
import 'package:cinemax/core/widgets/custom_movies_list_item.dart';
import 'package:cinemax/features/favourites/presentation/manager/favourites_provider.dart';
import 'package:cinemax/features/profile/presentation/manager/app_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:provider/provider.dart';

class FavouritesView extends StatelessWidget {
  const FavouritesView({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<FavouritesProvider>(context, listen: true).getFavourite();
    bool isDarkTheme = Provider.of<AppThemeProvider>(context).isDarkTheme;
    var provider = context.read<FavouritesProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourites'),
      ),
      body: (provider.favouritesList == null ||
              provider.favouritesList?.isEmpty == true)
          ? Center(
              child: Text(
                'No favorite products yet',
                style: FontStyles.font20WhiteBold.copyWith(
                    color: isDarkTheme ? null : AppColors.kBackGroundColor),
              ),
            )
          : ListView.separated(
              padding: EdgeInsets.only(left: 15.w, top: 10.h, bottom: 10.h),
              itemBuilder: (context, index) => SizedBox(
                height: 230.h,
                width: MediaQuery.of(context).size.width,
                child: CustomMoviesListItem(
                  imageUrl: provider.favouritesList![index]["image"].toString(),
                  title: provider.favouritesList![index]["title"].toString(),
                  rating: provider.favouritesList![index]["rating"].toString(),
                  year: provider.favouritesList![index]["year"].toString(),
                  sorting: List<String>.from(
                    jsonDecode(
                      provider.favouritesList![index]["sorting"].toString(),
                    ),
                  ),
                ),
              ),
              separatorBuilder: (context, index) => verticalSpacer(20),
              itemCount:
                  context.watch<FavouritesProvider>().favouritesList!.length,
            ),
    );
  }
}
