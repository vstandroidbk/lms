import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lms/ui/components/custoappbar.dart';
import 'package:lms/ui/components/custodropdown.dart';
import 'package:lms/ui/components/custoelevatbut.dart';
import 'package:lms/ui/components/custotextfieldwithlable.dart';
import 'package:lms/ui/components/textareaui.dart';
import 'package:lms/utils/colors.dart';
import 'package:provider/provider.dart';

import '../../providers/ticketprovider.dart';

class AddTicket extends StatefulWidget {
  const AddTicket({super.key});

  @override
  State<AddTicket> createState() => _AddTicketState();
}

class _AddTicketState extends State<AddTicket> {
  @override
  void initState() {
    Provider.of<TicketProvider>(context,listen: false).initCall();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: custoAppBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Column(
          children: [
              // Text("data")
            SizedBox(
              height: 20,
            ),
            // CustoTextFieldWithLable(lable: "Reason",),
            CustoDropDown(onChange: (val){
              print("check gk $val");
            },dropItems: [
              DropdownMenuItem(child: Text("Please select Reason")),
              DropdownMenuItem(child: Text("Analytics data issues"),value: "1",),
              DropdownMenuItem(child: Text("Order not received"),value: "2",),
            ],lable: "Reason",),
            SizedBox(
              height: 20,
            ),
            CustoTextFieldWithLable(lable: "Subject",),
            SizedBox(
              height: 20,
            ),
            CustoTextArea(maxLines: 3,lable: "Message",),
            // CustoTextFieldWithLable(),
            SizedBox(
              height: 20,
            ),
            Consumer<TicketProvider>(builder:(context,ticketProvider,child){
              return InkWell(
                onTap: ()async{
                  final ImagePicker picker = ImagePicker();
                  final XFile? image = await picker.pickImage(source: ImageSource.gallery);
                  if(image !=null){
                    ticketProvider.changeImage(image);
                  }
                },
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  decoration:BoxDecoration(
                      color: clrTransparent,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: clrBlack.withOpacity(0.1))
                  ),
                  child: Row(
                    children: [
                      Container(
                        child: Container(padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),decoration: BoxDecoration(color: clrGreeDark),child: Text("Choose File",style: TextStyle(color: clrWhite),)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(ticketProvider.image ==null?"Select Image" :ticketProvider.image?.name??'',maxLines: 1,overflow: TextOverflow.ellipsis,),
                      )
                    ],
                  ),
                ),
              );
            }),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.maxFinite,
              height: 50,
              child: CustoElevatButton(
                textWidget: Text("Submit",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),),
                onTap: (){},
              ),
            )
          ],
        ),
      ),
    );
  }
}
