import 'package:cinemax/core/helpers/cache_helper.dart';
import 'package:cinemax/core/theming/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppThemeProvider extends ChangeNotifier{
  bool isDarkTheme=CacheHelper.getData(key: 'isDarkTheme') ?? true;

  void changeTheme(){
    isDarkTheme = !isDarkTheme;
    CacheHelper.saveData(key: 'isDarkTheme', value: isDarkTheme);
    notifyListeners();
  }

  void getStatusBar(){
    isDarkTheme
        ? SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light
        .copyWith(statusBarColor: AppColors.kBackGroundColor))
        : SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.white));
  }

}