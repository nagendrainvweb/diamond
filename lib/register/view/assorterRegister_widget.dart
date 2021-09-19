import 'package:diamon_assorter/app_screens/dashboard/dashboard.dart';
import 'package:diamon_assorter/app_widget/address_form_widget.dart';
import 'package:diamon_assorter/app_widget/button_widget.dart';
import 'package:diamon_assorter/app_widget/doc_view_widget.dart';
import 'package:diamon_assorter/app_widget/register_textfield.dart';
import 'package:diamon_assorter/register/registerViewModel/registerViewModel.dart';
import 'package:diamon_assorter/util/app_color.dart';
import 'package:diamon_assorter/util/common_pattern.dart';
import 'package:diamon_assorter/util/constants.dart';
import 'package:diamon_assorter/util/utility.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class AssorterRegisterWidget extends StatefulWidget {
  const AssorterRegisterWidget({
    Key key,
  }) : super(key: key);

  @override
  _AssorterRegisterWidgetState createState() => _AssorterRegisterWidgetState();
}

class _AssorterRegisterWidgetState extends State<AssorterRegisterWidget> {
  String _chosenValue = "";
  @override
  Widget build(BuildContext context) {
    var attachHeight = (MediaQuery.of(context).size.width - 70) / 3;

    return ViewModelBuilder<RegistrationViewModel>.reactive(
      viewModelBuilder: () => RegistrationViewModel(),
      onModelReady: (RegistrationViewModel model) => model.initData("assorter"),
      builder: (_, model, child) => ListView(
        children: [
          RegisterTextfield(
            text: "Name*",
            textInputType: TextInputType.name,
            controller: model.nameController,
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
            text: "Mobile*",
            textInputType: TextInputType.number,
            controller: model.mobileController,
            onChanged: (String value) {
              model.userData.mobile = value;
              model.mobileError =
                  !RegExp(CommonPattern.mobile_regex).hasMatch(value);
              model.notifyListeners();
            },
            errorText:
                model.mobileError ? "Please Enter Valid Mobile No" : null,
          ),
          SizedBox(
            height: 20,
          ),
          RegisterTextfield(
            text: "Email*",
            textInputType: TextInputType.emailAddress,
            controller: model.emailController,
            onChanged: (String value) {
              model.userData.email = value;
              model.emailError =
                  !RegExp(CommonPattern.email_regex).hasMatch(value);
              model.notifyListeners();
            },
            errorText: model.emailError ? "Please Enter Valid Email" : null,
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
              model.passwordError =
                  !RegExp(CommonPattern.passwordRegex).hasMatch(value);
              model.notifyListeners();
            },
            errorText: model.passwordError ? Constants.PASSWORD_MSG : null,
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              
              // Expanded(
              //   child: Container(
              //     decoration: BoxDecoration(
              //         border: Border.all(color: AppColors.greyColor),
              //         borderRadius: BorderRadius.circular(12),
              //         color: AppColors.mainLightColor),
              //     padding: const EdgeInsets.symmetric(horizontal: 10),
              //     child: DropdownButton<String>(
              //       underline: Container(),
              //       value: _chosenValue,
              //       isExpanded: true,
              //       hint: Text("Please Select Agent"),
              //       //elevation: 5,
              //       style: TextStyle(color: Colors.black, fontSize: 18),
              //       items: <String>[
              //         Constants.COMPANY,
              //         Constants.AGENT,
              //         Constants.ASSERTER,
              //       ].map<DropdownMenuItem<String>>((String value) {
              //         return DropdownMenuItem<String>(
              //           value: value,
              //           child: Text(value),
              //         );
              //       }).toList(),

              //       onChanged: (String value) {
              //         setState(() {
              //           _chosenValue = value;
              //         });
              //       },
              //     ),
              //   ),
              // ),
              
            ],
          ),
          SizedBox(
            height: 20,
          ),
          // RegisterTextfield(
          //   text: "Address*",
          //   textInputType: TextInputType.name,
          //   controller: model.addressController,
          //   onChanged: (String value) {
          //      model.userData.address = value;
          //     model.addreessError =
          //         !RegExp(CommonPattern.addressRegex).hasMatch(value);
          //     model.notifyListeners();
          //   },
          //   errorText:
          //       model.addreessError ? "Please Enter Valid Address" : null,
          // ),
          // SizedBox(
          //   height: 20,
          // ),
          // Row(
          //   children: [
          //     Expanded(
          //       child: RegisterTextfield(
          //         text: "Area*",
          //         textInputType: TextInputType.name,
          //         controller: model.areaController,
          //         onChanged: (String value) {
          //            model.userData.area = value;
          //           model.agentError =
          //               !RegExp(CommonPattern.name_regex).hasMatch(value);
          //           model.notifyListeners();
          //         },
          //         errorText:
          //             model.agentError ? "Please Enter Valid Agent" : null,
          //       ),
          //     ),
          //     SizedBox(
          //       width: 10,
          //     ),
          //     Expanded(
          //       child: RegisterTextfield(
          //         text: "City*",
          //         textInputType: TextInputType.name,
          //         controller: model.cityController,
          //         onChanged: (String value) {
          //            model.userData.city = value;
          //           model.cityError =
          //               !RegExp(CommonPattern.name_regex).hasMatch(value);
          //           model.notifyListeners();
          //         },
          //         errorText: model.cityError ? "Please Enter Valid City" : null,
          //       ),
          //     ),
          //     SizedBox(
          //       width: 10,
          //     ),
          //     Expanded(
          //       child: RegisterTextfield(
          //         text: "Pincode*",
          //         textInputType: TextInputType.number,
          //         controller: model.pincodeController,
          //         onChanged: (String value) {
          //            model.userData.pincode = value;
          //           model.pincodeError =
          //               !RegExp(CommonPattern.pincodeRegex).hasMatch(value);
          //           model.notifyListeners();
          //         },
          //         errorText:
          //             model.pincodeError ? "Please Enter Valid Pincode" : null,
          //       ),
          //     ),
          //   ],
          // ),
          // SizedBox(
          //   height: 20,
          // ),
          Row(
            children: [
              Expanded(
                child: RegisterTextfield(
                  text: "Experience*",
                  textInputType: TextInputType.number,
                  controller: model.experienceController,
                  onChanged: (String value) {
                    model.userData.experiance = value;
                    model.experienceError = value.isEmpty;
                    model.notifyListeners();
                  },
                  errorText:
                      model.nameError ? "Please Enter Valid Experience" : null,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Text(
                  "In Years",
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Stack(
            children: [
              Container(
                  margin: EdgeInsets.only(top: 13, bottom: 8, right: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    ),
                  ),
                  child: AddressFormWidget(
                    showTopBar: false,
                    data: model.assorterAddressData,
                  )),
              Container(
                margin: EdgeInsets.only(left: 15),
                padding: EdgeInsets.all(
                  5,
                ),
                color: AppColors.whiteColor,
                child: Text(
                  "Address",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
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
                    width: 2,
                    color: Colors.grey.shade300,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Expanded(
                        child: DocViewWidget(
                      title: "Attch BOB id Card",
                      height: attachHeight,
                      file: model.idCard,
                      onSelectImage: () {
                        model.selectImage(
                          context,
                          (source) {
                            model.pickImage(source, Constants.BOB_ID);
                          },
                        );
                      },
                      onDeleteImage: () {
                        model.removeImage(Constants.BOB_ID);
                      },
                    )),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: DocViewWidget(
                      title: "Attch Aadhar card",
                      height: attachHeight,
                      file: model.aadharCard,
                      onSelectImage: () {
                        model.selectImage(
                          context,
                          (source) {
                            model.pickImage(source, Constants.AADHAR_CARD);
                          },
                        );
                      },
                      onDeleteImage: () {
                        model.removeImage(Constants.AADHAR_CARD);
                      },
                    )),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: DocViewWidget(
                      title: "Attch Passport",
                      height: attachHeight,
                      file: model.passport,
                      onSelectImage: () {
                        model.selectImage(
                          context,
                          (source) {
                            model.pickImage(source, Constants.PASSPORT);
                          },
                        );
                      },
                      onDeleteImage: () {
                        model.removeImage(Constants.PASSPORT);
                      },
                    )),
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
                  "Attach Documents",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
              ),
            ],
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
                    width: 2,
                    color: Colors.grey.shade300,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Text(
                                "Service :",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                model.setServiceValue(1);
                              },
                              child: Row(
                                children: [
                                  Radio(
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    value: 1,
                                    groupValue: model.serviceValue,
                                    onChanged: (value) {
                                      model.setServiceValue(value);
                                    },
                                    activeColor: Colors.blue,
                                  ),
                                  Expanded(child: Text("Numbering"))
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                model.setServiceValue(2);
                              },
                              child: Row(
                                children: [
                                  Radio(
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    value: 2,
                                    groupValue: model.serviceValue,
                                    onChanged: (value) {
                                      model.setServiceValue(value);
                                    },
                                    activeColor: Colors.blue,
                                  ),
                                  Expanded(child: Text("Ghodhi"))
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                model.setServiceValue(3);
                              },
                              child: Row(
                                children: [
                                  Radio(
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    value: 3,
                                    groupValue: model.serviceValue,
                                    onChanged: (value) {
                                      model.setServiceValue(value);
                                    },
                                    activeColor: Colors.blue,
                                  ),
                                  Expanded(child: Text("Numbering/Ghodhi"))
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Text(
                                "Speed :",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                model.setSpeedValue(1);
                              },
                              child: Row(
                                children: [
                                  Radio(
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    value: 1,
                                    groupValue: model.speedValue,
                                    onChanged: (value) {
                                      model.setSpeedValue(value);
                                    },
                                    activeColor: Colors.blue,
                                  ),
                                  Expanded(child: Text("Slow"))
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                model.setSpeedValue(2);
                              },
                              child: Row(
                                children: [
                                  Radio(
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    value: 2,
                                    groupValue: model.speedValue,
                                    onChanged: (value) {
                                      model.setSpeedValue(value);
                                    },
                                    activeColor: Colors.blue,
                                  ),
                                  Expanded(child: Text("Medium"))
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                model.setSpeedValue(3);
                              },
                              child: Row(
                                children: [
                                  Radio(
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    value: 3,
                                    groupValue: model.speedValue,
                                    onChanged: (value) {
                                      model.setSpeedValue(value);
                                    },
                                    activeColor: Colors.blue,
                                  ),
                                  Expanded(child: Text("Fast"))
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
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
                  "Others",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
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
              model.assorterSubmitClicked(context, onError: (String value) {
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
