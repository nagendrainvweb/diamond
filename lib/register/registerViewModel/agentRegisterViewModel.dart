import 'dart:io';

import 'package:diamon_assorter/app/app_helper.dart';
import 'package:diamon_assorter/app/locator.dart';
import 'package:diamon_assorter/modal/UserData.dart';
import 'package:diamon_assorter/modal/assorter_modal.dart';
import 'package:diamon_assorter/services/api_services.dart';
import 'package:diamon_assorter/util/app_color.dart';
import 'package:diamon_assorter/util/common_pattern.dart';
import 'package:diamon_assorter/util/dialog_helper.dart';
import 'package:diamon_assorter/util/utility.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';

class AgentRegisterViewModel extends BaseViewModel with AppHelper {
  final nameController = TextEditingController();
  final companyNameController = TextEditingController();
  final mobileController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final addressController = TextEditingController();
  final areaController = TextEditingController();
  final cityController = TextEditingController();
  final pincodeController = TextEditingController();
  final officeAddressController = TextEditingController();
  final commissionController = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  File idCard;
  List<AssorterModal> assorterList = [];

  bool nameError = false;
  bool companyNameError = false;
  bool mobileError = false;
  bool emailError = false;
  bool passwordError = false;
  bool addreessError = false;
  bool areaError = false;
  bool cityError = false;
  bool pincodeError = false;
  bool officeAddressError = false;
  bool commissionError = false;

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
    passwordError= 
        !RegExp(CommonPattern.passwordRegex).hasMatch(passwordController.text);
    addreessError =
        !RegExp(CommonPattern.addressRegex).hasMatch(addressController.text);
    areaError = !RegExp(CommonPattern.name_regex).hasMatch(areaController.text);
    cityError = !RegExp(CommonPattern.name_regex).hasMatch(cityController.text);
    pincodeError =
        !RegExp(CommonPattern.pincodeRegex).hasMatch(pincodeController.text);
    commissionError = commissionController.text.isEmpty;
  }

  void submitClicked(BuildContext context, {Function onError}) {
    checkFeilds();
    if (!nameError &&
        !companyNameError &&
        !mobileError &&
        !emailError &&
        !passwordError &&
        !addreessError &&
        !areaError &&
        !cityError &&
        !pincodeError &&
        !officeAddressError &&
        !commissionError) {
      myPrint("all good");
      _registerUser(context);
    } else {
      onError("Please Enter Require Details");
    }
  }

  void onAseerterAddedClicked(String name, String mobile, String email) {
    assorterList.add(new AssorterModal(
        name: name, mobile: mobile, email: email, id: assorterList.length + 1));
    notifyListeners();
  }

  onDeleteClicked(AssorterModal data) {
    assorterList.remove(data);
    notifyListeners();
  }

  void onEditAseertor(AssorterModal data) {
    final index = assorterList.indexOf(data);
    assorterList[index] = data;
    notifyListeners();
  }

  void selectImage(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) => Container(
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                ListTile(
                  title: Text("Camera"),
                  leading: Icon(Icons.camera_alt_outlined),
                  onTap: () {
                    Navigator.pop(context);
                    pickImage(ImageSource.camera, idCard);
                  },
                ),
                Container(height: 0.7, color: AppColors.grey400),
                ListTile(
                  title: Text("Gallery"),
                  leading: Icon(Icons.insert_photo_outlined),
                  onTap: () {
                    Navigator.pop(context);
                    pickImage(ImageSource.gallery, idCard);
                  },
                )
              ]),
            ));
  }

  pickImage(ImageSource source, File targetImage) async {
    final XFile pickedFile = await _picker.pickImage(
      source: source,
      imageQuality: 50,
    );
    idCard = new File(pickedFile.path);
    notifyListeners();
  }

  void removeImage() {
    idCard = null;
    notifyListeners();
  }

  _registerUser(BuildContext context) async {
    progressDialog("Please wait...", context);
    _userData.bdbIdCard = idCard.path;
    _userData.assorters = assorterList;
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
