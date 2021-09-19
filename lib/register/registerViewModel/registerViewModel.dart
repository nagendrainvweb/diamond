import 'dart:io';

import 'package:diamon_assorter/app/locator.dart';
import 'package:diamon_assorter/modal/UserData.dart';
import 'package:diamon_assorter/modal/address_data.dart';
import 'package:diamon_assorter/modal/assorter_modal.dart';
import 'package:diamon_assorter/services/api_services.dart';
import 'package:diamon_assorter/util/app_color.dart';
import 'package:diamon_assorter/util/app_helper.dart';
import 'package:diamon_assorter/util/common_pattern.dart';
import 'package:diamon_assorter/util/constants.dart';
import 'package:diamon_assorter/util/dialog_helper.dart';
import 'package:diamon_assorter/util/utility.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';

class RegistrationViewModel extends BaseViewModel with AppHelper {
  final nameController = TextEditingController();
  final mobileController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final agentController = TextEditingController();
  final experienceController = TextEditingController();
  final commissionController = TextEditingController();

  //
  final contactNameController = TextEditingController();
  final contactMobileController = TextEditingController();
  final contactEmailController = TextEditingController();
  final interComController = TextEditingController();
  final companyNameController = TextEditingController();

  final ImagePicker _picker = ImagePicker();
  List<AssorterModal> assorterList = [];
  List<AddressData> addressList = [];

  File idCard, aadharCard, passport;
  String service, speed;

  bool nameError = false;
  bool mobileError = false;
  bool emailError = false;
  bool passwordError = false;
  bool agentError = false;
  bool experienceError = false;
  //
  bool contactNameError = false;
  bool contactMobileError = false;
  bool contactEmailError = false;
  bool companyNameError = false;
  bool intercomError = false;
  bool commissionError = false;

  var _serviceValue = 1;
  var _speedValue = 1;
  final _apiService = locator<ApiService>();

  UserData _userData;
  ContactPerson _contactPerson;
  AddressData _agentAddressData;
  AddressData _assorterAddressData;

  UserData get userData => _userData;
  void setUserData(UserData data) {
    _userData = data;
    notifyListeners();
  }

  ContactPerson get contactPerson => _contactPerson;
  void setContactPerson(ContactPerson data) {
    _contactPerson = data;
    notifyListeners();
  }

  AddressData get agentAddressData => _agentAddressData;
  void setAgentAddressData(AddressData data) {
    _agentAddressData = data;
    notifyListeners();
  }

  AddressData get assorterAddressData => _assorterAddressData;
  void setAssorterAddressData(AddressData data) {
    _assorterAddressData = data;
    notifyListeners();
  }

  initData(String registerAs) {
    _userData = UserData(registrationAs: registerAs);
    _contactPerson = ContactPerson();
    _agentAddressData = AddressData();
    _agentAddressData.addressType = Constants.OFFICE;
    _assorterAddressData = AddressData();
    _assorterAddressData.addressType = Constants.HOME;
  }

  void checkCompanyFeilds() {
    nameError = !RegExp(CommonPattern.name_regex).hasMatch(nameController.text);
    companyNameError = !RegExp(CommonPattern.addressRegex)
        .hasMatch(companyNameController.text);
    mobileError =
        !RegExp(CommonPattern.mobile_regex).hasMatch(mobileController.text);
    emailError =
        !RegExp(CommonPattern.email_regex).hasMatch(emailController.text);
    passwordError =
        !RegExp(CommonPattern.passwordRegex).hasMatch(passwordController.text);
  }

  bool obsecureText = true;
  onPasswordVisibleclicked() {
    obsecureText = !obsecureText;
    notifyListeners();
  }

  void companySubmitClicked(BuildContext context, {Function onError}) async {
    // checkCompanyFeilds();
    // if (addressList.isEmpty) {
    //   onError("Please Enter at least 1 Address");
    //   return;
    // }
    // if (!nameError &&
    //     !mobileError &&
    //     !emailError &&
    //     !passwordError &&
    //     !experienceError) {
    //   _userData.bdbIdCard = idCard.path;
    //   _userData.address = addressList;aci
    //   _userData.contactPerson = _contactPerson;

    //   _registerUser(context);
    // } else {
    //   onError("Please Enter Require Details");
    // }
    final response = await _apiService.fetchAgentList();
  }

  void checkAgentFeilds() {
    nameError = !RegExp(CommonPattern.name_regex).hasMatch(nameController.text);
    companyNameError = !RegExp(CommonPattern.addressRegex)
        .hasMatch(companyNameController.text);
    mobileError =
        !RegExp(CommonPattern.mobile_regex).hasMatch(mobileController.text);
    emailError =
        !RegExp(CommonPattern.email_regex).hasMatch(emailController.text);
    passwordError =
        !RegExp(CommonPattern.passwordRegex).hasMatch(passwordController.text);
    commissionError = commissionController.text.isEmpty;
  }

  void agentSubmitClicked(BuildContext context, {Function onError}) {
    checkAgentFeilds();
    if (!_agentAddressData.validateAddress(onError: onError)) {
      return;
    }
    if (!nameError &&
        !mobileError &&
        !emailError &&
        !passwordError &&
        !experienceError) {
      _userData.bdbIdCard = idCard.path;
      _userData.address = [_agentAddressData];
      _userData.assorters = assorterList;

      _registerUser(context);
    } else {
      onError("Please Enter Require Details");
    }
  }

  void checkAssorterFeilds() {
    nameError = !RegExp(CommonPattern.name_regex).hasMatch(nameController.text);
    mobileError =
        !RegExp(CommonPattern.mobile_regex).hasMatch(nameController.text);
    emailError =
        !RegExp(CommonPattern.email_regex).hasMatch(emailController.text);
    passwordError =
        !RegExp(CommonPattern.passwordRegex).hasMatch(passwordController.text);
    experienceError = experienceController.text.isEmpty;
  }

  void assorterSubmitClicked(BuildContext context, {Function onError}) {
    checkAssorterFeilds();
    if (!_assorterAddressData.validateAddress(onError: onError)) {
      return;
    }
    if (!nameError &&
        !mobileError &&
        !emailError &&
        !passwordError &&
        !experienceError) {
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
      _userData.address = [_assorterAddressData];

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

  onDeleteClicked(AssorterModal data) {
    assorterList.remove(data);
    notifyListeners();
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

  void onAseerterAddedClicked(String name, String mobile, String email) {
    assorterList.add(new AssorterModal(
        name: name, mobile: mobile, email: email, id: assorterList.length + 1));
    notifyListeners();
  }

  void onEditAseertor(AssorterModal data) {
    final index = assorterList.indexOf(data);
    assorterList[index] = data;
    notifyListeners();
  }

  void onAddressAddedClicked(AddressData data) {
    data.id = addressList.length + 1;
    addressList.add(data);
    notifyListeners();
  }

  void onEditAddress(AddressData data) {
    final index = addressList.indexOf(data);
    addressList[index] = data;
    notifyListeners();
  }

  onAddressDeleteClicked(AddressData data) {
    addressList.remove(data);
    notifyListeners();
  }
}
