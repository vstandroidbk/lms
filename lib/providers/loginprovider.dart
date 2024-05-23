import 'package:flutter/cupertino.dart';

class LoginProvider with ChangeNotifier{
    initClean(){
      creatPassVisible=false;
       confirmPassVisible=false;
      acceptCon=false;
      conPassVisible=false;
      oldPassVisible=false;
    }
    bool creatPassVisible=false;
    bool oldPassVisible=false;
    bool conPassVisible=false;
    bool? acceptCon=false;
    bool confirmPassVisible=false;
    changCreatPassVisible(bool val){
      creatPassVisible=val;
      notifyListeners();
    }
    changAccptCond(bool? val){
      acceptCon=val;
      notifyListeners();
    }
    changConfirmPassVisible(bool val){
      confirmPassVisible=val;
      notifyListeners();
    }
    changConPassVisible(bool val){
      conPassVisible=val;
      notifyListeners();
    }
    changOldPassVisible(bool val){
      oldPassVisible=val;
      notifyListeners();
    }

}