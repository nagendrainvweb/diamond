import 'package:diamon_assorter/app_screens/dashboard/dashboard.dart';
import 'package:diamon_assorter/app_screens/login/login_viewModel.dart';
import 'package:diamon_assorter/app_widget/app_appbar.dart';
import 'package:diamon_assorter/app_widget/app_textfield.dart';
import 'package:diamon_assorter/app_widget/button_widget.dart';
import 'package:diamon_assorter/register/register_page.dart';
import 'package:diamon_assorter/util/app_color.dart';
import 'package:diamon_assorter/util/app_image.dart';
import 'package:diamon_assorter/util/utility.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../forgot_password/forgot_password_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  _loginView(LoginViewModel model) {
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
            height: 15,
          ),
          AppTextfield(
            hint: "PASSWORD",
            icon: Icons.lock_open_outlined,
            obsecure: true,
            color: AppColors.mainColor,
          ),
          SizedBox(
            height: 30,
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
                  onPressed: () {
                    Utility.pushToNext(context, RegistrationPage());
                  },
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
            height: 20,
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

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: ()=> LoginViewModel(),
      builder: (_,model,child)=>
       Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AppAppBar(),
                  SizedBox(
                    height: 50,
                  ),
                  _loginView(model),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            // Align(
            //   alignment: Alignment.bottomCenter,
            //   child: Container(
            //     decoration: BoxDecoration(
            //       color: AppColors.buttonColor,
            //     ),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceAround,
            //       children: [
            //         _builBottom(Icons.person_outline_outlined),
            //         _builBottom(Icons.call),
            //       ],
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
