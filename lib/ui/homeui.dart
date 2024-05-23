import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:lms/providers/themeprovider/themeprovider.dart';
import 'package:lms/ui/components/custoappbar.dart';
import 'package:lms/ui/components/custoelevatbut.dart';
import 'package:lms/ui/courseuis/coursedetail.dart';
import 'package:lms/utils/colors.dart';
import 'package:provider/provider.dart';

import 'navbar.dart';

class HomeUi extends StatefulWidget {
  const HomeUi({super.key});

  @override
  State<HomeUi> createState() => _HomeUiState();
}

class _HomeUiState extends State<HomeUi> {
  @override
  Widget build(BuildContext context) {
  bool isLightTheme=Provider.of<ThemeProvider>(context,listen: false).isLightTheme;
    return Scaffold(

      appBar:custoAppBar(context),
      body: SafeArea(
        // height: 100,
        // decoration:isLightTheme?BoxDecoration(
        //   gradient: LinearGradient(colors:[clrPrimary,clrWhite],begin: Alignment.topCenter,end: Alignment.bottomCenter)
        // ):BoxDecoration(
            // gradient: LinearGradient(colors:[clrPrimary,clrWhite],begin: Alignment.topCenter,end: Alignment.bottomCenter)
        // ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

               SizedBox(
                 height: 10,
               ),
               // Row(
               //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
               //   children: [
               //     Text("LMS",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 25,color: clrWhite),),
               //     Container(
               //       clipBehavior: Clip.hardEdge,
               //       height: 45,
               //       width: 45,
               //       decoration: BoxDecoration(
               //           borderRadius: BorderRadius.circular(100)
               //       ),
               //       child: Image.network("https://eguru.volansoft.in/uploads/testimonials/1715410314633_user1.jpg"),
               //     ),
               //   ],
               // ),
               SizedBox(
                 height: 5,
               ),
                Container(
                  height: 220,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage("assets/images/bach.png")),
                    // color: clrSecondary,
                    // borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight:Radius.circular(20),bottomLeft: Radius.circular(20),bottomRight: Radius.circular(10) ),

                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      Image.network(height: 150,width: 150,"https://eguru.volansoft.in/assets/img/object.png",fit: BoxFit.cover,),
                      SizedBox(
                        width: 15,
                      ),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Text("Hi Learner ",style: TextStyle(fontSize: 18,color: clrWhite),),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Discover Your\nPerfect Learning\nPath",softWrap: true,style: TextStyle(fontSize: 18,color: clrWhite,fontWeight: FontWeight.w600),),
                            SizedBox(
                              height: 10,
                            ),
                            Text("2+Courses",style: TextStyle(color: clrWhite.withOpacity(0.5)),)
                          ],
                        ),
                      )
                    ],
                  ),
                ),

               SizedBox(
                 height: 20,
               ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Text("Categories",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                   InkWell(onTap: (){
                     Navigator.push(context, CupertinoPageRoute(builder: (context){
                       return NavBar(indexCusto: 1,) ;
                     }));
                   },child: Text("View All",style: TextStyle(fontSize: 16,color: clrSecondary),)),
                 ],
               ),
               SizedBox(
                 height: 10,
               ),
               SizedBox(
                 height: 145,
                 child: ListView.builder(itemCount: 5,shrinkWrap: true,scrollDirection: Axis.horizontal,itemBuilder: (context,index){
                   return  Container(
                     padding: EdgeInsets.all(15),
                     width: 165,
                     margin: EdgeInsets.only(right: 11),
                     decoration: BoxDecoration(
                         color: index==0? clrBlue.withOpacity(0.5):index==1?clrSecondary.withOpacity(0.6) :index==2?clrPrimary.withOpacity(0.7):clrRed.withOpacity(0.7),
                         borderRadius: BorderRadius.circular(20)
                     ),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         // Expanded(child: Icon(Icons.manage_accounts,size: 40,)),
                         SizedBox(
                           height: 5,
                         ),
                         Expanded(child: Image.asset(index ==0?"assets/images/web.png":index==1?"assets/images/degining.png" :index ==2? "assets/images/english.png":index==3?"assets/images/dir.png":"assets/images/teacher.png")),
                         SizedBox(
                           height: 10,
                         ),
                         Text(index ==0? 'Professional Designer' :index ==1?"Graphic Designer" :"English-Language tutorials",maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(color:clrWhite,fontWeight: FontWeight.w700,fontSize: 17),),
                         Text("0 Courses",style: TextStyle(color:clrWhite),),
                       ],
                     ),
                   );
                 }),
               ),
               SizedBox(
                 height: 20,
               ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Text("Most Popular Courses",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                   InkWell(onTap: (){
                     Navigator.push(context, CupertinoPageRoute(builder: (context){
                       return NavBar(indexCusto: 2,) ;
                     }));
                   },child: Text("View All",style: TextStyle(fontSize: 16,color: clrSecondary),)),
                 ],
               ),
               SizedBox(
                 height: 10,
               ),
               SizedBox(
                 height: 280,
                 child: ListView.builder(itemCount: 4,shrinkWrap: true,scrollDirection: Axis.horizontal,itemBuilder: (context,index){
                   return  Container(
                     clipBehavior: Clip.hardEdge,
                     width: 350,
                     margin: EdgeInsets.only(right: 15),
                     decoration: BoxDecoration(
                         color: isLightTheme?clrWhite:clrBlack.withOpacity(0.4),
                         borderRadius: BorderRadius.circular(20)
                     ),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Image.network(height: 130,width: double.maxFinite,index==1?"https://media.istockphoto.com/id/2054515915/photo/satisfaction-document-checklist-database-contract-checkbox-insurance-manager-technology.jpg?s=1024x1024&w=is&k=20&c=Q3iEd8biJjsv2ndK5et6KAxXB633Ci41lZ5BqqHZgWI=" :index==0?"https://media.istockphoto.com/id/1464561797/photo/artificial-intelligence-processor-unit-powerful-quantum-ai-component-on-pcb-motherboard-with.jpg?s=1024x1024&w=is&k=20&c=vKnJb_tlENfrcT5jSWRugaJv-ESAlBkTcDgiNGgFPW0=":"https://imageio.forbes.com/specials-images/imageserve/61d52d4e3a76ed81ac034ea8/The-10-Tech-Trends-That-Will-Transform-Our-World/960x0.jpg?format=jpg&width=1440",fit: BoxFit.cover,),
                         Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               // Expanded(child: Icon(Icons.manage_accounts,size: 40,)),
                               Text("Digital Marketing",style: TextStyle(color: clrSecondary),),
                               Text("English-Language tutorials",maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 17),),
                               SizedBox(
                                 height: 10,
                               ),
                               SizedBox(
                                 width: 250,
                                 child: Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                   children: [
                                     Text("10 Hours",style: TextStyle(fontSize: 12),),
                                     Icon(Icons.circle,size: 7,color: clrBlack.withOpacity(0.3),),
                                     Text("10 Enrolled",style: TextStyle(fontSize: 12),),
                                     Icon(Icons.circle,size: 7,color: clrBlack.withOpacity(0.3),),
                                     Row(
                                       children: [
                                         Icon(Icons.star,color: clrYellowDark,size: 20,),
                                         Text("4.5 (100)",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w600),)
                                       ],
                                     )
                                   ],
                                 ),
                               ),
                               SizedBox(
                                 height: 10,
                               ),
                               Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                   children: [
                                     Row(
                                       children: [
                                         Text("\$ 20.0 ",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 20),),
                                         Text("\$100.0",style: TextStyle(fontWeight: FontWeight.w600,fontSize:15,decoration: TextDecoration.lineThrough,color:isLightTheme? clrBlack.withOpacity(0.5):clrWhite.withOpacity(0.4)),)
                                       ],
                                     ),
                                     SizedBox(height: 33,child: CustoElevatButton(textWidget: Text("View Details",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 17),),onTap: (){
                                       Navigator.push(context, CupertinoPageRoute(builder: (context){
                                         return CourseDetailUi() ;
                                       }));
                                     },))

                                   ]
                               )
                             ],
                           ),
                         ),
                       ],
                     ),
                   );
                 }),
               ),
               SizedBox(
                 height: 20,
               ),
               Text("All Courses",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
               SizedBox(
                 height: 10,
               ),
               ListView.builder(itemCount: 4,shrinkWrap: true,physics: NeverScrollableScrollPhysics(),itemBuilder: (context,index){
                 return  Container(
                   clipBehavior: Clip.hardEdge,
                   margin: EdgeInsets.only(bottom: 15),
                   decoration: BoxDecoration(
                       color: isLightTheme?clrWhite:clrBlack.withOpacity(0.4),
                       borderRadius: BorderRadius.circular(20)
                   ),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Image.network(height: 130,width: double.maxFinite,index==0? "https://media.istockphoto.com/id/1927795888/photo/artificial-intelligence-machine-learning-natural-language-processing-data-technology.jpg?s=1024x1024&w=is&k=20&c=sPnfMP0KGptj9KCwnZitynmwjtMVxG9kHhXVk2z9qF4=":index==1?"https://media.istockphoto.com/id/1487512611/photo/customer-holding-virtual-evaluation-indicator-rating-since-low-to-high-for-client-excellent.jpg?s=1024x1024&w=is&k=20&c=A6-kLE9WMQKd_EKVe1Bi4n73tlbx77N1X0OchUOG6SM=":index==2? 'https://media.istockphoto.com/id/1494104649/photo/ai-chatbot-artificial-intelligence-digital-concept.jpg?s=2048x2048&w=is&k=20&c=AwtJ4gMG5S2ryVd6pYeiWm2lD10-Lr593yhZDtrK4fs=':"https://imageio.forbes.com/specials-images/imageserve/61d52d4e3a76ed81ac034ea8/The-10-Tech-Trends-That-Will-Transform-Our-World/960x0.jpg?format=jpg&width=1440",fit: BoxFit.cover,),
                       Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             // Expanded(child: Icon(Icons.manage_accounts,size: 40,)),
                             Text("Digital Marketing",style: TextStyle(color: clrSecondary),),
                             Text("English-Language tutorials",maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 17),),
                             SizedBox(
                               height: 10,
                             ),
                             SizedBox(
                               width: 250,
                               child: Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [
                                   Text("10 Hours",style: TextStyle(fontSize: 12),),
                                   Icon(Icons.circle,size: 7,color: clrBlack.withOpacity(0.3),),
                                   Text("10 Enrolled",style: TextStyle(fontSize: 12),),
                                   Icon(Icons.circle,size: 7,color: clrBlack.withOpacity(0.3),),
                                   Row(
                                     children: [
                                       Icon(Icons.star,color: clrYellowDark,size: 20,),
                                       Text("4.5 (100)",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w600),)
                                     ],
                                   )
                                 ],
                               ),
                             ),
                             SizedBox(
                               height: 8,
                             ),
                             Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [
                                   Row(
                                     children: [
                                       Text("\$ 20.0 ",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 20),),
                                       Text("\$100.0",style: TextStyle(fontWeight: FontWeight.w600,fontSize:15,decoration: TextDecoration.lineThrough,color:isLightTheme? clrBlack.withOpacity(0.5):clrWhite.withOpacity(0.4)),)
                                     ],
                                   ),
                                   SizedBox(height: 33,child: CustoElevatButton(textWidget: Text("View Details",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 17),),onTap: (){
                                     Navigator.push(context, CupertinoPageRoute(builder: (context){
                                       return CourseDetailUi() ;
                                     }));
                                   },))

                                 ]
                             )
                           ],
                         ),
                       ),
                     ],
                   ),
                 );
               })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
