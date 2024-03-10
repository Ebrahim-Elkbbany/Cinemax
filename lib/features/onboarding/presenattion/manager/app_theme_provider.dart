import 'package:flutter/material.dart';

class AppThemeProvider extends ChangeNotifier{
  bool isDarkTheme= true;

  void changeTheme(){
    isDarkTheme = !isDarkTheme;
    notifyListeners();
  }

}