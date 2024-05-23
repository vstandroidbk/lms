import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lms/ui/components/custoelevatbut.dart';
import 'package:lms/ui/components/custotextfieldwithlable.dart';
import 'package:lms/ui/onbording/signupui.dart';
import 'package:lms/utils/colors.dart';

class ForgetPassUi extends StatefulWidget {
  const ForgetPassUi({super.key});

  @override
  State<ForgetPassUi> createState() => _ForgetPassUiState();
}

class _ForgetPassUiState extends State<ForgetPassUi> {
  TextEditingController emailController = TextEditingController();
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
                  height: 400,
                  width: double.maxFinite,
                  "assets/images/splashImage.png",
                  fit: BoxFit.contain,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Forgot Password",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "We will send you a OTP code to recover your password",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  height: 30,
                ),
                CustoTextFieldWithLable(controller: emailController,lable: "Email",),
                SizedBox(
                  height: 30,
                ),
               SizedBox(width: double.maxFinite,height: 50,child: CustoElevatButton(onTap: (){},textWidget: Text("Proceed Next",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600),),)),
                SizedBox(
                  height: 10,
                ),
                // Row(
                //   children: [
                //     Text("Don't have an account ?",style: TextStyle(fontSize: 15),),
                //     TextButton(onPressed: (){
                //       Navigator.push(context, CupertinoPageRoute(builder: (context){
                //         return const RegisterUi() ;
                //       }));
                //     }, child: Text("Sign Up",style: TextStyle(decoration: TextDecoration.underline,fontSize: 15)))
                //   ],
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
