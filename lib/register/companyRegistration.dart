import 'package:diamon_assorter/app_screens/dashboard/dashboard.dart';
import 'package:diamon_assorter/app_widget/button_widget.dart';
import 'package:diamon_assorter/app_widget/register_textfield.dart';
import 'package:diamon_assorter/register/registerViewModel/companyRegisterViewModel.dart';
import 'package:diamon_assorter/util/app_color.dart';
import 'package:diamon_assorter/util/common_pattern.dart';
import 'package:diamon_assorter/util/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';

class CompanyRegisterWidget extends StatefulWidget {
  const CompanyRegisterWidget({
    Key key,
  }) : super(key: key);

  @override
  _CompanyRegisterWidgetState createState() => _CompanyRegisterWidgetState();
}

class _CompanyRegisterWidgetState extends State<CompanyRegisterWidget> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CompanyRegisterViewModel>.reactive(
      viewModelBuilder: () => CompanyRegisterViewModel(),
      onModelReady: (CompanyRegisterViewModel model)=> model.initData("Company"),
      builder: (_, model, child) => ListView(
        children: [
          SizedBox(height: 10,),
          RegisterTextfield(
            text: "Name*",
            controller: model.nameController,
            textInputType: TextInputType.name,
            onChanged: (String value) {
              model.userData.name = value;
              model.nameError =
                  !RegExp(CommonPattern.name_regex).hasMatch(value);
              model.notifyListeners();
            },
            errorText: model.nameError ? "Please Enter Valid Name" : null,
          ),
          SizedBox(
            height: 20,
          ),
          RegisterTextfield(
            text: "Company Name*",
            controller: model.companyNameController,
            textInputType: TextInputType.name,
            onChanged: (String value) {
               model.userData.companyName = value;
              model.companyNameError =
                  !RegExp(CommonPattern.addressRegex).hasMatch(value);
              model.notifyListeners();
            },
            errorText: model.companyNameError
                ? "Please Enter Valid Company Name"
                : null,
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: RegisterTextfield(
                  text: "Mobile No*",
                  controller: model.mobileController,
                  textInputType: TextInputType.number,
                  onChanged: (String value) {
                     model.userData.mobile= value;
                    model.mobileError =
                        !RegExp(CommonPattern.mobile_regex).hasMatch(value);
                    model.notifyListeners();
                  },
                  errorText: model.mobileError
                      ? "Please Enter Valid Mobile No."
                      : null,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: RegisterTextfield(
                  text: "Intercom",
                  controller: model.interComController,
                  textInputType: TextInputType.text,
                  onChanged: (String value) {
                     model.userData.intercom = value;
                    model.intercomError = (value.isNotEmpty)
                        ? !RegExp(CommonPattern.addressRegex).hasMatch(value)
                        : false;
                    model.notifyListeners();
                  },
                  errorText: model.intercomError
                      ? "Please Enter Valid Intercom"
                      : null,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          RegisterTextfield(
            text: "Email*",
            controller: model.emailController,
            textInputType: TextInputType.emailAddress,
            onChanged: (String value) {
               model.userData.email = value;
              model.emailError =
                  !RegExp(CommonPattern.email_regex).hasMatch(value);
              model.notifyListeners();
            },
            errorText: model.emailError ? "Please Enter Valid Email Id" : null,
          ),
          SizedBox(
            height: 20,
          ),
          RegisterTextfield(
            text: "Password*",
            controller: model.passwordController,
            showIcon: true,
            textInputType: TextInputType.name,
            onIconClicked: model.onPasswordVisibleclicked,
            obsecure: model.obsecureText,
            onChanged: (String value) {
               model.userData.password = value;
              model.passwordError=
                  !RegExp(CommonPattern.passwordRegex).hasMatch(value);
              model.notifyListeners();
            },
            errorText: model.passwordError ? "Password must have minimum 5 alphanumeric characters" : null,
          ),
          SizedBox(
            height: 20,
          ),
          RegisterTextfield(
            text: "Address*",
            controller: model.addressController,
            textInputType: TextInputType.name,
            onChanged: (String value) {
               model.userData.address = value;
              model.addreessError =
                  !RegExp(CommonPattern.addressRegex).hasMatch(value);
              model.notifyListeners();
            },
            errorText:
                model.addreessError ? "Please Enter Valid Address" : null,
          ),
          SizedBox(
            height: 20,
          ),
          RegisterTextfield(
            text: "Area*",
            controller: model.areaController,
            textInputType: TextInputType.name,
            onChanged: (String value) {
               model.userData.area = value;
              model.areaError =
                  !RegExp(CommonPattern.name_regex).hasMatch(value);
              model.notifyListeners();
            },
            errorText: model.areaError ? "Please Enter Valid Area" : null,
          ),
              SizedBox(
                height: 20,
              ),
          Row(
            children: [
              
              Expanded(
                child: RegisterTextfield(
                  text: "City*",
                  controller: model.cityController,
                  textInputType: TextInputType.name,
                  onChanged: (String value) => (String value) {
                     model.userData.city = value;
                    model.cityError =
                        !RegExp(CommonPattern.name_regex).hasMatch(value);
                    model.notifyListeners();
                  },
                  errorText: model.cityError ? "Please Enter Valid City" : null,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: RegisterTextfield(
                  text: "Pincode*",
                  controller: model.pincodeController,
                  textInputType: TextInputType.number,
                  onChanged: (String value) {
                     model.userData.pincode = value;
                    model.pincodeError =
                        !RegExp(CommonPattern.pincodeRegex).hasMatch(value);
                    model.notifyListeners();
                  },
                  errorText:
                      model.pincodeError ? "Please Enter Valid Pincode" : null,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          RegisterTextfield(
            text: "Add work address*",
            controller: model.workAddressController,
            textInputType: TextInputType.text,
            onChanged: (String value) {
               model.userData.workAddress = value;
              model.workAddressError =
                  !RegExp(CommonPattern.addressRegex).hasMatch(value);
              model.notifyListeners();
            },
            errorText: model.workAddressError
                ? "Please Enter Valid Work Address"
                : null,
          ),
          SizedBox(
            height: 15,
          ),
          Stack(
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: 15,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: AppColors.grey400,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    RegisterTextfield(
                      text: "Name",
                      controller: model.contactNameController,
                      textInputType: TextInputType.name,
                      onChanged: (String value) {
                         model.userData.contactPersonName = value;
                        model.contactNameError = (value.isEmpty)
                            ? false
                            : !RegExp(CommonPattern.name_regex).hasMatch(value);
                        model.notifyListeners();
                      },
                      errorText: model.companyNameError
                          ? "Please Enter Valid Name"
                          : null,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    RegisterTextfield(
                      text: "Mobile",
                      controller: model.contactMobileController,
                      textInputType: TextInputType.number,
                      onChanged: (String value) {
                         model.userData.contactPersonMobile = value;
                        model.contactMobileError = (value.isEmpty)
                            ? false
                            : !RegExp(CommonPattern.mobile_regex)
                                .hasMatch(value);
                        model.notifyListeners();
                      },
                      errorText: model.contactMobileError
                          ? "Please Enter Valid Mobile"
                          : null,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    RegisterTextfield(
                      text: "Email",
                      controller: model.contactEmailController,
                      textInputType: TextInputType.emailAddress,
                      onChanged: (String value) => (String value) {
                         model.userData.contactPersonEmail = value;
                        model.contactEmailError = (value.isEmpty)
                            ? false
                            : !RegExp(CommonPattern.email_regex)
                                .hasMatch(value);
                        model.notifyListeners();
                      },
                      errorText: model.contactEmailError
                          ? "Please Enter Valid Email"
                          : null,
                    ),
                    
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 15,
                ),
                padding: EdgeInsets.all(
                  5,
                ),
                color: AppColors.whiteColor,
                child: Text(
                  "Contact Person Details",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: AppColors.grey600),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          ButtonView(
            buttonText: "Submit",
            onPressed: () {
              model.submitClicked(context, onError: (String value) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(value),
                  behavior: SnackBarBehavior.floating,
                ));
              });
            },
            color: AppColors.mainColor,
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
