import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lms/ui/components/custoappbar.dart';
import 'package:lms/ui/components/custoelevatbut.dart';
import 'package:lms/ui/components/textareaui.dart';
import 'package:lms/ui/moreuis/addticketui.dart';
import 'package:lms/utils/colors.dart';
import 'package:provider/provider.dart';

import '../../providers/reselllercourseprovider.dart';
import '../../providers/themeprovider/themeprovider.dart';

class ResellerCourseList extends StatefulWidget {
  const ResellerCourseList({super.key});

  @override
  State<ResellerCourseList> createState() => _ResellerCourseListState();
}

class _ResellerCourseListState extends State<ResellerCourseList> {
  TextEditingController inputController=TextEditingController();
  var selectedValue;
  Map u={
    "name":"gk",
    "val":"1"
  };
  @override
  Widget build(BuildContext context) {
    bool isLightTheme=Provider.of<ThemeProvider>(context,listen: false).isLightTheme;
    return Scaffold(
      appBar: custoAppBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 9),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 15),
              decoration: BoxDecoration(
                  color: clrSecondary,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Center(child: Text("Reseller Course",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18,color: clrWhite),)),
            ),
            SizedBox(
              height: 20,
            ),
            // Text("Support Ticket")
            Expanded(
              child: ListView.builder(itemCount: 13,shrinkWrap: true,
                  // physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context,index){
                    return Container(
                      margin: EdgeInsets.only(bottom: 10,right: 5,left: 5,top: 2),
                      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                      decoration: BoxDecoration(
                        color:isLightTheme? clrWhite:clrBlack,
                        boxShadow: [BoxShadow(color: clrBlack.withOpacity(0.2),blurRadius: 4)],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("#OD2405ON10043"),
                                Text("scorm"),
                                Text("Designing Course"),
                                Text("16 May 2024 08:34	",style: TextStyle(color: clrSecondary),)
                              ],
                            ),
                          ),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text("Purchased Qty :01"),
                                Text("Remaining Qty :01"),
                                SizedBox(
                                  height: 5,
                                ),
                                SizedBox(
                                  height: 30,
                                  child: CustoElevatButton(
                                    textWidget: Text("Forward"),
                                    onTap: ()async{
                                      inputController.clear();
                                      showDialog(context: context, builder: (context){
                                        Provider.of<RecellerCourseProvider>(context,listen: false).resetSeleList();
                                        return  AlertDialog(
                                          title: Text("Forward",style: TextStyle(fontSize: 16),),
                                          content: SizedBox(
                                            // height: 200 ,
                                            width: double.maxFinite,
                                            child: Consumer<RecellerCourseProvider>(builder: (context,recellerCourseProvider,child){

                                              int len= recellerCourseProvider.searchedList?.length??0;
                                              return Column(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  SizedBox(
                                                    height: 15,
                                                  ),
                                                  SizedBox(
                                                    height: 45,
                                                    child: TextFormField(controller: inputController,onChanged: (val){
                                                      recellerCourseProvider.onChnageSearch(val);
                                                    },),
                                                  ),
                                                  Visibility(
                                                    visible:true,
                                                    child: Container(
                                                      margin: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                                                      height: 200,
                                                      child:len ==0 ? Center(child: Text("No Data Found"),) : ListView.builder(shrinkWrap: true,itemCount: recellerCourseProvider.searchedList?.length??0,itemBuilder: (context,index){
                                                        print("listing gl============");
                                                        Map? data=recellerCourseProvider.searchedList?[index];

                                                        return  Row(
                                                          children: [
                                                            Checkbox(value: data?['checked']??false, onChanged: (val){
                                                              print("clicked");
                                                              recellerCourseProvider.addToSelected(data?['id'].toString());
                                                            }),
                                                            Text("${data?['name']??''}",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15),),
                                                          ],
                                                        ) ;
                                                      }) ,
                                                    ),
                                                  ),

                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  Divider(),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                    children: [
                                                      CustoElevatButton(textWidget: Text("Close"),onTap: (){
                                                        Navigator.pop(context);
                                                      },),
                                                      Flexible(child: SizedBox(width: 10,)),
                                                      CustoElevatButton(textWidget: Text("Forward Course"),onTap: (){
                                                        Navigator.pop(context);
                                                      },),
                                                    ],
                                                  )

                                                ],
                                              ) ;
                                            }),
                                          ),
                                        );
                                      });
                                    },
                                  ),
                                ),

                              ],
                            ),
                          )
                        ],
                      ),
                    ) ;
                  }),
            )
          ],
        ),
      ),
    );
  }
}
