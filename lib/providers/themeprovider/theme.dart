

import 'package:flutter/material.dart';
import 'package:lms/utils/colors.dart';

lightTheme(){
  return ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple,),
    primaryColor: clrPrimary,
    textTheme: TextTheme(),
    useMaterial3: true,
    fontFamily: "Montserrat"
  );
}
darkTheme(){
  return ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    primaryColor: clrPrimary,
    textTheme: TextTheme(),
    useMaterial3: true,
    fontFamily: "Montserrat",
  );
}