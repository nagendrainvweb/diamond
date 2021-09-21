import 'package:diamon_assorter/app/app_helper.dart';
import 'package:diamon_assorter/app/locator.dart';
import 'package:diamon_assorter/app_widget/app_textfield.dart';
import 'package:diamon_assorter/app_widget/button_widget.dart';
import 'package:diamon_assorter/services/api_services.dart';
import 'package:diamon_assorter/util/app_color.dart';
import 'package:diamon_assorter/util/app_image.dart';
import 'package:diamon_assorter/util/common_pattern.dart';
import 'package:diamon_assorter/util/dialog_helper.dart';
import 'package:diamon_assorter/util/utility.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key key}) : super(key: key);

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage>
    with AppHelper {
  final _emailController = TextEditingController();
  final _apiService = locator<ApiService>();

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
          AppTextfield(
            controller: _emailController,
            hint: "Email id",
            icon: Icons.mail_outline_outlined,
            obsecure: false,
            color: AppColors.whiteColor,
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtonView(
                  buttonText: "LOGIN",
                  color: AppColors.buttonColor,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                ButtonView(
                  buttonText: "SUBMIT",
                  color: AppColors.buttonColor,
                  onPressed: () {
                    final valid = RegExp(CommonPattern.email_regex)
                        .hasMatch(_emailController.text);
                    if (!valid) {
                      {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Please enter valid email id"),
                        ));
                        return;
                      }
                    }

                    _forgotPassword(_emailController.text);
                  },
                ),
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

  _forgotPassword(String email) async {
    try {
      progressDialog("Please wait...", context);
      final response = await _apiService.forgortPassword(email);
      hideProgressDialog(context);
      DialogHelper.showErrorDialog(context, "", response.message,
          showTitle: false, onOkClicked: () {
        Navigator.pop(context);
        Navigator.pop(context);
      });
    } catch (e) {
      myPrint(e.toString());
      hideProgressDialog(context);
      DialogHelper.showErrorDialog(context, "Error", e.toString());
    }
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
                SizedBox(
                  height: 30,
                ),
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
