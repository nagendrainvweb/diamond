import 'package:diamon_assorter/app/app_repo.dart';
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
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

class AssorterRegisterWidget extends StatefulWidget {
  const AssorterRegisterWidget({
    Key key,
  }) : super(key: key);

  @override
  _AssorterRegisterWidgetState createState() => _AssorterRegisterWidgetState();
}

class _AssorterRegisterWidgetState extends State<AssorterRegisterWidget> {
  
  @override
  Widget build(BuildContext context) {
    var attachHeight = (MediaQuery.of(context).size.width - 70) / 3;
final appRepo = Provider.of<AppRepo>(context,listen: false);
    return ViewModelBuilder<RegistrationViewModel>.reactive(
      viewModelBuilder: () => RegistrationViewModel(),
      onModelReady: (RegistrationViewModel model) => model.initData("assorter",appRepo),
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
             icon: model.obsecureText ? Icons.visibility : Icons.visibility_off,
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
              Expanded(
                child: Consumer<AppRepo>(
                  builder: (context, repo, child) => Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.greyColor),
                        borderRadius: BorderRadius.circular(12),
                     ),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: DropdownButton<String>(
                      underline: Container(),
                      value: model.selectedAgent,
                      isExpanded: true,
                      hint: Text("Please Select Agent"),
                      //elevation: 5,
                      style: TextStyle(color: Colors.black, fontSize: 18),
                      items: repo.agentList
                          .map((e) => e.agentName)
                          .toList()
                          .map<DropdownMenuItem<String>>(
                              (String value) => DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  ))
                          .toList(),
                      onChanged: (String value) {
                       model.setSelectedAgent(value);
                      },
                    ),
                  ),
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
                    children:[
                      TextSpan(
                        text: 'Terms and Conditions  ',
                       recognizer: new TapGestureRecognizer()..onTap = () => print('Tap Here onTap'),
                        style:
                            TextStyle(color: Colors.blueAccent, fontSize: 12,
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
          SizedBox(height: 10,),
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
