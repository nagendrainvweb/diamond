import 'dart:io';

import 'package:diamon_assorter/app/app_repo.dart';
import 'package:diamon_assorter/app/locator.dart';
import 'package:diamon_assorter/app_widget/register_textfield.dart';
import 'package:diamon_assorter/modal/UserData.dart';
import 'package:diamon_assorter/services/api_services.dart';
import 'package:diamon_assorter/util/app_helper.dart';
import 'package:diamon_assorter/util/common_pattern.dart';
import 'package:diamon_assorter/util/constants.dart';
import 'package:diamon_assorter/util/dialog_helper.dart';
import 'package:diamon_assorter/util/utility.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

class UpdateProfileViewModel extends BaseViewModel with AppHelper {
  final _apiService = locator<ApiService>();

  final typeController = TextEditingController();
  final nameController = TextEditingController();
  final mobileController = TextEditingController();
  final emailController = TextEditingController();

  final contactNameController = TextEditingController();
  final contactMoileController = TextEditingController();
  final contactEmailController = TextEditingController();

  final assorterCommisionController = TextEditingController();

  final experienceController = TextEditingController();

  bool _contactPersonEditEnable = false;
  bool _agentEditEnable = false;
  bool _assorterEditEnable = false;

  String _selectedAgent;
  ContactPerson contactPerson;

  bool contactNameError = false;

  bool contactMobileError = false;

  bool contactEmailError = false;

  bool contactEmailVerified = false;

  AppRepo appRepo;

  bool commissionError = false;

  bool experienceError = false;
  int serviceValue = -1;
  int speedValue = -1;
  UserData _userData;
  bool loading = false;
  bool hasError = false;

  bool emailVerified = false;
  bool mobileVerified = false;

  void init(AppRepo repo) {
    typeController.text = repo.role;
    nameController.text = repo.name;
    mobileController.text = repo.number;
    emailController.text = repo.email;

    appRepo = repo;
    _userData = appRepo.userData;
    if (_userData != null) {
      final speed = _userData.speed;
      final service = _userData.service;
      speedValue = _getSpeedIndex(speed);
      serviceValue = _getServiceIndex(service);
      if (_userData.contactPerson != null) {
        contactPerson = _userData.contactPerson;
      } else {
        contactPerson = ContactPerson();
      }

      contactNameController.text = contactPerson.contactPersonName ?? "";
      contactMoileController.text = contactPerson.contactPersonMobile ?? "";
      contactEmailController.text = contactPerson.contactPersonEmail ?? "";
      assorterCommisionController.text =
          _userData.commission_per_assorter ?? "";
    } else {
      fetchUserDetails();
    }
    //  fetchUserDetails();
    notifyListeners();
  }

