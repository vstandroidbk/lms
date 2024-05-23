import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lms/ui/components/custoappbar.dart';
import 'package:lms/ui/components/custoelevatbut.dart';
import 'package:lms/ui/moreuis/addticketui.dart';
import 'package:lms/utils/colors.dart';
import 'package:provider/provider.dart';

import '../../providers/themeprovider/themeprovider.dart';

class SupportTicketUi extends StatefulWidget {
  const SupportTicketUi({super.key});

  @override
  State<SupportTicketUi> createState() => _SupportTicketUiState();
}

class _SupportTicketUiState extends State<SupportTicketUi> {
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(child: SizedBox(width: MediaQuery.of(context).size.width*0.2,)),

                  Text("Support Ticket",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18,color: clrWhite),),
                  Container(margin: EdgeInsets.only(right: 10),height: 40,decoration: BoxDecoration(border: Border.all(color: clrWhite),borderRadius: BorderRadius.circular(5)),child: CustoElevatButton(textWidget: Text("Add Ticket"),onTap: (){
                    Navigator.push(context, CupertinoPageRoute(builder: (context){
                      return AddTicket() ;
                    }));
                  },)),
                ],
              ),

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
                            Text("TICKET-1715848481445-1"),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 3),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: clrSecondary),
                              child: Text("Open",style: TextStyle(color: clrWhite),),
                            ),
              
                          ],
                        ),
              
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Analytics data issues	"),
                            InkWell(
                              onTap: (){
                                showDialog(context: context, builder: (context){
                                  return AlertDialog(
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text("Description",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18),),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text("At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident,")
                                      ],
                                    ),
                                  );
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Icon(Icons.visibility),
                              ),
                            )
                          ],
                        ),
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
