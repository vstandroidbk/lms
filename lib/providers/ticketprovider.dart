import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class TicketProvider with ChangeNotifier{
  initCall(){
    image=null;
  }
  XFile? image;
  changeImage(XFile? images){
    image=images;
    notifyListeners();
  }

}