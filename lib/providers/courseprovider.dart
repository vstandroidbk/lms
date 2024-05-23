import 'package:flutter/cupertino.dart';

class CourseProvider with ChangeNotifier{
  initClean(){
    clicked=null;
  }
 int? clicked;
  changeClicked(int val){
    clicked=val;
    notifyListeners();
  }

}