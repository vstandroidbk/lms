import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lms/providers/loginprovider.dart';
import 'package:lms/ui/components/custoelevatbut.dart';
import 'package:lms/ui/components/custotextfieldwithlable.dart';
import 'package:provider/provider.dart';

class RegisterUi extends StatefulWidget {
  const RegisterUi({super.key});

  @override
  State<RegisterUi> createState() => _RegisterUiState();
}

class _RegisterUiState extends State<RegisterUi> {
  TextEditingController emailController = TextEditingController();
  TextEditingController fnameController = TextEditingController();
  TextEditingController lNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController conPassController = TextEditingController();
  void initState() {
    Provider.of<LoginProvider>(context,listen: false).initClean();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),

                Center(
                  child: Image.asset(
                    height: 100,
                    width: 200,//double.maxFinite,
                    "assets/images/logo.png",
                    fit: BoxFit.contain,
                  ),
                ),

                Text(
                  "Sign Up",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "consectetur adipiscing elit, sed do eiusmod tempor.",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  height: 30,
                ),
                CustoTextFieldWithLable(controller: fnameController,lable: "First Name",),
                SizedBox(
                  height: 30,
                ),
                CustoTextFieldWithLable(controller: lNameController,lable: "Last Name",),
                SizedBox(
                  height: 30,
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
                ),ktype: TextInputType.number,hidePtandDot: true,controller: phoneController,lable: "Phone Number",),
                SizedBox(
                  height: 30,
                ),
                CustoTextFieldWithLable(controller: emailController,lable: "Email",),
                SizedBox(
                  height: 30,
                ),

                Consumer<LoginProvider>(builder: (context,loginProvider,child){
                  return CustoTextFieldWithLable(obscure:!loginProvider.creatPassVisible,controller: passController,lable: "Create Password",suficIcon: InkWell(onTap: (){
                    loginProvider.changCreatPassVisible(!loginProvider.creatPassVisible);
                  },child:loginProvider.creatPassVisible?Icon(Icons.visibility_off) : Icon(Icons.visibility)),);
                }),
                SizedBox(
                  height: 30,
                ),
                Consumer<LoginProvider>(builder: (context,loginProvider,child){
                  return CustoTextFieldWithLable(obscure:!loginProvider.confirmPassVisible,controller: conPassController,lable: "Confirm Password",suficIcon: InkWell(onTap: (){
                    loginProvider.changConfirmPassVisible(!loginProvider.confirmPassVisible);
                  },child:loginProvider.confirmPassVisible?Icon(Icons.visibility_off) : Icon(Icons.visibility)),);
                }),

                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Consumer<LoginProvider>(builder: (context,loginProvider,child){
                      return Checkbox(value: loginProvider.acceptCon, onChanged: (val){
                        loginProvider.changAccptCond(val);
                      });
                    }),
                    Flexible(child: Text("I accept and agree to the Terms & Condition and Privacy of LMS")),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(width: double.maxFinite,height: 50,child: CustoElevatButton(onTap: (){},textWidget: Text("Sign Up",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600),),)),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?",style: TextStyle(fontSize: 15),),
                    TextButton(onPressed: (){
                      Navigator.pop(context);
                    }, child: Text("Log In",style: TextStyle(decoration: TextDecoration.underline,fontSize: 15)))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
