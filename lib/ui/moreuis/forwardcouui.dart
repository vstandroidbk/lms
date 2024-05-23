import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lms/ui/components/custoappbar.dart';
import 'package:lms/ui/components/custoelevatbut.dart';
import 'package:lms/ui/moreuis/addticketui.dart';
import 'package:lms/utils/colors.dart';
import 'package:provider/provider.dart';

import '../../providers/themeprovider/themeprovider.dart';

class ForwardCourseListUi extends StatefulWidget {
  const ForwardCourseListUi({super.key});

  @override
  State<ForwardCourseListUi> createState() => _ForwardCourseListUiState();
}

class _ForwardCourseListUiState extends State<ForwardCourseListUi> {
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
              child: Center(child: Text("Forwarded Courses",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18,color: clrWhite),)),

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
                      margin: EdgeInsets.only(bottom: 10,right: 5,left: 5),
                      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                      decoration: BoxDecoration(
                        color:isLightTheme? clrWhite:clrBlack,
                        boxShadow: [BoxShadow(color: clrBlack.withOpacity(0.2),blurRadius: 4)],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("9T-J877eX-JOND"),
                              // Container(
                              //   padding: EdgeInsets.symmetric(horizontal: 10,vertical: 3),
                              //   decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: clrSecondary),
                              //   child: Text("Open",style: TextStyle(color: clrWhite),),
                              // ),
                            ],
                          ),

                          Text("Course Name"),
                          Text("Lucky"),
                          Text("16 May 2024 08:34	",style: TextStyle(color: clrSecondary),)
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
