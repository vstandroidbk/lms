 import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lms/providers/themeprovider/themeprovider.dart';
import 'package:lms/ui/moreuis/editprofileui.dart';
import 'package:provider/provider.dart';

import '../../utils/colors.dart';

custoAppBar(context){
  return AppBar(
    scrolledUnderElevation: 0.0,
    automaticallyImplyLeading: false,
    title: Image.asset(height: 25,"assets/images/logo.png"),//Text("LMS",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 25,color: clrWhite),),
    backgroundColor:Provider.of<ThemeProvider>(context,listen: false).isLightTheme==true? clrPrimary:clrPrimary,
    actions: [
      InkWell(
      onTap: (){
        Navigator.push(context, CupertinoPageRoute(builder: (context){
          return EditProfileUi() ;
        }));
      },
        child: Padding(
          padding: const EdgeInsets.only(right: 13),
          child: Container(
            clipBehavior: Clip.hardEdge,
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100)
            ),
            child: Image.network("https://eguru.volansoft.in/uploads/testimonials/1715410314633_user1.jpg"),
          ),
        ),
      )
    ],
  );
}