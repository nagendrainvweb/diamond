import 'dart:io';

import 'package:diamon_assorter/app/app_repo.dart';
import 'package:diamon_assorter/app_screens/dashboard/dashboard.dart';
import 'package:diamon_assorter/app_widget/add_assorter_widget.dart';
import 'package:diamon_assorter/app_widget/address_form_widget.dart';
import 'package:diamon_assorter/app_widget/address_row_widget.dart';
import 'package:diamon_assorter/app_widget/button_widget.dart';
import 'package:diamon_assorter/app_widget/doc_view_widget.dart';
import 'package:diamon_assorter/app_widget/register_textfield.dart';
import 'package:diamon_assorter/modal/address_data.dart';
import 'package:diamon_assorter/modal/assorter_modal.dart';
import 'package:diamon_assorter/register/registerViewModel/registerViewModel.dart';
import 'package:diamon_assorter/util/app_color.dart';
import 'package:diamon_assorter/util/common_pattern.dart';
import 'package:diamon_assorter/util/constants.dart';
import 'package:diamon_assorter/util/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

class AgentRegistrationWidget extends StatefulWidget {
  const AgentRegistrationWidget({
    Key key,
  }) : super(key: key);

  @override
  _AgentRegistrationWidgetState createState() =>
      _AgentRegistrationWidgetState();
}

