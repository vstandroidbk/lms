

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ThemeProvider with ChangeNotifier{
  var currentTheme=ThemeMode.light;
  bool isLightTheme=true;
  changeThemeMode(val){
    currentTheme=val;
    if(val == ThemeMode.light){
      isLightTheme=true;
    }else{
      isLightTheme=false;
    }
    notifyListeners();
  }
}