import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lms/providers/themeprovider/themeprovider.dart';
import 'package:lms/ui/moreuis/changepassui.dart';
import 'package:lms/ui/moreuis/forwardcouui.dart';
import 'package:lms/ui/moreuis/personalcourselist.dart';
import 'package:lms/ui/moreuis/resellercourse.dart';
import 'package:lms/ui/moreuis/supportticketlistui.dart';
import 'package:lms/ui/quizzes/quizzeui.dart';
import 'package:lms/utils/colors.dart';
import 'package:lms/utils/sharepreference.dart';
import 'package:provider/provider.dart';

import 'moreuis/editprofileui.dart';

class MoreUi extends StatefulWidget {
  const MoreUi({super.key});

  @override
  State<MoreUi> createState() => _MoreUiState();
}

class _MoreUiState extends State<MoreUi> {
  @override
  Widget build(BuildContext context) {
    bool isLightTheme = Provider.of<ThemeProvider>(context).isLightTheme;
    var w=MediaQuery.of(context).size.width;
    var h=MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment:CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              color:clrSecondary.withOpacity(0.7),
              child: Column(
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      children: [
                        CircleAvatar(
                          minRadius: 45,
                          backgroundColor: clrBlack,
                          child: CircleAvatar(
                            minRadius: 43,
                            // child: ,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Hello",
                                style:
                                    TextStyle(color: clrWhite, fontSize: 18),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text("Learner",
                                  style: TextStyle(
                                      color: clrWhite,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container( 
                          // width:w*0.5 ,
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: clrPrimary.withOpacity(0.4)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Icon(Icons.wallet_membership_sharp),
                              Text("10",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600),),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Total Scorm",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 18),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: clrYellowDark.withOpacity(0.4)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Icon(Icons.wallet_membership_sharp),
                              Text("10",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600),),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Total Other Courses",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 18,),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Consumer<ThemeProvider>(
                      builder: (context, themeProvider, child) {
                    return Container(
                      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 3),
                      decoration: BoxDecoration(
                        color: clrBlack.withOpacity(0.06),
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(themeProvider.currentTheme ==
                              ThemeMode.light
                              ?"Light Theme":"Dark Theme",style: TextStyle(fontSize: 17),),
                          Switch(
                              value: themeProvider.currentTheme ==
                                      ThemeMode.light
                                  ? false
                                  : true,
                              onChanged: (val) {
                                if (val == true) {
                                  themeProvider
                                      .changeThemeMode(ThemeMode.dark);
                                  changeThemePreFerence(false);
                                } else {
                                  themeProvider
                                      .changeThemeMode(ThemeMode.light);
                                  changeThemePreFerence(true);
                                }
                              })
                        ],
                      ),
                    );
                  }),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // SizedBox(
                  //   height: 15,
                  // ),
                  // Text("SUPPORTS & LEGALS",style: TextStyle(fontWeight: FontWeight.w600),),
                  SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context,CupertinoPageRoute(builder: (context){
                        return EditProfileUi() ;
                      }));
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color:isLightTheme? clrBlack.withOpacity(0.2):clrWhite.withOpacity(0.2))
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(

                            children: [
                              Icon(Icons.privacy_tip,color:isLightTheme? clrBlack.withOpacity(0.5):clrWhite.withOpacity(0.5),),
                              SizedBox(
                                width: 15,
                              ),
                              Text("Edit Profile",style: TextStyle(fontSize: 17),)
                            ],
                          ),
                          Icon(Icons.arrow_forward_ios,color:isLightTheme? clrBlack.withOpacity(0.2):clrWhite.withOpacity(0.5),)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context,CupertinoPageRoute(builder: (context){
                        return ResellerCourseList() ;
                      }));
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color:isLightTheme? clrBlack.withOpacity(0.2):clrWhite.withOpacity(0.2))
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(

                            children: [
                              Icon(Icons.privacy_tip,color:isLightTheme? clrBlack.withOpacity(0.5):clrWhite.withOpacity(0.5),),
                              SizedBox(
                                width: 15,
                              ),
                              Text("Reseller Course",style: TextStyle(fontSize: 17),)
                            ],
                          ),
                          Icon(Icons.arrow_forward_ios,color:isLightTheme? clrBlack.withOpacity(0.2):clrWhite.withOpacity(0.5),)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context,CupertinoPageRoute(builder: (context){
                        return PersonalCourseUi() ;
                      }));
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color:isLightTheme? clrBlack.withOpacity(0.2):clrWhite.withOpacity(0.2))
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(

                            children: [
                              Icon(Icons.privacy_tip,color:isLightTheme? clrBlack.withOpacity(0.5):clrWhite.withOpacity(0.5),),
                              SizedBox(
                                width: 15,
                              ),
                              Text("Personal Course",style: TextStyle(fontSize: 17),)
                            ],
                          ),
                          Icon(Icons.arrow_forward_ios,color:isLightTheme? clrBlack.withOpacity(0.2):clrWhite.withOpacity(0.5),)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context,CupertinoPageRoute(builder: (context){
                        return ForwardCourseListUi() ;
                      }));
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color:isLightTheme? clrBlack.withOpacity(0.2):clrWhite.withOpacity(0.2))
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(

                            children: [
                              Icon(Icons.privacy_tip,color:isLightTheme? clrBlack.withOpacity(0.5):clrWhite.withOpacity(0.5),),
                              SizedBox(
                                width: 15,
                              ),
                              Text("Forwarded Courses",style: TextStyle(fontSize: 17),)
                            ],
                          ),
                          Icon(Icons.arrow_forward_ios,color:isLightTheme? clrBlack.withOpacity(0.2):clrWhite.withOpacity(0.5),)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context,CupertinoPageRoute(builder: (context){
                        return SupportTicketUi() ;
                      }));
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color:isLightTheme? clrBlack.withOpacity(0.2):clrWhite.withOpacity(0.2))
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(

                            children: [
                              Icon(Icons.privacy_tip,color:isLightTheme? clrBlack.withOpacity(0.5):clrWhite.withOpacity(0.5),),
                              SizedBox(
                                width: 15,
                              ),
                              Text("Support Tickets",style: TextStyle(fontSize: 17),)
                            ],
                          ),
                          Icon(Icons.arrow_forward_ios,color:isLightTheme? clrBlack.withOpacity(0.2):clrWhite.withOpacity(0.5),)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context,CupertinoPageRoute(builder: (context){
                        return ChangePassUi() ;
                      }));
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color:isLightTheme? clrBlack.withOpacity(0.2):clrWhite.withOpacity(0.2))
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(

                            children: [
                              Icon(Icons.privacy_tip,color:isLightTheme? clrBlack.withOpacity(0.5):clrWhite.withOpacity(0.5),),
                              SizedBox(
                                width: 15,
                              ),
                              Text("Change Password",style: TextStyle(fontSize: 17),)
                            ],
                          ),
                          Icon(Icons.arrow_forward_ios,color:isLightTheme? clrBlack.withOpacity(0.2):clrWhite.withOpacity(0.5),)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),

                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color:isLightTheme? clrBlack.withOpacity(0.2):clrWhite.withOpacity(0.2))
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(

                          children: [
                            Icon(Icons.privacy_tip,color:isLightTheme? clrBlack.withOpacity(0.5):clrWhite.withOpacity(0.5),),
                            SizedBox(
                              width: 15,
                            ),
                            Text("Privacy Policy",style: TextStyle(fontSize: 17),)
                          ],
                        ),
                        Icon(Icons.arrow_forward_ios,color:isLightTheme? clrBlack.withOpacity(0.2):clrWhite.withOpacity(0.5),)
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color:isLightTheme? clrBlack.withOpacity(0.2):clrWhite.withOpacity(0.2))
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(

                          children: [
                            Icon(Icons.featured_play_list,color:isLightTheme? clrBlack.withOpacity(0.5):clrWhite.withOpacity(0.5),),
                            SizedBox(
                              width: 15,
                            ),
                            Text("Terms & Condition",style: TextStyle(fontSize: 17),)
                          ],
                        ),
                        Icon(Icons.arrow_forward_ios,color:isLightTheme? clrBlack.withOpacity(0.2):clrWhite.withOpacity(0.5),)
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color:isLightTheme? clrBlack.withOpacity(0.2):clrWhite.withOpacity(0.2))
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(

                          children: [
                            Icon(Icons.featured_play_list,color:isLightTheme? clrBlack.withOpacity(0.5):clrWhite.withOpacity(0.5),),
                            SizedBox(
                              width: 15,
                            ),
                            Text("Support",style: TextStyle(fontSize: 17),)
                          ],
                        ),
                        Icon(Icons.arrow_forward_ios,color:isLightTheme? clrBlack.withOpacity(0.2):clrWhite.withOpacity(0.5),)
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color:isLightTheme? clrBlack.withOpacity(0.2):clrWhite.withOpacity(0.2))
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(

                          children: [
                            Icon(Icons.exit_to_app,color:isLightTheme? clrBlack.withOpacity(0.5):clrWhite.withOpacity(0.5),),
                            SizedBox(
                              width: 15,
                            ),
                            Text("Log Out",style: TextStyle(fontSize: 17),)
                          ],
                        ),
                        Icon(Icons.arrow_forward_ios,color:isLightTheme? clrBlack.withOpacity(0.2):clrWhite.withOpacity(0.5),)
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
