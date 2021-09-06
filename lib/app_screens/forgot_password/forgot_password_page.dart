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
      height: 150,
      
       
      
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
            height: 10,
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
  _builBottom(IconData icon) {
    return Container(
      height: 30,
      child: Icon(
        icon,
        color: Colors.white,
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
          Align(
            alignment: Alignment.bottomCenter,
            child:  Container(
                  decoration:BoxDecoration(
                    color: AppColors.buttonColor,
                  ) ,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _builBottom(Icons.person_outline_outlined),
                      _builBottom(Icons.call),
                    ],
                  ),
                ),
          )
        ],
      ),
    );
  }
}