import 'dart:io';

import 'package:diamon_assorter/app/app_repo.dart';
import 'package:diamon_assorter/app/locator.dart';
import 'package:diamon_assorter/app_screens/dashboard/dashboard.dart';
import 'package:diamon_assorter/modal/UserData.dart';
import 'package:diamon_assorter/modal/address_data.dart';
import 'package:diamon_assorter/modal/assorter_modal.dart';
import 'package:diamon_assorter/prefrence_util/Prefs.dart';
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
  final confirmPasswordController = TextEditingController();
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
  bool confirmPasswordError = false;
  bool agentError = false;
  bool experienceError = false;
  //
  bool contactNameError = false;
  bool contactMobileError = false;
  bool contactEmailError = false;
  bool companyNameError = false;
  bool intercomError = false;
  bool commissionError = false;

  bool emailVerified = false;
  bool contactEmailVerified = false;

  var _serviceValue = 1;
  var _speedValue = 1;
  final _apiService = locator<ApiService>();

  UserData _userData;
  ContactPerson _contactPerson;
  AddressData _agentAddressData;
  AddressData _assorterAddressData;
  String selectedAgent;
  AppRepo repo;
  bool obsecureText = true;
  bool confirmObsecureText = true;

  bool _consentValue = false;

  UserData get userData => _userData;
  void setUserData(UserData data) {
    _userData = data;
    notifyListeners();
  }

  setSelectedAgent(String value) {
    selectedAgent = value;
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

  bool get consentValue => _consentValue;
  void setConsentValue(bool value) {
    _consentValue = value;
    notifyListeners();
  }

  AddressData get assorterAddressData => _assorterAddressData;
  void setAssorterAddressData(AddressData data) {
    _assorterAddressData = data;
    notifyListeners();
  }

  initData(String registerAs, AppRepo irepo) {
    _userData = UserData(registrationAs: registerAs);
    _contactPerson = ContactPerson();
    _agentAddressData = AddressData();
    _agentAddressData.addressType = Constants.OFFICE;
    _assorterAddressData = AddressData();
    _assorterAddressData.addressType = Constants.HOME;
    repo = irepo;
  }

  void checkCompanyFeilds() {
    nameError = !RegExp(CommonPattern.name_regex).hasMatch(nameController.text);
    // companyNameError = !RegExp(CommonPattern.addressRegex)
    //     .hasMatch(companyNameController.text);
    mobileError =
        !RegExp(CommonPattern.mobile_regex).hasMatch(mobileController.text);
    emailError =
        !RegExp(CommonPattern.email_regex).hasMatch(emailController.text);
    passwordError =
        !RegExp(CommonPattern.passwordRegex).hasMatch(passwordController.text);

    // contactNameError =
    //     !RegExp(CommonPattern.name_regex).hasMatch(contactNameController.text);
    // contactMobileError = !RegExp(CommonPattern.mobile_regex)
    //     .hasMatch(contactMobileController.text);
    // contactEmailError = !RegExp(CommonPattern.email_regex)
    //     .hasMatch(contactEmailController.text);
    notifyListeners();
  }

  onPasswordVisibleclicked() {
    obsecureText = !obsecureText;
    notifyListeners();
  }
    onConfirmPasswordVisibleclicked() {
    confirmObsecureText = !confirmObsecureText;
    notifyListeners();
  }

  void companySubmitClicked(BuildContext context, {Function onError}) async {
    checkCompanyFeilds();

    if (!nameError &&
        !mobileError &&
        !emailError &&
        !passwordError) {
      if (passwordController.text != confirmPasswordController.text) {
        onError("Password and confirm password must be same");
        return;
      }
       if (!consentValue) {
        onError("Please agree our terms and conditions");
        return;
      }

      // _userData.address = addressList;
      // _userData.contactPerson = _contactPerson;
      // _userData.fileList = (idCard != null) ? [idCard] : [];

      _registerUser(context);
    } else {
      onError("Please Enter Require Details");
    }
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

    notifyListeners();
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
      //_userData.bdbIdCard = idCard.path;
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

    notifyListeners();
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
      // _userData.bdbIdCard = idCard.path;
      // _userData.aadharCard = aadharCard.path;
      // _userData.passport = passport.path;
      _userData.service = service;
      _userData.speed = speed;
      _userData.address = [_assorterAddressData];
      final index = repo.agentList
          .indexWhere((element) => element.agentName == selectedAgent);
      _userData.agent = index;
    } else {
      onError("Please Enter Require Details");
    }
  }

  _registerUser(BuildContext context) async {
  
    progressDialog("Please wait...", context);
    try {
      // if (_userData.fileList.isNotEmpty) {
      //   final imageResponse = await _apiService.fileUpload(_userData.fileList);
      //   final list = imageResponse.data;
      //   for (int i = 0; i < list.length; i++) {
      //     if (i == 0) {
      //       _userData.bdbIdCard = list[0];
      //     }
      //     if (i == 1) {
      //       _userData.aadharCard = list[1];
      //     }
      //     if (i == 2) {
      //       _userData.passport = list[2];
      //     }
      //   }
      // }
      final response = await _apiService.registerUser(_userData);
      Prefs.setLogin(true);
      Prefs.setUserId(response.data.id.toString());
      hideProgressDialog(context);
      Utility.pushToDashBoard(context);
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

  void checkUser(BuildContext context, {@required Function onSucess}) async {
    try {
      progressDialog("Please wait...", context);
      final response = await _apiService.checkUser(emailController.text);
      hideProgressDialog(context);
      onSucess(true);

      notifyListeners();
    } catch (e) {
      hideProgressDialog(context);
      onSucess(false);
      notifyListeners();
      myPrint(e.toString());
      DialogHelper.showErrorDialog(context, "Error", "Email Already Exists");
    }
  }
}
