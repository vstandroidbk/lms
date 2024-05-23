import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:lms/providers/themeprovider/themeprovider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool? isLightTheme;
getTheme(context)async{
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  if(prefs.containsKey("isLigthTheme")){
    isLightTheme=prefs.getBool("isLigthTheme");
    log("gkthemeAlready=$isLightTheme");
    Provider.of<ThemeProvider>(context,listen: false).changeThemeMode(isLightTheme==true?ThemeMode.light : ThemeMode.dark);
  }else{

    await prefs.setBool('isLigthTheme', true);
    log("gkthemeSetDefault=$isLightTheme");
  }
}
// setThemePreference()async{
//   final SharedPreferences prefs = await SharedPreferences.getInstance();
//   await prefs.setBool('isLigthTheme', true);
// }

changeThemePreFerence(bool val)async{
  log("gkthemechange=$val");
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  isLightTheme=val==ThemeMode.light?true:false;
  await prefs.setBool('isLigthTheme', val);
}