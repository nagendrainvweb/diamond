import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class CompanyRegisterViewModel extends BaseViewModel {
  final nameController = TextEditingController();
  final companyNameController = TextEditingController();
  final mobileController = TextEditingController();
  final interComController = TextEditingController();
  final emailController = TextEditingController();
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
  bool addreessError = false;
  bool areaError = false;
  bool cityError = false;
  bool pincodeError = false;
  bool workAddressError = false;
  bool contactNameError = false;
  bool contactMobileError = false;
  bool contactEmailError = false;

}
