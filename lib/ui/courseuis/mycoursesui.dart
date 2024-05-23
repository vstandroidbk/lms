import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/themeprovider/themeprovider.dart';
import '../../utils/colors.dart';
import '../components/custoappbar.dart';
import '../components/custoelevatbut.dart';
import 'coursedetail.dart';

class MyCourseUi extends StatefulWidget {
  const MyCourseUi({super.key});

  @override
  State<MyCourseUi> createState() => _MyCourseUiState();
}

class _MyCourseUiState extends State<MyCourseUi> {
  @override
  Widget build(BuildContext context) {
    bool isLightTheme=Provider.of<ThemeProvider>(context,listen: false).isLightTheme;
    return Scaffold(
      appBar:custoAppBar(context),
      body: SizedBox(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: ListView.builder(itemCount: 5,shrinkWrap: true,itemBuilder: (context,index){
            return  Container(
              clipBehavior: Clip.hardEdge,
              margin: EdgeInsets.only(bottom: 8,top: 8),
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
                        Text("Digital Marketing",style: TextStyle(color: clrPrimary),),
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
          }),
        ),
      ),
    );
  }
}
