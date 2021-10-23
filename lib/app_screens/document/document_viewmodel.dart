import 'dart:io';

import 'package:diamon_assorter/app/app_repo.dart';
import 'package:diamon_assorter/app/locator.dart';
import 'package:diamon_assorter/modal/UserData.dart';
import 'package:diamon_assorter/services/api_services.dart';
import 'package:diamon_assorter/util/app_color.dart';
import 'package:diamon_assorter/util/app_helper.dart';
import 'package:diamon_assorter/util/constants.dart';
import 'package:diamon_assorter/util/dialog_helper.dart';
import 'package:diamon_assorter/util/utility.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';

class DocumentViewModel extends BaseViewModel with AppHelper {
  bool loading = false;
  bool hasError = false;
  final _apiService = locator<ApiService>();
  final ImagePicker _picker = ImagePicker();

  AppRepo _repo;

  var bobCard, aadharCard, passportId;
  List<File> fileList = [];

  void initData(AppRepo repo) {
    _repo = repo;
    if (repo.userData != null) {
      bobCard =
          repo.userData.bdbIdCard.isEmpty ? null : repo.userData.bdbIdCard;
      aadharCard =
          repo.userData.aadharCard.isEmpty ? null : repo.userData.aadharCard;
      passportId =
          repo.userData.passport.isEmpty ? null : repo.userData.passport;
    }
  }

  // String get bobCard => _bobCard;
  // String get aadharCard => _aadharCard;
  // String get passportId => _passportId;

  // void setBobCard(String value) {
  //   _bobCard = value;
  //   notifyListeners();
  // }

  // void setAadharCard(String value) {
  //   _aadharCard = value;
  //   notifyListeners();
  // }

  // void setPassportCard(String value) {
  //   _passportId = value;
  //   notifyListeners();
  // }

  uploadImage(BuildContext context) async {
    try {
      List<String> names = [];
      fileList = [];
      if (bobCard is File && bobCard != null) {
        fileList.add(bobCard);
        names.add(Constants.BOB_ID);
      }
      if (aadharCard is File && aadharCard != null) {
        fileList.add(aadharCard);
        names.add(Constants.AADHAR_CARD);
      }
      if (passportId is File && passportId != null) {
        fileList.add(passportId);
        names.add(Constants.PASSPORT);
      }
      if (fileList.isNotEmpty) {
        progressDialog("Please wait...", context);
        final imageResponse = await _apiService.fileUpload(fileList, names);

        final data = imageResponse.data;

        bobCard = data[Constants.BOB_ID];
        aadharCard = data[Constants.AADHAR_CARD];
        passportId = data[Constants.PASSPORT];

        hideProgressDialog(context);
        _checkAndUpdateDoc(context);
      } else {
        if (_repo.userData.bdbIdCard != bobCard ||
            _repo.userData.aadharCard != aadharCard ||
            _repo.userData.passport != passportId) {
          _checkAndUpdateDoc(context);
        }
      }
    } catch (e) {
      myPrint(e.toString());
      hideProgressDialog(context);
      DialogHelper.showErrorDialog(context, "Error", e.toString());
    }
  }

  _checkAndUpdateDoc(BuildContext context) async {
    try {
      progressDialog("Please wait...", context);
      _repo.userData.bdbIdCard = bobCard;
      _repo.userData.aadharCard = aadharCard;
      _repo.userData.passport = passportId;
      final updateData = _repo.userData.toImageUpdatejson();
      final updateResponse = await _apiService.updateUserProfile(updateData);
      _repo.setUserData(updateResponse.data);
      hideProgressDialog(context);
      DialogHelper.showErrorDialog(context, "Message", updateResponse.message,
          onOkClicked: () {
        Navigator.pop(context);
        Navigator.pop(context);
      });
    } catch (e) {
      myPrint(e.toString());
      hideProgressDialog(context);
      DialogHelper.showErrorDialog(context, "Error", e.toString());
    }
  }

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
      bobCard = new File(pickedFile.path);
      myPrint("inside idard");
    }
    if (targatedFile == Constants.AADHAR_CARD) {
      aadharCard = new File(pickedFile.path);
      myPrint("inside aadhar card");
    }
    if (targatedFile == Constants.PASSPORT) {
      passportId = new File(pickedFile.path);
      myPrint("inside passport");
    }

    notifyListeners();
  }

  void removeImage(String targatedFile) {
    if (targatedFile == Constants.BOB_ID) {
      bobCard = null;
    }
    if (targatedFile == Constants.AADHAR_CARD) {
      aadharCard = null;
    }
    if (targatedFile == Constants.PASSPORT) {
      passportId = null;
    }
    notifyListeners();
  }
}
