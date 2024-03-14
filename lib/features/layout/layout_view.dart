import 'package:cinemax/core/helpers/service_locator.dart';
import 'package:cinemax/features/home/data/repos/home_repo.dart';
import 'package:cinemax/features/home/presentation/manager/home_provider.dart';
import 'package:cinemax/features/layout/manager/bottom_nav_logic.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class LayoutView extends StatelessWidget {
  const LayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BottomNavLogic()),
        ChangeNotifierProvider(
          create: (context) => HomeProvider(
            getIt.get<HomeRepo>(),
          )
            ..getTopMovies()
            ..getMostPopularMovies(),
        ),
      ],
      child: Consumer<BottomNavLogic>(
        builder: (context, bottomNavLogic, child) {
          return Scaffold(
            body: bottomNavLogic.bottomScreen[bottomNavLogic.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: bottomNavLogic.currentIndex,
              onTap: (index) {
                bottomNavLogic.changeBottomScreen(index);
              },
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home_filled,
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.search_sharp,
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.bookmark,
                    ),
                    label: ''),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person,
                  ),
                  label: '',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
