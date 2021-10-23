import 'package:diamon_assorter/app_screens/dashboard/dashboard.dart';
import 'package:diamon_assorter/app_screens/login/login_viewModel.dart';
import 'package:diamon_assorter/app_screens/login/otp_page.dart';
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
  bool obsecure = true;


  _loginView(LoginViewModel model) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 40,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
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
          Visibility(
              visible: model.loginWithOTP, child: mobileLoginView(model)),
          Visibility(
              visible: !model.loginWithOTP, child: _passwordLoginView(model)),
          SizedBox(
            height: 20,
          ),
          ButtonView(
            buttonText: "Login",
            color: AppColors.buttonColor,
            onPressed: () {
              
              if(model.loginWithOTP){
                  model.loginOtpClicked(context);
              }else{
                  model.loginPasswordClicked(context);
              }
            },
          ),
          SizedBox(
            height: 20,
          ),
          Center(
              child: Text(
            " ----------- OR ----------",
            style: TextStyle(
                color: AppColors.grey600, fontWeight: FontWeight.bold),
          )),
          SizedBox(
            height: 20,
          ),
          ButtonView(
            buttonText:
                (model.loginWithOTP) ? "Login With Password" : "Login With OTP",
            color: AppColors.buttonColor,
            onPressed: () {
              model.setLoginWithOtp();
            },
          ),
          SizedBox(
            height: 30,
          ),
          TextButton(
              onPressed: () {
                Utility.pushToNext(context, RegistrationPage());
              },
              child: Text(
                "Don't have account? Sign up",
              )),
        ],
      ),
    );
  }

  mobileLoginView(LoginViewModel model) {
    return Column(
      children: [
        AppTextfield(
          controller: model.mobileController,
          hint: "Enter Mobile No",
          keyboardType: TextInputType.number,
          icon: Icons.phone_android_outlined,
          obsecure: false,
          color: AppColors.mainColor,
          onChanged: (String value) {},
        ),
        // (model.haveOtp)?  Column(
        //     children: [
        //       SizedBox(height: 20,),
        //       AppTextfield(
        //     controller: model.otpController,
        //     hint: "Enter OTP",
        //     keyboardType: TextInputType.number,
        //     icon: Icons.lock_outline_rounded,
        //     obsecure: false,
        //     color: AppColors.mainColor,
        //     errorText: model.otpError ? "Please Enter Valid OTP":null,
        //     onChanged: (String value) {},
        //   ),
        //     ],
        //   ):Container()
      ],
    );
  }

  _passwordLoginView(LoginViewModel model) {
    return Column(
      children: [
        AppTextfield(
          controller: model.userNameController,
          hint: "Email Id",
          icon: Icons.person_outline_outlined,
          obsecure: false,
          color: AppColors.mainColor,
          onChanged: (String value) {},
        ),
        SizedBox(
          height: 15,
        ),
        AppTextfield(
          controller: model.passwordController,
          hint: "Password",
          icon: Icons.lock_open_outlined,
          obsecure: obsecure,
          showIcon: true,
          color: AppColors.mainColor,
          suffixIcon: obsecure ? Icons.visibility : Icons.visibility_off,
          onIconClicked: () {
            setState(() {
              obsecure = !obsecure;
            });
          },
          onChanged: (String value) {},
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  Utility.pushToNext(context, ForgotPasswordPage());
                },
                child: Text("Forgot password ?"))
            // ButtonView(
            //   buttonText: "FORGOT PASSWORD",
            //   color: AppColors.buttonColor,
            //   onPressed: () {
            //     Utility.pushToNext(context, ForgotPasswordPage());
            //   },
            // ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(),
      builder: (_, model, child) => Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AppAppBar(),
                  // Image.asset(
                  //     AppImages.logo,
                  // height: 80,
                  // // width: 150,
                  // fit: BoxFit.contain,
                  // ),
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
          ],
        ),
      ),
    );
  }
}
