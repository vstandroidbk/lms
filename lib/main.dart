import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lms/providers/courseprovider.dart';
import 'package:lms/providers/loginprovider.dart';
import 'package:lms/providers/profileprovider.dart';
import 'package:lms/providers/quizwwprovider.dart';
import 'package:lms/providers/reselllercourseprovider.dart';
import 'package:lms/providers/themeprovider/theme.dart';
import 'package:lms/providers/themeprovider/themeprovider.dart';
import 'package:lms/providers/ticketprovider.dart';
import 'package:lms/ui/onbording/splashui.dart';
import 'package:lms/utils/colors.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_)=>RecellerCourseProvider()),
      ChangeNotifierProvider(create: (_)=>LoginProvider()),
      ChangeNotifierProvider(create: (_)=>ProfileProvider()),
      ChangeNotifierProvider(create: (_)=>QuizzeProvider()),
      ChangeNotifierProvider(create: (_)=>CourseProvider()),
      ChangeNotifierProvider(create: (_)=>ThemeProvider()),
      ChangeNotifierProvider(create: (_)=>TicketProvider()),
    ],
    child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    // ThemeMode themeMode= Provider.of<ThemeProvider>(context).currentTheme;
    return Consumer<ThemeProvider>(builder: (context,themeProvider,child){
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        themeMode: themeProvider.currentTheme,
        darkTheme: ThemeData.dark(),
        // theme:

        theme:themeProvider.currentTheme==ThemeMode.light?lightTheme():
        darkTheme()
        // ThemeData(
        //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        //   primaryColor: clrPink,
        //   useMaterial3: true,
        // ),
        ,
        home: const SplashUi(),
      );
    });
  }
}
