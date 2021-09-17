import 'package:diamon_assorter/app/app_helper.dart';
import 'package:diamon_assorter/app/locator.dart';
import 'package:diamon_assorter/modal/UserData.dart';
import 'package:diamon_assorter/services/api_services.dart';
import 'package:diamon_assorter/util/common_pattern.dart';
import 'package:diamon_assorter/util/dialog_helper.dart';
import 'package:diamon_assorter/util/utility.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class CompanyRegisterViewModel extends BaseViewModel with AppHelper {
  final nameController = TextEditingController();
  final companyNameController = TextEditingController();
  final mobileController = TextEditingController();
  final interComController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final addressController = TextEditingController();
  final areaController = TextEditingController();
  final cityController = TextEditingController();
  final pincodeController = TextEditingController();
  final workAddressController = TextEditingController();
  final contactNameController = TextEditingController();
  final contactMobileController = TextEditingController();
  final contactEmailController = TextEditingController();

  bool nameError = false;
  bool companyNameError = false;
  bool mobileError = false;
  bool intercomError = false;
  bool emailError = false;
  bool passwordError = false;
  bool addreessError = false;
  bool areaError = false;
  bool cityError = false;
  bool pincodeError = false;
  bool workAddressError = false;
  bool contactNameError = false;
  bool contactMobileError = false;
  bool contactEmailError = false;


  final _apiService = locator<ApiService>();

  UserData _userData;

  UserData get userData => _userData;

  bool obsecureText = true;
  onPasswordVisibleclicked() {
    obsecureText = !obsecureText;
    notifyListeners();
  }
  void setUserData(UserData data) {
    _userData = data;
    notifyListeners();
  }

  initData(String registerAs) {
    _userData = UserData(registrationAs: registerAs);
  }

  void checkFeilds() {
    nameError = !RegExp(CommonPattern.name_regex).hasMatch(nameController.text);
    companyNameError = !RegExp(CommonPattern.addressRegex)
        .hasMatch(companyNameController.text);
    mobileError =
        !RegExp(CommonPattern.mobile_regex).hasMatch(mobileController.text);
    emailError =
        !RegExp(CommonPattern.email_regex).hasMatch(emailController.text);
    passwordError =
        !RegExp(CommonPattern.passwordRegex).hasMatch(passwordController.text);
    addreessError =
        !RegExp(CommonPattern.addressRegex).hasMatch(addressController.text);
    areaError = !RegExp(CommonPattern.name_regex).hasMatch(areaController.text);
    cityError = !RegExp(CommonPattern.name_regex).hasMatch(cityController.text);
    pincodeError =
        !RegExp(CommonPattern.pincodeRegex).hasMatch(pincodeController.text);
    workAddressError = !RegExp(CommonPattern.addressRegex)
        .hasMatch(workAddressController.text);
  }

  void submitClicked(BuildContext context, {Function onError}) {
    checkFeilds();
    myPrint(
        "$nameError && $companyNameError && $mobileError &  $intercomError && $emailError && $addreessError && $areaError &&$cityError && $pincodeError && $workAddressError && $contactNameError && $contactMobileError && $contactEmailError");
    if (!nameError &&
        !companyNameError &&
        !mobileError &&
        !intercomError &&
        !emailError &&
        !passwordError &&
        !addreessError &&
        !areaError &&
        !cityError &&
        !pincodeError &&
        !workAddressError &&
        !contactNameError &&
        !contactMobileError &&
        !contactEmailError) {
      _registerUser(context);
    } else {
      onError("Please Enter Require Details");
    }
  }

  _registerUser(BuildContext context) async {
    progressDialog("Please wait...", context);
    try {
      final response = await _apiService.registerUser(_userData);
      hideProgressDialog(context);
    } catch (e) {
      myPrint(e.toString());
      hideProgressDialog(context);
      DialogHelper.showErrorDialog(context, "Error", e.toString());
    }
  }

}
