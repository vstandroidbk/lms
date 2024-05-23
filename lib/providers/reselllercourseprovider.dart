import 'package:flutter/cupertino.dart';

class RecellerCourseProvider with ChangeNotifier{
  initClean(){
    searchedSelectedList=[];
  searchedList=[];
  }
  List<Map>? searchedList=[];
  List<Map?>? searchedSelectedList=[];


  List<Map>? data=[
    {
      'name':"gk",
      "id":1,
      "checked":false
    },
    {
      'name':"pk",
      "id":2,
      "checked":false
    },
    {
      'name':"ak",
      "id":3,
      "checked":false
    },
    {
      'name':"lk",
      "id":4,
      "checked":false
    },
    {
      'name':"aak",
      "id":5,
      "checked":false
    }
  ];
  resetSeleList(){
    searchedList=data;
    searchedSelectedList=[];
  }
  addToSelected(String? index){
    int datalen=this.data?.length??0;
    for(int i=0; i < datalen ;i++){
      // print("for name=${data![i]['name']}");
      if (data![i]['id']
          .toString()==index) {
        if(data?[i]['checked']==true){
          data?[i]['checked']=false;
        }else{
          data?[i]['checked']=true;
        }
      }
    }

    notifyListeners();
  }
  onChnageSearch(val){
    searchedList=[];
print("data: = ${this.data}");
   int datalen=this.data?.length??0;
    print("calling $datalen $val $data");
   for(int i=0; i < datalen ;i++){
     // print("for name=${data![i]['name']}");
     if (data![i]['name']
         .toString()
         .startsWith(
         "${val}")) {
       print("if in");
       searchedList?.add(data![i]);
       print("gk searchedList $searchedList");
     }
   }
    notifyListeners();
  }
}