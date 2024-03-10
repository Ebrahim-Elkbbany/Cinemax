import 'package:cinemax/core/theming/app_colors.dart';
import 'package:cinemax/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';







ThemeData darkTheme = ThemeData.dark().copyWith(
  appBarTheme: AppBarTheme(
      backgroundColor: AppColors.kBackGroundColor,
      titleTextStyle: FontStyles.font22WhiteBold,
      centerTitle: true
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedIconTheme: IconThemeData(size: 24.w),
    unselectedIconTheme: IconThemeData(size: 24.w),
    showSelectedLabels: false,
    showUnselectedLabels: false,
    type: BottomNavigationBarType.fixed,
    backgroundColor: AppColors.kBackGroundColor,
    selectedItemColor: AppColors.kPrimaryColor,
    elevation: 0,
    unselectedItemColor: Colors.white,
  ),
  scaffoldBackgroundColor: AppColors.kBackGroundColor,
);




