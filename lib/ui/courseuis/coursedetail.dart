import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:lms/providers/courseprovider.dart';
import 'package:lms/ui/components/custoappbar.dart';
import 'package:lms/ui/components/custoelevatbut.dart';
import 'package:lms/ui/components/custotextfieldwithlable.dart';
import 'package:lms/ui/components/textareaui.dart';
import 'package:lms/ui/quizzes/quizzeui.dart';
import 'package:lms/ui/videoplayer.dart';
import 'package:provider/provider.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

import '../../providers/themeprovider/themeprovider.dart';
import '../../utils/colors.dart';

class CourseDetailUi extends StatefulWidget {
  const CourseDetailUi({super.key});

  @override
  State<CourseDetailUi> createState() => _CourseDetailUiState();
}

class _CourseDetailUiState extends State<CourseDetailUi>
    with TickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
    Provider.of<CourseProvider>(context,listen: false).initClean();
  }

  @override
  Widget build(BuildContext context) {
    bool isLightTheme=Provider.of<ThemeProvider>(context,listen: false).isLightTheme;
    return Scaffold(
      appBar: custoAppBar(context),
      body: Consumer<CourseProvider>(builder: (context,courseProvider,child){
        return Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 220,
                      child: VideoPlayer(url: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "English-Language tutorials",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: 250,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "10 Hours",
                                  style: TextStyle(fontSize: 12),
                                ),
                                Icon(
                                  Icons.circle,
                                  size: 7,
                                  color: clrBlack.withOpacity(0.3),
                                ),
                                Text(
                                  "10 Enrolled",
                                  style: TextStyle(fontSize: 12),
                                ),
                                Icon(
                                  Icons.circle,
                                  size: 7,
                                  color: clrBlack.withOpacity(0.3),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: clrYellowDark,
                                      size: 20,
                                    ),
                                    Text(
                                      "4.5 (100)",
                                      style: TextStyle(
                                          fontSize: 13, fontWeight: FontWeight.w600),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          StickyHeader(

                            header: Container(
                              color: isLightTheme==true?clrWhite:clrBlack,
                              child: TabBar(
                                  controller: tabController,
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  labelColor: clrSecondary,
                                  indicatorColor: clrSecondary,
                                  tabs: [
                                    Text(
                                      "About",
                                      style: TextStyle(fontSize: 17),
                                    ),
                                    Text("Lesson", style: TextStyle(fontSize: 17)),
                                    Text("Review", style: TextStyle(fontSize: 17)),
                                    Text("Quizee", style: TextStyle(fontSize: 17))
                                  ]),
                            ),
                            content: SizedBox(
                              height: 1000,
                              child: TabBarView(controller: tabController, children: [
                                Column(
                                  children: [
                                    Text(
                                        "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur."),
                                    SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ListView.builder(shrinkWrap: true,itemCount: 2,physics: NeverScrollableScrollPhysics(),itemBuilder: (context,index){
                                      return InkWell(
                                        onTap: (){
                                          courseProvider.changeClicked(index);
                                        },
                                        child: Column(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.symmetric(horizontal: 10,vertical:
                                              8),
                                              margin: EdgeInsets.only(bottom: 10),
                                              decoration: BoxDecoration(
                                                  color:isLightTheme? clrWhite:clrBlack,
                                                  borderRadius: BorderRadius.circular(20)
                                              ),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Flexible(
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text("Class 1"),
                                                        Text("Gaphic Designer Therory #1 Color Part 1",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  Icon( index != courseProvider.clicked? Icons.keyboard_arrow_down_sharp:Icons.keyboard_arrow_up_outlined)
                                                ],
                                              ),
                                            ),
                                            Visibility(
                                              visible: index == courseProvider.clicked?true:false,
                                              child: ListView.builder(itemCount: 3,physics: NeverScrollableScrollPhysics(),shrinkWrap: true,itemBuilder: (context,index){
                                                return Container(
                                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                                  margin: EdgeInsets.symmetric(vertical: 5),
                                                  child: Row(
                                                    children: [
                                                      Icon(Icons.image),
                                                      SizedBox(width: 10,),
                                                      Flexible(child: Text("Mega Digital Marketing Course A-Z "))
                                                    ],
                                                  ),
                                                ) ;
                                              }),
                                            )
                                          ],
                                        ),
                                      );
                                    })
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Reviews",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 17),),
                                        SizedBox(height: 30,child: CustoElevatButton(textWidget: Text("Add Review"),onTap: (){
                                          showDialog(context: context, builder: (context){
                                          return  AlertDialog(
                                              content: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text("Write a review",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600),),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text("Your email address will not be published",style: TextStyle(fontSize: 16),),
                                                  Text("Required fields are marked *",style: TextStyle(fontSize: 16),),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text("Your rating *",style: TextStyle(fontSize: 16),),
                                            RatingBar.builder(
                                              initialRating: 0,
                                              minRating: 1,
                                              direction: Axis.horizontal,
                                              allowHalfRating: true,
                                              itemCount: 5,
                                              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                                              itemBuilder: (context, _) => Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                              ),
                                              onRatingUpdate: (rating) {
                                                print(rating);
                                              },
                                            ),
                                                  SizedBox(height: 10,),
                                                  Text("Your review *",style: TextStyle(fontSize: 16),),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  CustoTextArea(maxLines: 3,),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  Align(
                                                    alignment: Alignment.centerRight,
                                                    child: CustoElevatButton(
                                                      textWidget: Text("Submit",),onTap: (){
                                                        Navigator.pop(context);
                                                    },
                                                    ),
                                                  )
                                                ],
                                              ),
                                            );
                                          });
                                        },)),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    ListView.builder(itemCount: 5,shrinkWrap: true,physics: NeverScrollableScrollPhysics(),itemBuilder: (context,index){
                                      return Container(
                                        margin: EdgeInsets.symmetric(vertical: 10),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("Lekhraj",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),),
                                            Row(
                                              children: [
                                                Icon(Icons.star,size: 30,color: clrYellowDark,),
                                                Icon(Icons.star,size: 30,color: clrYellowDark,),
                                                Icon(Icons.star,size: 30,color: clrYellowDark,),
                                                Icon(Icons.star,size: 30,color: clrYellowDark,),
                                                Icon(Icons.star,size: 30,color: clrYellowDark,),
                                                Text("5",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),)
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text("Very good service")
                                          ],
                                        ),
                                      ) ;
                                    })
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ListView.builder(shrinkWrap: true,itemCount: 2,physics: NeverScrollableScrollPhysics(),itemBuilder: (context,index){
                                      return InkWell(
                                        onTap: (){
                                          courseProvider.changeClicked(index);
                                        },
                                        child: Column(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.symmetric(horizontal: 10,vertical:
                                              8),
                                              margin: EdgeInsets.only(bottom: 10),
                                              decoration: BoxDecoration(
                                                  color:isLightTheme? clrWhite:clrBlack,
                                                  borderRadius: BorderRadius.circular(20)
                                              ),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Flexible(
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text("Graphic Designer Therory Quizze",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  Icon( index != courseProvider.clicked? Icons.keyboard_arrow_down_sharp:Icons.keyboard_arrow_up_outlined)
                                                ],
                                              ),
                                            ),
                                            Visibility(
                                              visible: index == courseProvider.clicked?true:false,
                                              child: ListView.builder(itemCount: 3,physics: NeverScrollableScrollPhysics(),shrinkWrap: true,itemBuilder: (context,index){
                                                return InkWell(
                                                  onTap: (){
                                                    // Navigator.push(context, CupertinoPageRoute(builder: (context){
                                                    //   return QuizzeUi() ;
                                                    // }));
                                                    Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context){
                                                      return QuizzeUi() ;
                                                    }));

                                                  },
                                                  child: Container(
                                                    padding: EdgeInsets.symmetric(horizontal: 20),
                                                    margin: EdgeInsets.symmetric(vertical: 5),
                                                    child: Row(
                                                      children: [
                                                        Icon(Icons.image),
                                                        SizedBox(width: 10,),
                                                        Flexible(child: Text("Design Quizze No. ${index+1}"))
                                                      ],
                                                    ),
                                                  ),
                                                ) ;
                                              }),
                                            )
                                          ],
                                        ),
                                      );
                                    })
                                  ],
                                ),
                              ]),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text("\$ 20.0 ",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 20),),
                      Text("\$100.0",style: TextStyle(fontWeight: FontWeight.w600,fontSize:15,decoration: TextDecoration.lineThrough,color:isLightTheme? clrBlack.withOpacity(0.5):clrWhite.withOpacity(0.4)),)
                    ],

                  ),
                  CustoElevatButton(textWidget: Text("Buy Now",style: TextStyle(fontSize: 16),),onTap: (){

                  },)
                ],
              ),
            )
          ],
        ) ;
      }),
    );
  }
}