class _AgentRegistrationWidgetState extends State<AgentRegistrationWidget> {
  _showBottomDialog(
      BuildContext context, RegistrationViewModel model, AssorterModal data) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return AddAssorterWidget(
            data: data,
            onSubmitClicked: (name, mobile, email) {
              if (data == null) {
                model.onAseerterAddedClicked(name, mobile, email);
              } else {
                data.name = name;
                data.mobile = mobile;
                data.email = email;
                model.onEditAseertor(data);
              }
            },
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final appRepo = Provider.of<AppRepo>(context,listen: false);
    return ViewModelBuilder<RegistrationViewModel>.reactive(
      viewModelBuilder: () => RegistrationViewModel(),
      onModelReady: (RegistrationViewModel model) => model.initData(
        "agent",appRepo
      ),
      builder: (_, model, child) => ListView(
        children: [
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
            text: "Company Name",
            controller: model.companyNameController,
            textInputType: TextInputType.name,
            onChanged: (String value) {
              model.userData.companyName = value;
              model.companyNameError = (value.isEmpty)
                  ? false
                  : !RegExp(CommonPattern.name_regex).hasMatch(value);
              model.notifyListeners();
            },
            errorText:
                model.companyNameError ? "Please Enter Valid Name" : null,
          ),
          SizedBox(
            height: 20,
          ),
          RegisterTextfield(
            text: "Mobile no*",
            controller: model.mobileController,
            textInputType: TextInputType.number,
            onChanged: (String value) {
              model.userData.mobile = value;
              model.mobileError =
                  !RegExp(CommonPattern.mobile_regex).hasMatch(value);
              model.notifyListeners();
            },
            errorText: model.mobileError ? "Please Enter Valid Number" : null,
          ),
          SizedBox(
            height: 20,
          ),
                  Row(
            children: [
              Expanded(
                child: Focus(
                  onFocusChange: (hasFocus) {
                    if (!hasFocus &&
                        !model.emailError &&
                        !model.emailVerified) {
                      model.checkUser(context);
                    }
                  },
                  child: RegisterTextfield(
                    text: "Email*",
                    controller: model.emailController,
                    textInputType: TextInputType.emailAddress,
                    onChanged: (String value) {
                      model.userData.email = value;
                      model.emailError =
                          !RegExp(CommonPattern.email_regex).hasMatch(value);
                      model.emailVerified = false;
                      model.notifyListeners();
                    },
                    errorText:
                        model.emailError ? "Please Enter Valid Email Id" : null,
                  ),
                ),
              ),
              (model.emailVerified)
                  ? Row(
                      children: [
                        SizedBox(
                          width: 5,
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.verified_user_outlined,
                              color: Colors.green,
                            )),
                      ],
                    )
                  : Container(),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          RegisterTextfield(
            text: "Password*",
            controller: model.passwordController,
            showIcon: true,
            textInputType: TextInputType.text,
            onIconClicked: model.onPasswordVisibleclicked,
            obsecure: model.obsecureText,
             icon: model.obsecureText ? Icons.visibility : Icons.visibility_off,
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
          // RegisterTextfield(
          //   text: "Address*",
          //   textInputType: TextInputType.name,
          //   controller: model.addressController,
          //   onChanged: (String value) {
          //     model.userData.address = value;
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
          //     RegisterTextfield(
          //       text: "Area*",
          //       textInputType: TextInputType.name,
          //       controller: model.areaController,
          //       onChanged: (String value) {
          //         model.userData.area = value;
          //         model.areaError =
          //             !RegExp(CommonPattern.name_regex).hasMatch(value);
          //         model.notifyListeners();
          //       },
          //       errorText: model.areaError ? "Please Enter Valid Area" : null,
          //     ),
          //     SizedBox(
          //       height: 20,
          //     ),
          // Row(
          //   children: [

          //     Expanded(
          //       child: RegisterTextfield(
          //         text: "City*",
          //         textInputType: TextInputType.name,
          //         controller: model.cityController,
          //         onChanged: (String value) {
          //           model.userData.city = value;
          //           model.cityError =
          //               !RegExp(CommonPattern.name_regex).hasMatch(value);
          //           model.notifyListeners();
          //         },
          //         errorText: model.cityError ? "Please Enter Valid City" : null,
          //       ),
          //     ),
          //     SizedBox(
          //       width: 20,
          //     ),
          //     Expanded(
          //       child: RegisterTextfield(
          //         text: "Pincode*",
          //         textInputType: TextInputType.number,
          //         controller: model.pincodeController,
          //         onChanged: (String value) {
          //           model.userData.pincode = value;
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
          // RegisterTextfield(
          //   text: "Office Address",
          //   textInputType: TextInputType.name,
          //   controller: model.officeAddressController,
          //   onChanged: (String value) {
          //     model.userData.officeAddress =  value;
          //     model.officeAddressError = (value.isEmpty)
          //         ? false
          //         : !RegExp(CommonPattern.addressRegex).hasMatch(value);
          //     model.notifyListeners();
          //   },
          //   errorText:
          //       model.officeAddressError ? "Please Enter Valid Address" : null,
          // ),
          RegisterTextfield(
            text: "Commission Per assorter*",
            textInputType: TextInputType.number,
            controller: model.commissionController,
            onChanged: (String value) {
              model.userData.commissionPerAssorter = value;
              model.commissionError = value.isEmpty;
              model.notifyListeners();
            },
            errorText:
                model.commissionError ? "Please Enter Valid Commission" : null,
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
                    data: model.agentAddressData,
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
                        height: (MediaQuery.of(context).size.width - 100) / 2,
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
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(),
                    )
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
            height: 10,
          ),
          Column(
            children: model.assorterList
                .map((e) => AssorterRow(
                      data: e,
                      onDeleteClicked: () => model.onDeleteClicked(e),
                      onEditClicked: () => _showBottomDialog(context, model, e),
                    ))
                .toList(),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                ButtonView(
                  buttonText: "Add Assorter",
                  color: AppColors.mainLightColor,
                  onPressed: () {
                    _showBottomDialog(context, model, null);
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ButtonView(
            buttonText: "Submit",
            onPressed: () {
              model.agentSubmitClicked(context, onError: (String value) {
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

class AssorterRow extends StatelessWidget {
  AssorterRow({
    Key key,
    this.data,
    this.onEditClicked,
    this.onDeleteClicked,
  }) : super(key: key);

  final AssorterModal data;
  final Function onEditClicked;
  final Function onDeleteClicked;

  final _nameController = TextEditingController();
  final _mobileController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _nameController.text = data.name;
    _mobileController.text = data.mobile;
    _emailController.text = data.email;
    return Stack(
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
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 20,
            ),
            child: Column(
              children: [
                SizedBox(height: 10),
                RegisterTextfield(
                  text: "Name",
                  controller: _nameController,
                  enable: false,
                ),
                SizedBox(
                  height: 15,
                ),
                RegisterTextfield(
                  text: "Mobile",
                  controller: _mobileController,
                  enable: false,
                ),
                SizedBox(
                  height: 15,
                ),
                RegisterTextfield(
                  text: "Email",
                  controller: _emailController,
                  enable: false,
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 15),
          padding: EdgeInsets.all(
            5,
          ),
          color: AppColors.whiteColor,
          child: Text(
            "Assorter ${data.id}",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black54,
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: () {
                  onEditClicked();
                },
                child: Container(
                    margin: EdgeInsets.only(left: 15),
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.grey400),
                      color: AppColors.whiteColor,
                    ),
                    child: Icon(
                      Icons.edit_outlined,
                      color: AppColors.grey600,
                    )),
              ),
              InkWell(
                onTap: () {
                  onDeleteClicked();
                },
                child: Container(
                    margin: EdgeInsets.only(left: 15),
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.grey400),
                      color: AppColors.whiteColor,
                    ),
                    child: Icon(
                      Icons.close,
                      color: AppColors.grey600,
                    )),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
