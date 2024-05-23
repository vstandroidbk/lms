import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class ProfileProvider with ChangeNotifier{
  initClean(){
    selectedImage=null;
  }
  XFile? selectedImage;
  changeProImage(XFile? image){
    selectedImage=image;
    notifyListeners();
  }


}