import 'package:diamon_assorter/app/app_repo.dart';
import 'package:diamon_assorter/app_screens/dashboard/dashboard.dart';
import 'package:diamon_assorter/app_widget/address_form_widget.dart';
import 'package:diamon_assorter/app_widget/address_row_widget.dart';
import 'package:diamon_assorter/app_widget/button_widget.dart';
import 'package:diamon_assorter/app_widget/doc_view_widget.dart';
import 'package:diamon_assorter/app_widget/register_textfield.dart';
import 'package:diamon_assorter/modal/address_data.dart';
import 'package:diamon_assorter/register/registerViewModel/registerViewModel.dart';
import 'package:diamon_assorter/util/app_color.dart';
import 'package:diamon_assorter/util/common_pattern.dart';
import 'package:diamon_assorter/util/constants.dart';
import 'package:diamon_assorter/util/utility.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

class CompanyRegisterWidget extends StatefulWidget {
  const CompanyRegisterWidget({
    Key key,
  }) : super(key: key);

  @override
  _CompanyRegisterWidgetState createState() => _CompanyRegisterWidgetState();
}

class _CompanyRegisterWidgetState extends State<CompanyRegisterWidget> {
  _showBottomDialog(
      BuildContext context, RegistrationViewModel model, AddressData data) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return AddressFormWidget(
            data: data,
            onSubmitClicked: (AddressData addressData) {
              if (data == null) {
                model.onAddressAddedClicked(addressData);
              } else {
                model.onEditAddress(addressData);
              }
            },
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final appRepo = Provider.of<AppRepo>(context, listen: false);
    return ViewModelBuilder<RegistrationViewModel>.reactive(
      viewModelBuilder: () => RegistrationViewModel(),
      onModelReady: (RegistrationViewModel model) =>
          model.initData("company", appRepo),
      builder: (_, model, child) => ListView(
        children: [
          SizedBox(
            height: 10,
          ),
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
                    model.userData.mobile = value;
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
          Row(
            children: [
              Expanded(
                child: Focus(
                  onFocusChange: (hasFocus) {
                    if (!hasFocus &&
                        !model.emailError &&
                        !model.emailVerified) {
                      model.checkUser(context, onSucess: (bool value) {
                        model.emailVerified = value;
                        if (!value) {
                          model.emailController.text = "";
                        }
                        model.notifyListeners();
                      });
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
                      text: "Name*",
                      controller: model.contactNameController,
                      textInputType: TextInputType.name,
                      onChanged: (String value) {
                        model.contactPerson.contactPersonName = value;
                        model.contactNameError =
                            !RegExp(CommonPattern.name_regex).hasMatch(value);
                        model.notifyListeners();
                      },
                      errorText: model.contactNameError
                          ? "Please Enter Valid Name"
                          : null,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    RegisterTextfield(
                      text: "Mobile*",
                      controller: model.contactMobileController,
                      textInputType: TextInputType.number,
                      onChanged: (String value) {
                        myPrint("mobile is $value");
                        model.contactPerson.contactPersonMobile = value;
                        model.contactMobileError =
                            !RegExp(CommonPattern.mobile_regex).hasMatch(value);
                        model.notifyListeners();
                      },
                      errorText: model.contactMobileError
                          ? "Please Enter Valid Mobile"
                          : null,
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
                                  !model.contactEmailError &&
                                  !model.contactEmailVerified) {
                                model.checkUser(context,
                                    onSucess: (bool value) {
                                  model.contactEmailVerified = value;
                                  if (!value) {
                                    model.contactEmailController.text = "";
                                  }
                                  model.notifyListeners();
                                });
                              }
                            },
                            child: RegisterTextfield(
                              text: "Email*",
                              controller: model.contactEmailController,
                              textInputType: TextInputType.emailAddress,
                              onChanged: (String value) {
                                model.contactEmailVerified = false;
                                model.contactPerson.contactPersonEmail = value;
                                model.contactEmailError =
                                    !RegExp(CommonPattern.email_regex)
                                        .hasMatch(value);
                                model.notifyListeners();
                              },
                              errorText: model.contactEmailError
                                  ? "Please Enter Valid contact Email"
                                  : null,
                            ),
                          ),
                        ),
                        (model.contactEmailVerified)
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
          Column(
            children: model.addressList
                .map((e) => AddressRow(
                      data: e,
                      onDeleteClicked: () => model.onAddressDeleteClicked(e),
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
                  buttonText: "Add Address",
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
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              new Checkbox(
                  value: model.consentValue,
                  activeColor: Colors.blue,
                  onChanged: (bool newValue) {
                    model.setConsentValue(newValue);
                  }),
              Expanded(
                child: RichText(
                  text: TextSpan(
                    text: 'By clicking this I/We agree to the ',
                    style: TextStyle(color: Colors.grey.shade800, fontSize: 12),
                    children: [
                      TextSpan(
                        text: 'Terms and Conditions  ',
                        recognizer: new TapGestureRecognizer()
                          ..onTap = () => print('Tap Here onTap'),
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 12,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      TextSpan(
                        text: "of Diamond App",
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          ButtonView(
            buttonText: "Submit",
            onPressed: () {
              model.companySubmitClicked(context, onError: (String value) {
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


