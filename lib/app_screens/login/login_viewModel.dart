import 'package:diamon_assorter/app/app_helper.dart';
import 'package:diamon_assorter/app/locator.dart';
import 'package:diamon_assorter/app_screens/dashboard/dashboard.dart';
import 'package:diamon_assorter/prefrence_util/Prefs.dart';
import 'package:diamon_assorter/services/api_services.dart';
import 'package:diamon_assorter/util/dialog_helper.dart';
import 'package:diamon_assorter/util/utility.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class LoginViewModel extends BaseViewModel with AppHelper {
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  final _apiService = locator<ApiService>();

  bool userNameError = false;
  bool passwordError = false;

  void loginClicked(BuildContext context) async {
    myPrint("uersname " + userNameController.text);
    myPrint("password " + passwordController.text);
    if (userNameController.text.isEmpty) {
      showSnackBar(context, "Please Enter Username");
      return;
    }
    if (passwordController.text.isEmpty) {
      showSnackBar(context, "Please Enter Password");
      return;
    }

    try {
      progressDialog("Please wait...", context);
      final response = await _apiService.loginUser(
          userNameController.text, passwordController.text);
      hideProgressDialog(context);
      await Prefs.setLogin(true);
      Prefs.setUserId(response.data.id.toString());
     Utility.pushToDashBoard(context);
    } catch (e) {
      myPrint(e.toString());
      hideProgressDialog(context);
      DialogHelper.showErrorDialog(context, "Error", e.toString());
    }
  }

  showSnackBar(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(msg),
      behavior: SnackBarBehavior.floating,
    ));
  }
}
