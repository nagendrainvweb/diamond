import 'package:diamon_assorter/app_widget/app_textfield.dart';
import 'package:diamon_assorter/app_widget/button_widget.dart';
import 'package:diamon_assorter/util/app_color.dart';
import 'package:diamon_assorter/util/app_image.dart';
import 'package:flutter/material.dart';
class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({ Key key }) : super(key: key);

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {

  _buildTop() {
    return Container(
      
       
      
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AppImages.logo,
            height: 150,
           // width: 150,
            fit: BoxFit.contain,
          )
        ],
      ),
    );
  }
  _loginView() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 40,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Text(
              "FORGOT PASSWORD",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: AppColors.whiteColor,
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          AppTextfield(hint: "USERNAME",icon: Icons.person_outline_outlined, obsecure: false,color: AppColors.whiteColor,),
          SizedBox(
            height: 20,
          ),
          AppTextfield(hint: "Mobile no./Email id",icon: Icons.mail_outline_outlined, obsecure: false,color: AppColors.whiteColor,),
          SizedBox(
            height: 40,
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtonView(buttonText: "SUBMIT",color: AppColors.buttonColor,onPressed: (){},),
                ButtonView(buttonText: "LOGIN", color: AppColors.buttonColor,onPressed: (){},),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
         
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
       body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 30,),
                _buildTop(),
                SizedBox(
                  height: 50,
                ),
                _loginView(),
                SizedBox(
                  height: 20,
                ),
               
              ],
            ),
          ),

        ],
      ),
    );
  }
}