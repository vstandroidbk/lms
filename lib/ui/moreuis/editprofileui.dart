import 'dart:ffi';
import 'dart:io';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lms/providers/profileprovider.dart';
import 'package:lms/ui/components/custoappbar.dart';
import 'package:lms/ui/components/custoelevatbut.dart';
import 'package:lms/ui/components/custotextfieldwithlable.dart';
import 'package:lms/utils/colors.dart';
import 'package:provider/provider.dart';

class EditProfileUi extends StatefulWidget {
  const EditProfileUi({super.key});

  @override
  State<EditProfileUi> createState() => _EditProfileUiState();
}

class _EditProfileUiState extends State<EditProfileUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: custoAppBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Consumer<ProfileProvider>(builder: (context,profileProvider,child){
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Stack( 
                  children: [
                    Center(
                      child: Container(
                        height: 100,
                        width: 100,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100)
                        ),
                        child: profileProvider.selectedImage != null ?Image.file(File("${profileProvider.selectedImage?.path}",),fit: BoxFit.cover,) :Image.network("https://eguru.volansoft.in/uploads/course/1713777256713_courses-01.jpg",fit: BoxFit.cover,),
                      ),
                    ),
                    Center(
                      child: SizedBox(
                        width: 38,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 75,
                            ),
                            InkWell(
                              onTap: ()async{
                                showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return Container(
                                        padding:
                                        const EdgeInsets.only(
                                            left: 10, top: 10),
                                        height: 170,
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment
                                              .start,
                                          children: [
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Padding(
                                              padding:
                                              const EdgeInsets
                                                  .only(
                                                  left: 20),
                                              child: Text(
                                                "Open With",
                                                style: TextStyle(
                                                    fontSize: 18),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            Row(
                                              children: [
                                                const SizedBox(
                                                  width: 20,
                                                ),
                                                InkWell(
                                                 onTap: ()async{
                                                   final ImagePicker picker = ImagePicker();
                                                   // Pick an image.
                                                   final XFile? image = await picker.pickImage(source: ImageSource.camera);
                                                   if(image !=null){
                                                     Navigator.pop(context);
                                                     profileProvider.changeProImage(image);
                                                     showDialog(context: context, builder: (context){
                                                       return AlertDialog(
                                                         title: Text("Do you want to Update Profile?",style: TextStyle(fontSize: 16),),
                                                         content: Row(
                                                           mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                           children: [
                                                             CustoElevatButton(textWidget: Text("No"),onTap: (){
                                                               profileProvider.changeProImage(null);
                                                               Navigator.pop(context);
                                                             },),
                                                             CustoElevatButton(textWidget: Text("Yes"),onTap: (){
                                                               Navigator.pop(context);
                                                             },)
                                                           ],
                                                         ),
                                                       ) ;
                                                     });
                                                   }
                                                 },
                                                  child: Column(
                                                    children: [
                                                      Image.asset(
                                                          height:
                                                          65,
                                                          "assets/images/camera.png"),
                                                      Text("Camera")
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 25,
                                                ),
                                                InkWell(
                                                 onTap: ()async{
                                                   final ImagePicker picker = ImagePicker();
                                                   // Pick an image.
                                                   final XFile? image = await picker.pickImage(source: ImageSource.gallery);
                                                   if(image !=null){
                                                     Navigator.pop(context);
                                                     profileProvider.changeProImage(image);
                                                     showDialog(context: context, builder: (context){
                                                       return AlertDialog(
                                                         title: Text("Do you want to Update Profile?",style: TextStyle(fontSize: 16),),
                                                         content: Row(
                                                           mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                           children: [
                                                             CustoElevatButton(textWidget: Text("No"),onTap: (){
                                                               profileProvider.changeProImage(null);
                                                               Navigator.pop(context);
                                                             },),
                                                             CustoElevatButton(textWidget: Text("Yes"),onTap: (){
                                                               Navigator.pop(context);
                                                             },)
                                                           ],
                                                         ),
                                                       ) ;
                                                     });
                                                   }
                                                 },
                                                  child: Column(
                                                    children: [
                                                      Image.asset(
                                                          height:
                                                          65,
                                                          "assets/images/gellary.png"),
                                                      Text(
                                                          "Gellary")
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      );
                                    });


                              },
                              child: CircleAvatar(
                                child: Icon(Icons.edit,color: clrBlack,),
                                minRadius: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ) ,
                  ],
                ),
                // OutlinedButton(onPressed: (){}, child: Text("Edit")),
                SizedBox(
                  height: 20,
                ),
                CustoTextFieldWithLable(lable: "First Name",),
                SizedBox(
                  height: 20,
                ),
                CustoTextFieldWithLable(lable: "Last Name",),
                SizedBox(
                  height: 20,
                ),
                CustoTextFieldWithLable(lable: "Email",),
                SizedBox(
                  height: 20,
                ),
                CustoTextFieldWithLable(prefix: CountryCodePicker(
                  onChanged: print,
                  // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                  initialSelection: 'IT',
                  favorite: ['+91','IN'],
                  // optional. Shows only country name and flag
                  showCountryOnly: false,
                  // optional. Shows only country name and flag when popup is closed.
                  showOnlyCountryWhenClosed: false,
                  // optional. aligns the flag and the Text left
                  alignLeft: false,
                ),lable: "Phone",),
                SizedBox(
                  height: 20,
                ),
                CustoTextFieldWithLable(lable: "Address Line 1",),
                SizedBox(
                  height: 20,
                ),
                CustoTextFieldWithLable(lable: "Address Line 2 (Optional)",),
                SizedBox(
                  height: 20,
                ),
                CustoTextFieldWithLable(lable: "City",),
                SizedBox(
                  height: 20,
                ),
                CustoTextFieldWithLable(lable: "ZipCode",),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: double.maxFinite,
                  height: 50,
                  child: CustoElevatButton(textWidget: Text("Update Profile",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),onTap: (){

                  },),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
