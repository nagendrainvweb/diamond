import 'package:diamon_assorter/app/app_helper.dart';
import 'package:diamon_assorter/app/app_repo.dart';
import 'package:diamon_assorter/app/locator.dart';
import 'package:diamon_assorter/app_screens/dashboard/dashboard.dart';
import 'package:diamon_assorter/app_screens/login/otp_page.dart';
import 'package:diamon_assorter/modal/UserData.dart';
import 'package:diamon_assorter/prefrence_util/Prefs.dart';
import 'package:diamon_assorter/services/api_services.dart';
import 'package:diamon_assorter/util/common_pattern.dart';
import 'package:diamon_assorter/util/dialog_helper.dart';
import 'package:diamon_assorter/util/utility.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

class LoginViewModel extends BaseViewModel with AppHelper {
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final mobileController = TextEditingController();
  final otpController = TextEditingController();

  final _apiService = locator<ApiService>();

  bool userNameError = false;
  bool passwordError = false;
  bool mobileError = false;
  bool loginWithOTP = true;
  bool otpError = false;
  bool haveOtp = false;

  UserData _userData;

  setLoginWithOtp() {
    loginWithOTP = !loginWithOTP;
    notifyListeners();
  }

  setHaveOtp(bool value) {
    haveOtp = value;
    notifyListeners();
  }

  void loginOtpClicked(BuildContext context) async {
    final valid =
        !RegExp(CommonPattern.mobile_regex).hasMatch(mobileController.text);
    if (!valid) {
      // showSnackBar(context, "Coming soon...");
      try {
        progressDialog("Please wait...", context);
        final response =
            await _apiService.loginUserWithNumber(mobileController.text);
        hideProgressDialog(context);
        myPrint("otp is " + response.data.otp);
        haveOtp = true;
        _userData = response.data;
        notifyListeners();
        // await Prefs.setLogin(true);
        // await Prefs.setUserId(response.data.userId.toString());
        // await Prefs.setName(response.data.name);
        // await Prefs.setEmailId(response.data.email);
        // await Prefs.setMobileNumber(response.data.mobile);
        // await Prefs.setRole(response.data.registrationAs);
        // Provider.of<AppRepo>(context, listen: false).setUserData(response.data);

        // Utility.pushToDashBoard(context);
        _showOtpDialog(context, _userData.otp, onVerifyDone: () {
          setLogin(context);
        }, onResendClicked: () {
          Navigator.pop(context);
          loginOtpClicked(context);
        });
      } catch (e) {
        myPrint(e.toString());
        hideProgressDialog(context);
        DialogHelper.showErrorDialog(context, "Error", e.toString());
      }
    } else {
      showSnackBar(context, "Please Enter Valid Mobile Number");
    }
  }

  _showOtpDialog(BuildContext context, String otp,
      {Function onVerifyDone, Function onResendClicked}) {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.horizontal(
          left: Radius.circular(20),
          right: Radius.circular(20),
        )),
        isScrollControlled: true,
        isDismissible: false,
        builder: (context) {
          return OtpPage(
              otp: otp,
              onVerifyClicked: onVerifyDone,
              onResendClicked: onResendClicked);
        });
  }

  setLogin(BuildContext context) async {
    await Prefs.setLogin(true);
    await Prefs.setUserId(_userData.userId.toString());
    await Prefs.setName(_userData.name);
    await Prefs.setEmailId(_userData.email);
    await Prefs.setMobileNumber(_userData.mobile);
    await Prefs.setRole(_userData.registrationAs);
    Provider.of<AppRepo>(context, listen: false).setUserData(_userData);
    Provider.of<AppRepo>(context, listen: false).init();

    Utility.pushToDashBoard(context);
  }

  void loginPasswordClicked(BuildContext context) async {
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
      await Prefs.setUserId(response.data.userId.toString());
      await Prefs.setName(response.data.name);
      await Prefs.setEmailId(response.data.email);
      await Prefs.setMobileNumber(response.data.mobile);
      await Prefs.setRole(response.data.registrationAs);
      Provider.of<AppRepo>(context, listen: false).setUserData(response.data);
      Provider.of<AppRepo>(context, listen: false).init();

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
