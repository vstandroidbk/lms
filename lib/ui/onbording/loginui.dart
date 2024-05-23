import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lms/providers/loginprovider.dart';
import 'package:lms/ui/components/custoelevatbut.dart';
import 'package:lms/ui/components/custotextfieldwithlable.dart';
import 'package:lms/ui/navbar.dart';
import 'package:lms/ui/onbording/forgetpassui.dart';
import 'package:lms/ui/onbording/signupui.dart';
import 'package:lms/utils/colors.dart';
import 'package:provider/provider.dart';

class LoginUi extends StatefulWidget {
  const LoginUi({super.key});

  @override
  State<LoginUi> createState() => _LoginUiState();
}

class _LoginUiState extends State<LoginUi> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  @override
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
                SizedBox(
                  height: 10,
                ),
                Image.asset(
                  height: 350,
                  width: double.maxFinite,
                  "assets/images/login.png",
                  fit: BoxFit.contain,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Log In",
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
                CustoTextFieldWithLable(controller: emailController,lable: "Email",),
                SizedBox(
                  height: 30,
                ),
                Consumer<LoginProvider>(builder: (context,loginProvider,child){
                  return  CustoTextFieldWithLable(controller: passController,obscure:!loginProvider.creatPassVisible ,lable: "Password",suficIcon: InkWell(onTap: (){
                    loginProvider.changCreatPassVisible(!loginProvider.creatPassVisible);
                  },child:loginProvider.creatPassVisible?Icon(Icons.visibility_off) : Icon(Icons.visibility)),);
                }),
                SizedBox(
                  height: 10,
                ),
                Align(alignment: Alignment.centerRight,child: TextButton(onPressed: (){
                  Navigator.push(context, CupertinoPageRoute(builder: (context){
                    return ForgetPassUi() ;
                  }));
                },child: Text("Forgot your password?",style: TextStyle(fontSize: 15),))),
               SizedBox(width: double.maxFinite,height: 50,child: CustoElevatButton(onTap: (){
                 Navigator.push(context, CupertinoPageRoute(builder: (context){
                 return NavBar();
                 }));
               },textWidget: Text("Log In",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600),),)),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text("Don't have an account ?",style: TextStyle(fontSize: 15),),
                    TextButton(onPressed: (){
                      Navigator.push(context, CupertinoPageRoute(builder: (context){
                        return const RegisterUi() ;
                      }));
                    }, child: Text("Sign Up",style: TextStyle(decoration: TextDecoration.underline,fontSize: 15)))
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
