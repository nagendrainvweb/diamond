import 'dart:io';

import 'package:diamon_assorter/app/app_helper.dart';
import 'package:diamon_assorter/app/locator.dart';
import 'package:diamon_assorter/modal/UserData.dart';
import 'package:diamon_assorter/services/api_services.dart';
import 'package:diamon_assorter/util/app_color.dart';
import 'package:diamon_assorter/util/common_pattern.dart';
import 'package:diamon_assorter/util/constants.dart';
import 'package:diamon_assorter/util/dialog_helper.dart';
import 'package:diamon_assorter/util/utility.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';

class AsserterRegisterViewModel extends BaseViewModel with AppHelper {
  final nameController = TextEditingController();
  final mobileController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final agentController = TextEditingController();
  final addressController = TextEditingController();
  final areaController = TextEditingController();
  final cityController = TextEditingController();
  final pincodeController = TextEditingController();
  final experienceController = TextEditingController();
  final commissionController = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  File idCard, aadharCard, passport;
  String service, speed;

  bool nameError = false;
  bool mobileError = false;
  bool emailError = false;
  bool passwordError = false;
  bool agentError = false;
  bool addreessError = false;
  bool areaError = false;
  bool cityError = false;
  bool pincodeError = false;
  bool experienceError = false;

  var _serviceValue = 1;
  var _speedValue = 1;
  final _apiService = locator<ApiService>();

  UserData _userData;

  UserData get userData => _userData;
  void setUserData(UserData data) {
    _userData = data;
    notifyListeners();
  }

  initData(String registerAs) {
    _userData = UserData(registrationAs: registerAs);
  }

  void checkFeilds() {
    nameError = !RegExp(CommonPattern.name_regex).hasMatch(nameController.text);
    mobileError =
        !RegExp(CommonPattern.mobile_regex).hasMatch(nameController.text);
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
    experienceError = experienceController.text.isEmpty;

  }

  bool obsecureText = true;
  onPasswordVisibleclicked() {
    obsecureText = !obsecureText;
    notifyListeners();
  }
  void submitClicked(BuildContext context, {Function onError}) {
    checkFeilds();
    if (!nameError &&
        !mobileError &&
        !emailError &&
        !passwordError &&
        !addreessError &&
        !areaError &&
        !cityError &&
        !pincodeError &&
        !experienceError) {
      _registerUser(context);
    } else {
      onError("Please Enter Require Details");
    }
  }

  _registerUser(BuildContext context) async {
    progressDialog("Please wait...", context);
    String service;
    if (_serviceValue == 1) {
      service = "Numbering";
    } else if (_serviceValue == 2) {
      service = "Ghodhi";
    } else {
      service = "Numbering/Ghodhi";
    }
    String speed;
    if (_serviceValue == 1) {
      speed = "Slow";
    } else if (_serviceValue == 2) {
      speed = "Medium";
    } else {
      speed = "Fast";
    }
    _userData.bdbIdCard = idCard.path;
    _userData.aadharCard = aadharCard.path;
    _userData.passport = passport.path;
    _userData.service = service;
    _userData.speed = speed;
    try {
      final response = await _apiService.registerUser(_userData);
      hideProgressDialog(context);
    } catch (e) {
      myPrint(e.toString());
      hideProgressDialog(context);
      DialogHelper.showErrorDialog(context, "Error", e.toString());
    }
  }

  void setServiceValue(int value) {
    _serviceValue = value;
    notifyListeners();
  }

  void setSpeedValue(int value) {
    _speedValue = value;
    notifyListeners();
  }

  int get serviceValue => _serviceValue;
  int get speedValue => _speedValue;

  void selectImage(BuildContext context, Function onItemClicked) {
    showModalBottomSheet(
        context: context,
        builder: (context) => Container(
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                ListTile(
                  title: Text("Camera"),
                  leading: Icon(Icons.camera_alt_outlined),
                  onTap: () {
                    Navigator.pop(context);

                    onItemClicked(ImageSource.camera);
                    //pickImage(, targatedFile);
                  },
                ),
                Container(height: 0.7, color: AppColors.grey400),
                ListTile(
                  title: Text("Gallery"),
                  leading: Icon(Icons.insert_photo_outlined),
                  onTap: () {
                    Navigator.pop(context);
                    onItemClicked(ImageSource.gallery);
                    //pickImage(ImageSource.gallery, targatedFile);
                  },
                )
              ]),
            ));
  }

  pickImage(ImageSource source, String targatedFile) async {
    final XFile pickedFile = await _picker.pickImage(
      source: source,
      imageQuality: 50,
    );
    if (targatedFile == Constants.BOB_ID) {
      idCard = new File(pickedFile.path);
      myPrint("inside idard");
    }
    if (targatedFile == Constants.AADHAR_CARD) {
      aadharCard = new File(pickedFile.path);
      myPrint("inside aadhar card");
    }
    if (targatedFile == Constants.PASSPORT) {
      passport = new File(pickedFile.path);
      myPrint("inside passport");
    }

    notifyListeners();
  }

  void removeImage(String targatedFile) {
    if (targatedFile == Constants.BOB_ID) {
      idCard = null;
    }
    if (targatedFile == Constants.AADHAR_CARD) {
      aadharCard = null;
    }
    if (targatedFile == Constants.PASSPORT) {
      passport = null;
    }
    notifyListeners();
  }
}
