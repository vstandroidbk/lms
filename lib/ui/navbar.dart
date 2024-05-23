import 'package:flutter/material.dart';
import 'package:lms/providers/themeprovider/themeprovider.dart';
import 'package:lms/ui/homeui.dart';
import 'package:lms/ui/moreui.dart';
import 'package:lms/utils/colors.dart';
import 'package:provider/provider.dart';

import 'favouriteui.dart';
import 'courseuis/mycoursesui.dart';

class NavBar extends StatefulWidget {
  final int? indexCusto;
  const NavBar({super.key,this.indexCusto});
  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int currentUiInd=0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
      currentUiInd=widget.indexCusto??0;
  }
  List navUi=[HomeUi(),FavouriteUi(),MyCourseUi(),MoreUi()];
  @override
  Widget build(BuildContext context) {
    bool isThemeLight=Provider.of<ThemeProvider>(context,listen: false).isLightTheme;
    return Scaffold(
      body:navUi[currentUiInd],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex:currentUiInd ,
          unselectedItemColor:isThemeLight? clrBlack.withOpacity(0.6):clrWhite,
          unselectedLabelStyle: TextStyle(color: clrBlack.withOpacity(0.6)),
          selectedLabelStyle: TextStyle(color: clrSecondary),
            selectedItemColor: clrSecondary,
            onTap: (val){
            print("gk =val $val");
              setState(() {
                currentUiInd=val;
              });
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home_outlined),label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.category_outlined),label: "Categories"),
              BottomNavigationBarItem(icon: Icon(Icons.list_alt_sharp),label: "My Courses"),
              BottomNavigationBarItem(icon: Icon(Icons.read_more_outlined),label: "More"),
            ]),
    );

  }
}
