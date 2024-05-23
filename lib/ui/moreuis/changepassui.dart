import 'package:flutter/material.dart';
import 'package:lms/providers/loginprovider.dart';
import 'package:lms/ui/components/custoappbar.dart';
import 'package:lms/ui/components/custoelevatbut.dart';
import 'package:lms/ui/components/custotextfieldwithlable.dart';
import 'package:lms/ui/components/textareaui.dart';
import 'package:lms/utils/colors.dart';
import 'package:provider/provider.dart';

class ChangePassUi extends StatefulWidget {
  const ChangePassUi({super.key});

  @override
  State<ChangePassUi> createState() => _ChangePassUiState();
}

class _ChangePassUiState extends State<ChangePassUi> {
  TextEditingController oldCon=TextEditingController();
  TextEditingController newCon=TextEditingController();
  TextEditingController conCon=TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<LoginProvider>(context,listen: false).initClean();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: custoAppBar(context),
      body: Consumer<LoginProvider>(builder: (context,loginProvider,child){
        return Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 14
          ),
          child: SingleChildScrollView(
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
                  child: Center(
                    child: Text("Change Password",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18,color: clrWhite),),
                  ),

                ),
                SizedBox(
                  height: 30,
                ),
                CustoTextFieldWithLable(controller: oldCon,lable: "Old Password",suficIcon: InkWell(onTap: (){loginProvider.changOldPassVisible(!loginProvider.oldPassVisible);},child:loginProvider.oldPassVisible?Icon(Icons.visibility_off) : Icon(Icons.visibility)),obscure: !loginProvider.oldPassVisible,),
                SizedBox(
                  height: 20,
                ),
                CustoTextFieldWithLable(lable: "New Password",controller: newCon,suficIcon: InkWell(onTap: (){loginProvider.changCreatPassVisible(!loginProvider.creatPassVisible);},child:loginProvider.creatPassVisible?Icon(Icons.visibility_off) : Icon(Icons.visibility)),obscure: !loginProvider.creatPassVisible),
                SizedBox(
                  height: 20,
                ),

                CustoTextFieldWithLable(lable:"Confirm Password" ,controller: conCon,suficIcon: InkWell(onTap: (){loginProvider.changConfirmPassVisible(!loginProvider.confirmPassVisible);},child:loginProvider.confirmPassVisible?Icon(Icons.visibility_off) : Icon(Icons.visibility)),obscure: !loginProvider.confirmPassVisible),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: double.maxFinite,
                  height: 45,
                  child: CustoElevatButton(
                    textWidget: Text("Submit",style: TextStyle(fontWeight: FontWeight.w600),),
                    onTap: (){
                      Navigator.pop(context);
                    },
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ) ;
      }),
    );
  }
}
