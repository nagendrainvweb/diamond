import 'package:diamon_assorter/modal/assorter_modal.dart';
import 'package:diamon_assorter/util/app_color.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class AgentRegisterViewModel extends BaseViewModel {
  final nameController = TextEditingController();
  final companyNameController = TextEditingController();
  final mobileController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final areaController = TextEditingController();
  final cityController = TextEditingController();
  final pincodeController = TextEditingController();
  final officeAddressController = TextEditingController();
  final commissionController = TextEditingController();

  var idCard = null;
  List<AssorterModal> assorterList = [];

  bool nameError = false;
  bool companyNameError = false;
  bool mobileError = false;
  bool emailError = false;
  bool addreessError = false;
  bool areaError = false;
  bool cityError = false;
  bool pincodeError = false;
  bool officeAddressError = false;
  bool commissionError = false;

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
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                   title: Text("Camera"),
                   leading: Icon(Icons.camera_alt_outlined), 
                  ),
                  Container(height: 0.7,color:AppColors.grey400),
                  ListTile(
                   title: Text("Gallery"),
                   leading: Icon(Icons.insert_photo_outlined 
                  ))
                ]
              ),
            ));
  }
}
