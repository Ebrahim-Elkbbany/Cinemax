import 'package:cinemax/features/favourites/presentation/view/favourites_view.dart';
import 'package:cinemax/features/home/presentation/view/home_view.dart';
import 'package:cinemax/features/profile/presentation/views/profile_view.dart';
import 'package:cinemax/features/search/presentation/view/search_view.dart';
import 'package:flutter/material.dart';

class BottomNavLogic extends ChangeNotifier {
  int currentIndex = 0;
  List<Widget> bottomScreen = [
    const HomeView(),
    const SearchView(),
    const FavouritesView(),
    const ProfileView()
  ];

  void changeBottomScreen(index) {
    currentIndex = index;
    notifyListeners();
  }
}