  void checkUser(BuildContext context, {@required Function onSucess}) async {
    try {
      progressDialog("Please wait...", context);
      final response = await _apiService.checkUser(contactEmailController.text);
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

  void checkUserMobile(BuildContext context,
      {@required Function onSucess}) async {
    try {
      progressDialog("Please wait...", context);
      final response =
          await _apiService.checkUserMobile(contactMoileController.text);
      hideProgressDialog(context);
      onSucess(true);

      notifyListeners();
    } catch (e) {
      hideProgressDialog(context);
      onSucess(false);
      notifyListeners();
      myPrint(e.toString());
      DialogHelper.showErrorDialog(
          context, "Error", "Mobile No Already Exists");
    }
  }

  fetchUserDetails() async {
    try {
      loading = true;
      hasError = false;
      notifyListeners();
      final response = await _apiService.fetchUserDetails();
      _userData = response.data;
      loading = false;
      notifyListeners();
    } catch (e) {
      myPrint(e.toString());
      loading = false;
      hasError = true;
      notifyListeners();
    }
  }

  int _getSpeedIndex(String value) {
    int index = -1;
    if (Constants.FAST == value) {
      index = 1;
    } else if (value == Constants.MEDIUM) {
      index = 2;
    } else if (value == Constants.SLOW) {
      index = 3;
    } else if (value == "8") {
      index = 4;
    } else if (value == "10") {
      index = 5;
    } else if (value == "12") {
      index = 6;
    } else if (value == "14") {
      index = 7;
    } else if (value == "16") {
      index = 8;
     
    }
    return index;
  }

  int _getServiceIndex(String value) {
    int index = -1;
    if (Constants.NUMBERING == value) {
      index = 1;
    } else if (value == Constants.GHODHI) {
      index = 2;
    } else if (value == Constants.NUMBER_GHODHI) {
      index = 3;
    }
    return index;
  }

  String _getSpeedValueFromIndex(int value) {
    String speed = Constants.FAST;
    if (value == 1) {
      speed = Constants.FAST;
    } else if (value == 2) {
      speed = Constants.MEDIUM;
    } else if (value == 3) {
      speed = Constants.SLOW;
    } else if (value == 4) {
      speed = "8";
    } else if (value == 5) {
      speed = "10";
    } else if (value == 6) {
      speed = "12";
    } else if (value == 7) {
      speed = "14";
    } else if (value == 8) {
      speed = "16";
    }
    return speed;
  }

  String _getServiceValueFromIndex(int value) {
    String service = Constants.NUMBERING;
    if (value == 1) {
      service = Constants.NUMBERING;
    } else if (value == 2) {
      service = Constants.GHODHI;
    } else if (value == 3) {
      service = Constants.NUMBER_GHODHI;
    }
    return service;
  }

  String get selectedAgent => _selectedAgent;

  void setSelectedAgent(String value) {
    _selectedAgent = value;
    notifyListeners();
  }

  bool get contactPersonEditEnable => _contactPersonEditEnable;

  void setContactPersonEditEnable() {
    _contactPersonEditEnable = !_contactPersonEditEnable;
    notifyListeners();
  }

  bool get agentEditEnable => _agentEditEnable;

  void setAgentEditEnable() {
    _agentEditEnable = !_agentEditEnable;
    notifyListeners();
  }

  bool get assorterEditEnable => _assorterEditEnable;

  void setassorterEditEnable() {
    _assorterEditEnable = !_assorterEditEnable;
    notifyListeners();
  }

  void onContactPersonSubmitClicked(BuildContext context) async {
    // _contactPersonEditEnable = false;
    // notifyListeners();
    contactNameError =
        !RegExp(CommonPattern.name_regex).hasMatch(contactNameController.text);
    contactEmailError = !RegExp(CommonPattern.email_regex)
        .hasMatch(contactEmailController.text);
    contactMobileError = !RegExp(CommonPattern.mobile_regex)
        .hasMatch(contactMoileController.text);
    notifyListeners();
    if (contactNameError || contactMobileError || contactEmailError) {
      return;
    }
    try {
      progressDialog("Please waiit...", context);
      UserData data = UserData(contactPerson: contactPerson);
      data.id = _userData.id;
      data.userId = _userData.userId;
      final body = data.toContactPersonJson();
      final response = await _apiService.updateUserProfile(body);
      _userData = response.data;
      hideProgressDialog(context);
      _contactPersonEditEnable = false;
      _userData.contactPerson = contactPerson;
      appRepo.userData.contactPerson = contactPerson;
      notifyListeners();
    } catch (e) {
      hideProgressDialog(context);
      DialogHelper.showErrorDialog(context, "Error", e.toString(),
          showTitle: true);
    }
  }

  void onAgentUpdateClicked(BuildContext context) async {
    commissionError = assorterCommisionController.text.isEmpty;
    notifyListeners();
    if (contactNameError) {
      return;
    }
    try {
      progressDialog("Please waiit...", context);
      UserData data =
          UserData(commission_per_assorter: assorterCommisionController.text);
      data.id = _userData.id;
      data.userId = _userData.userId;
      final body = data.toAgentjson();
      final response = await _apiService.updateUserProfile(body);
      _userData = response.data;
      hideProgressDialog(context);
      _agentEditEnable = false;
      _userData.commission_per_assorter = assorterCommisionController.text;
      appRepo.userData.commission_per_assorter =
          assorterCommisionController.text;
      notifyListeners();
    } catch (e) {
      hideProgressDialog(context);
      DialogHelper.showErrorDialog(context, "Error", e.toString(),
          showTitle: true);
    }
  }

  void onAssorterUpdateClicked(BuildContext context) async {
    experienceError = experienceController.text.isEmpty;
    notifyListeners();
    if (experienceError) {
      return;
    }
    try {
      progressDialog("Please waiit...", context);
      final speed = _getSpeedValueFromIndex(speedValue);
      final service = _getServiceValueFromIndex(serviceValue);
      final index = appRepo.agentList
          .indexWhere((element) => element.agentName == selectedAgent);
      UserData data = UserData(
          experience: experienceController.text,
          speed: speed,
          service: service,
          agent: index == -1 ? null : index);
      data.id = _userData.id;
      data.userId = _userData.userId;
      final body = data.toAssorterjson();
      final response = await _apiService.updateUserProfile(body);
      _userData = response.data;
      hideProgressDialog(context);
      _assorterEditEnable = false;
      _userData.experience = experienceController.text;
      _userData.speed = speed;
      _userData.service = service;
      _userData.agent = index;
      appRepo.userData.experience = experienceController.text;
      appRepo.userData.speed = speed;
      appRepo.userData.service = service;
      appRepo.userData.agent = index;
      notifyListeners();
    } catch (e) {
      hideProgressDialog(context);
      DialogHelper.showErrorDialog(context, "Error", e.toString(),
          showTitle: true);
    }
  }

  void onAssorterCancelClicked() {
    _assorterEditEnable = false;
    if (_userData != null) {
      final speed = _userData.speed;
      final service = _userData.service;
      speedValue = _getSpeedIndex(speed);
      serviceValue = _getServiceIndex(service);
    }
    notifyListeners();
  }

  void onAgentCancelClicked() {
    _agentEditEnable = false;
    if (_userData?.commission_per_assorter == null) {
      assorterCommisionController.text = "";
    } else {
      assorterCommisionController.text = _userData?.commission_per_assorter;
    }
    commissionError = false;
    notifyListeners();
  }

  void onContactPersonCancelClicked() {
    _contactPersonEditEnable = false;
    resetContactDetails();
    notifyListeners();
  }

  resetContactDetails() {
    if (_userData?.contactPerson == null) {
      contactNameController.text = "";
      contactMoileController.text = "";
      contactEmailController.text = "";
    } else {
      contactNameController.text = _userData.contactPerson.contactPersonName;
      contactMoileController.text = _userData.contactPerson.contactPersonMobile;
      contactEmailController.text = _userData.contactPerson.contactPersonEmail;
    }

    contactEmailError = false;
    contactMobileError = false;
    contactEmailError = false;
    contactEmailVerified = false;
  }

  // void checkUser(BuildContext context,
  //     {Null Function(bool value) onSucess}) async {
  //   try {
  //     progressDialog("Please wait...", context);
  //     final response = await _apiService.checkUser(emailController.text);
  //     hideProgressDialog(context);
  //     onSucess(true);

  //     notifyListeners();
  //   } catch (e) {
  //     hideProgressDialog(context);
  //     onSucess(false);
  //     notifyListeners();
  //     myPrint(e.toString());
  //     DialogHelper.showErrorDialog(context, "Error", "Email Already Exists");
  //   }
  // }

  void setSpeedValue(int i) {
    if (assorterEditEnable) {
      speedValue = i;
      notifyListeners();
    }
  }

  void setServiceValue(int i) {
    if (assorterEditEnable) {
      serviceValue = i;
      notifyListeners();
    }
  }
}
