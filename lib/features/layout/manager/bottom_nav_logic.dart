import 'package:cinemax/features/favourites/presentation/view/favourites_view.dart';
import 'package:cinemax/features/home/presentation/view/home_view.dart';
import 'package:flutter/material.dart';




class BottomNavLogic extends ChangeNotifier {
  int currentIndex = 0;
  List<Widget> bottomScreen = [
    const HomeView(),
    const HomeView(),
    const FavouritesView(),
  ];

  void changeBottomScreen(index) {
    currentIndex = index;
    notifyListeners();
  }
}
