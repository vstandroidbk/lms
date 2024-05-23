import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lms/ui/components/custoappbar.dart';
import 'package:lms/ui/navbar.dart';
import 'package:provider/provider.dart';

import '../providers/themeprovider/themeprovider.dart';
import '../utils/colors.dart';
import 'components/custoelevatbut.dart';

class FavouriteUi extends StatefulWidget {
  const FavouriteUi({super.key});

  @override
  State<FavouriteUi> createState() => _FavouriteUiState();
}

class _FavouriteUiState extends State<FavouriteUi> {
  @override
  Widget build(BuildContext context) {
    bool isLightTheme=Provider.of<ThemeProvider>(context,listen: false).isLightTheme;
    return Scaffold(
      appBar:custoAppBar(context),
      body: SizedBox(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                GridView.builder(itemCount: 3,shrinkWrap: true,physics: NeverScrollableScrollPhysics(),gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5.0,
                  mainAxisSpacing: 7.0,
                    childAspectRatio:1.2
                ),
                    itemBuilder: (context,index){
                  return InkWell(
                    onTap: (){
                      Navigator.push(context, CupertinoPageRoute(builder: (context){
                        return NavBar(indexCusto: 2,) ;
                      }));
                    },
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color:index==0? clrPink.withOpacity(0.7):index==1?clrSecondary.withOpacity(0.7) :index==2?clrBlue.withOpacity(0.6):clrRed.withOpacity(0.7)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Expanded(child: Image.asset(height: 40,index ==2?"assets/images/web.png":"assets/images/dir.png")),
                          SizedBox(
                            height: 15,
                          ),
                          Text(index==1? 'Designing' :"English-Language tutorials",maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(color:clrWhite,fontWeight: FontWeight.w700,fontSize: 17),),
                          Text("0 Courses",style: TextStyle(color:clrWhite),),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ) ;
                    }),
              ],
            ),
          )
          // ListView.builder(itemCount: 20,shrinkWrap: true,itemBuilder: (context,index){
          //   return  Container(
          //     clipBehavior: Clip.hardEdge,
          //     margin: EdgeInsets.only(bottom: 8),
          //     padding: EdgeInsets.symmetric(vertical: 5),
          //     decoration: BoxDecoration(
          //         color: isLightTheme?clrWhite:clrBlack.withOpacity(0.4),
          //         borderRadius: BorderRadius.circular(20)
          //     ),
          //     child: Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         Row(
          //           children: [
          //             Container(
          //               height: 100,
          //               width: 100,
          //               decoration: BoxDecoration(
          //                 image: DecorationImage(image: NetworkImage("https://eguru.volansoft.in/assets/img/object-2.png"))
          //               ),
          //             ),
          //             SizedBox(
          //               width: 10,
          //             ),
          //             Column(
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 Text("Digital Marketing",style: TextStyle(color: clrPrimary),),
          //                 Text("English-Language tutorials",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 17),),
          //                 Row(
          //                   children: [
          //                     Text("\$ 20.0 ",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 17),),
          //                     Text("\$100.0",style: TextStyle(fontWeight: FontWeight.w600,fontSize:15,decoration: TextDecoration.lineThrough,color:isLightTheme? clrBlack.withOpacity(0.5):clrWhite.withOpacity(0.4)),)
          //                   ],
          //                 ),
          //               ],
          //             ),
          //
          //           ],
          //         ),
          //         // Padding(
          //         //   padding: const EdgeInsets.all(8.0),
          //         //   child: Column(
          //         //     crossAxisAlignment: CrossAxisAlignment.start,
          //         //     children: [
          //         //       // Expanded(child: Icon(Icons.manage_accounts,size: 40,)),
          //         //
          //         //       SizedBox(
          //         //         height: 10,
          //         //       ),
          //         //       SizedBox(
          //         //         width: 250,
          //         //         child: Row(
          //         //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         //           children: [
          //         //             Text("10 Hours",style: TextStyle(fontSize: 12),),
          //         //             Icon(Icons.circle,size: 7,color: clrBlack.withOpacity(0.3),),
          //         //             Text("10 Enrolled",style: TextStyle(fontSize: 12),),
          //         //             Icon(Icons.circle,size: 7,color: clrBlack.withOpacity(0.3),),
          //         //             Row(
          //         //               children: [
          //         //                 Icon(Icons.star,color: clrYellowDark,size: 20,),
          //         //                 Text("4.5 (100)",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w600),)
          //         //               ],
          //         //             )
          //         //           ],
          //         //         ),
          //         //       ),
          //         //       Row(
          //         //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         //           children: [
          //         //
          //         //
          //         //           ]
          //         //       )
          //         //     ],
          //         //   ),
          //         // ),
          //       ],
          //     ),
          //   );
          // }),
        ),
      ),
    );
  }
}
