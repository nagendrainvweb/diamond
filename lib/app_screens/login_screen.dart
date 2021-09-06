import 'package:diamon_assorter/app_screens/dashboard/dashboard.dart';
import 'package:diamon_assorter/app_widget/app_textfield.dart';
import 'package:diamon_assorter/app_widget/button_widget.dart';
import 'package:diamon_assorter/util/app_color.dart';
import 'package:diamon_assorter/util/app_image.dart';
import 'package:diamon_assorter/util/utility.dart';
import 'package:flutter/material.dart';

import 'forgot_password/forgot_password_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  _buildTop() {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        color: AppColors.mainColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(35),
          bottomRight: Radius.circular(35),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
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
              "LOGIN",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35,
                color: AppColors.buttonColor,
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          AppTextfield(
            hint: "USERNAME",
            icon: Icons.person_outline_outlined,
            obsecure: false,
            color: AppColors.mainColor,
          ),
          SizedBox(
            height: 10,
          ),
          AppTextfield(
            hint: "PASSWORD",
            icon: Icons.lock_open_outlined,
            obsecure: true,
            color: AppColors.mainColor,
          ),
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
                ButtonView(
                  buttonText: "NEW USER",
                  color: AppColors.buttonColor,
                  onPressed: () {},
                ),
                ButtonView(
                  buttonText: "LOGIN",
                  color: AppColors.buttonColor,
                  onPressed: () {
                    Utility.pushToNext(context, DashBoardPage());
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ButtonView(
            buttonText: "FORGOT PASSWORD",
            color: AppColors.buttonColor,
            onPressed: () {
              Utility.pushToNext(context, ForgotPasswordPage());
            },
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
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.buttonColor,
              ),
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
