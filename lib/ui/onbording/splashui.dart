import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lms/ui/onbording/loginui.dart';
import 'package:lms/utils/colors.dart';
import 'package:lms/utils/sharepreference.dart';
import 'package:provider/provider.dart';

import '../../providers/themeprovider/themeprovider.dart';

class SplashUi extends StatefulWidget {
  const SplashUi({super.key});

  @override
  State<SplashUi> createState() => _SplashUiState();
}

class _SplashUiState extends State<SplashUi> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTheme(context);
    Future.delayed(Duration(seconds: 2),(){
      Navigator.push(context, CupertinoPageRoute(builder: (context){
        return LoginUi();
      }));
    });
  }
  @override
  Widget build(BuildContext context) {
    bool isLightTheme=Provider.of<ThemeProvider>(context,listen: false).isLightTheme;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          // gradient: LinearGradient(colors: [clrBlack,clrPrimary],begin: Alignment.topCenter,end: Alignment.bottomCenter)
          color: clrPrimary
        ),
        child: Center(
          child: Image.asset(height: 50,"assets/images/logo.png"),
        ),
      ),
    );
  }
}
