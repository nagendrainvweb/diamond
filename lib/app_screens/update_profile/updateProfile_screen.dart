import 'package:diamon_assorter/app/app_repo.dart';
import 'package:diamon_assorter/app_screens/update_profile/updateCompanyProfile_screen.dart';
import 'package:diamon_assorter/app_screens/update_profile/update_profile_viewmodel.dart';
import 'package:diamon_assorter/app_widget/address_row_widget.dart';
import 'package:diamon_assorter/app_widget/app_appbar.dart';
import 'package:diamon_assorter/app_widget/button_widget.dart';
import 'package:diamon_assorter/app_widget/circular_widget.dart';
import 'package:diamon_assorter/app_widget/customErrorWidget.dart';
import 'package:diamon_assorter/app_widget/register_textfield.dart';
import 'package:diamon_assorter/app_widget/top_left_header_widget.dart';
import 'package:diamon_assorter/util/app_color.dart';
import 'package:diamon_assorter/util/common_pattern.dart';
import 'package:diamon_assorter/util/constants.dart';
import 'package:diamon_assorter/util/utility.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({Key key}) : super(key: key);

  @override
  _UpdateProfileState createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  _setContactPerson(UpdateProfileViewModel model) {
    return Column(
      children: [
        Stack(
          children: [
            CircularBorder(
              child: Column(
                children: [
                  RegisterTextfield(
                    text: "Name*",
                    enable: model.contactPersonEditEnable,
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
                  Row(
                    children: [
                      Expanded(
                        child: RegisterTextfield(
                          text: "Mobile*",
                          enable: model.contactPersonEditEnable,
                          controller: model.contactMoileController,
                          textInputType: TextInputType.number,
                          onChanged: (String value) {
                            model.mobileVerified = false;
                            model.contactPerson.contactPersonMobile = value;
                            model.contactMobileError =
                                !RegExp(CommonPattern.mobile_regex)
                                    .hasMatch(value);
                            if (!model.contactMobileError &&
                                !model.mobileVerified &&
                                value.length == 10) {
                              model.checkUserMobile(context,
                                  onSucess: (bool value) {
                                model.mobileVerified = value;
                                if (!value) {
                                  model.contactMoileController.text = "";
                                }
                              });
                            }
                          },
                          errorText: model.contactMobileError
                              ? "Please Enter Valid Mobile"
                              : null,
                        ),
                      ),
                      (model.mobileVerified)
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
                  Row(
                    children: [
                      Expanded(
                        child: Focus(
                          onFocusChange: (hasFocus) {
                            // if (!hasFocus &&
                            //     !model.contactEmailError &&
                            //     !model.contactEmailVerified) {
                            //   model.checkUser(context,
                            //       onSucess: (bool value) {
                            //     model.contactEmailVerified = value;
                            //     if (!value) {
                            //       model.contactEmailController.text =
                            //           "";
                            //     }
                            //     model.notifyListeners();
                            //   });
                            // }
                          },
                          child: RegisterTextfield(
                            text: "Email*",
                            enable: model.contactPersonEditEnable,
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
                  !model.contactPersonEditEnable
                      ? Container()
                      : Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ButtonView(
                                  buttonText: "Cancel",
                                  color: AppColors.mainColor,
                                  onPressed: () {
                                    model.onContactPersonCancelClicked();
                                  },
                                ),
                                ButtonView(
                                  buttonText: "Update",
                                  color: AppColors.mainColor,
                                  onPressed: () {
                                    model.onContactPersonSubmitClicked(context);
                                  },
                                ),
                              ],
                            ),
                          ],
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
                "Contact Person Details",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: AppColors.grey600),
              ),
            ),
            EditDeleteOptionWidget(
              onEditClicked: () {
                model.setContactPersonEditEnable();
              },
              onDeleteClicked: () {},
              showDelete: false,
              showEdit: !model.contactPersonEditEnable,
            )
          ],
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }

  _setPersonalInfo(UpdateProfileViewModel model) {
    return Column(
      children: [
        Stack(
          children: [
            CircularBorder(
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  RegisterTextfield(
                      text: "Type",
                      textInputType: TextInputType.name,
                      enable: false,
                      controller: model.typeController),
                  SizedBox(
                    height: 20,
                  ),
                  RegisterTextfield(
                      text: "Name",
                      textInputType: TextInputType.name,
                      enable: false,
                      controller: model.nameController),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: RegisterTextfield(
                            text: "Mobile",
                            textInputType: TextInputType.number,
                            enable: false,
                            controller: model.mobileController),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RegisterTextfield(
                      text: "Email",
                      textInputType: TextInputType.emailAddress,
                      enable: false,
                      controller: model.emailController),
                ],
              ),
            ),
            TopLeftHeaderWidget(
              text: "Personal Information",
            ),
          ],
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }

  _setAgentData(UpdateProfileViewModel model) {
    return Column(
      children: [
        Stack(
          children: [
            CircularBorder(
              child: Column(children: [
                RegisterTextfield(
                  text: "Commission per Assorter (in Rs)",
                  enable: model.agentEditEnable,
                  controller: model.assorterCommisionController,
                  textInputType: TextInputType.number,
                  onChanged: (String value) {
                    model.commissionError = value.isEmpty;
                    model.notifyListeners();
                  },
                  errorText: model.commissionError
                      ? "Please Enter Valid commission"
                      : null,
                ),
                !model.agentEditEnable
                    ? Container()
                    : Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ButtonView(
                                buttonText: "Cancel",
                                color: AppColors.mainColor,
                                onPressed: () {
                                  model.onAgentCancelClicked();
                                },
                              ),
                              ButtonView(
                                buttonText: "Update",
                                color: AppColors.mainColor,
                                onPressed: () {
                                  model.onAgentUpdateClicked(context);
                                },
                              ),
                            ],
                          ),
                        ],
                      )
              ]),
            ),
            TopLeftHeaderWidget(text: "Other Details"),
            EditDeleteOptionWidget(
              onEditClicked: () {
                model.setAgentEditEnable();
              },
              onDeleteClicked: () {},
              showEdit: !model.agentEditEnable,
              showDelete: false,
            )
          ],
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }

  _setAssorterData(UpdateProfileViewModel model) {
    return Column(
      children: [
        Stack(
          children: [
            CircularBorder(
              child: Column(
                children: [
                  RegisterTextfield(
                    text: "Experience (in year)",
                    enable: model.assorterEditEnable,
                    controller: model.experienceController,
                    textInputType: TextInputType.number,
                    onChanged: (String value) {
                      model.experienceError = value.isEmpty;
                      model.notifyListeners();
                    },
                    errorText: model.experienceError
                        ? "Please Enter Valid Experience"
                        : null,
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: DropdownButton<String>(
                                underline: Container(),
                                value: model.selectedAgent,
                                isExpanded: true,
                                hint: Text("Please Select Agent"),
                                //elevation: 5,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                                items: repo.agentList
                                    .map((e) => e.agentName)
                                    .toList()
                                    .map<DropdownMenuItem<String>>(
                                        (String value) =>
                                            DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            ))
                                    .toList(),
                                onChanged: (model.assorterEditEnable)
                                    ? (String value) {
                                        model.setSelectedAgent(value);
                                      }
                                    : null,
                              )),
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
                      Expanded(
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
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
                                  model.setSpeedValue(1);
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
                                  model.setSpeedValue(4);
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
                              // InkWell(
                              //   onTap: () {
                              //     model.setServiceValue(3);
                              //   },
                              //   child: Row(
                              //     children: [
                              //       Radio(
                              //         materialTapTargetSize:
                              //             MaterialTapTargetSize.shrinkWrap,
                              //         value: 3,
                              //         groupValue: model.serviceValue,
                              //         onChanged: (value) {
                              //           model.setServiceValue(value);
                              //         },
                              //         activeColor: Colors.blue,
                              //       ),
                              //       Expanded(child: Text("Numbering/Ghodhi"))
                              //     ],
                              //   ),
                              // )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      (model.serviceValue == 1)
                          ? Expanded(
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0),
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
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
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
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
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
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
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
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : Expanded(
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: Text(
                                        "Speed :",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        model.setSpeedValue(4);
                                      },
                                      child: Row(
                                        children: [
                                          Radio(
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            value: 4,
                                            groupValue: model.speedValue,
                                            onChanged: (value) {
                                              model.setSpeedValue(value);
                                            },
                                            activeColor: Colors.blue,
                                          ),
                                          Expanded(child: Text("8"))
                                        ],
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        model.setSpeedValue(5);
                                      },
                                      child: Row(
                                        children: [
                                          Radio(
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            value: 5,
                                            groupValue: model.speedValue,
                                            onChanged: (value) {
                                              model.setSpeedValue(value);
                                            },
                                            activeColor: Colors.blue,
                                          ),
                                          Expanded(child: Text("10"))
                                        ],
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        model.setSpeedValue(6);
                                      },
                                      child: Row(
                                        children: [
                                          Radio(
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            value: 6,
                                            groupValue: model.speedValue,
                                            onChanged: (value) {
                                              model.setSpeedValue(value);
                                            },
                                            activeColor: Colors.blue,
                                          ),
                                          Expanded(child: Text("12"))
                                        ],
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        model.setSpeedValue(7);
                                      },
                                      child: Row(
                                        children: [
                                          Radio(
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            value: 7,
                                            groupValue: model.speedValue,
                                            onChanged: (value) {
                                              model.setSpeedValue(value);
                                            },
                                            activeColor: Colors.blue,
                                          ),
                                          Expanded(child: Text("14"))
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
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            value: 8,
                                            groupValue: model.speedValue,
                                            onChanged: (value) {
                                              model.setSpeedValue(value);
                                            },
                                            activeColor: Colors.blue,
                                          ),
                                          Expanded(child: Text("16"))
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                    ],
                  ),
                  !model.assorterEditEnable
                      ? Container()
                      : Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ButtonView(
                                  buttonText: "Cancel",
                                  color: AppColors.mainColor,
                                  onPressed: () {
                                    model.onAssorterCancelClicked();
                                  },
                                ),
                                ButtonView(
                                  buttonText: "Update",
                                  color: AppColors.mainColor,
                                  onPressed: () {
                                    model.onAssorterUpdateClicked(context);
                                  },
                                ),
                              ],
                            ),
                          ],
                        )
                ],
              ),
            ),
            TopLeftHeaderWidget(
              text: "Others Details",
            ),
            EditDeleteOptionWidget(
              onEditClicked: () {
                model.setassorterEditEnable();
              },
              onDeleteClicked: () {},
              showDelete: false,
              showEdit: !model.assorterEditEnable,
            )
          ],
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final repo = Provider.of<AppRepo>(context, listen: false);
    return ViewModelBuilder<UpdateProfileViewModel>.reactive(
      viewModelBuilder: () => UpdateProfileViewModel(),
      onModelReady: (UpdateProfileViewModel model) => model.init(repo),
      builder: (_, model, child) => Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: Column(
          children: [
            AppAppBar(
              showBackButton: true,
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: (model.loading)
                  ? Center(child: CircularProgressIndicator())
                  : (model.hasError)
                      ? CustomErrorWidget(
                          text: Constants.SOMETHING_WRONG,
                          buttonText: "Retry",
                          onRetryClicked: () {
                            model.fetchUserDetails();
                          })
                      : SingleChildScrollView(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 20,
                            ),
                            child: Column(
                              children: [
                                _setPersonalInfo(model),
                                (repo.role == Constants.COMPANY.toLowerCase())
                                    ? _setContactPerson(model)
                                    : Container(),
                                (repo.role == Constants.AGENT.toLowerCase())
                                    ? _setAgentData(model)
                                    : Container(),
                                (repo.role == Constants.ASSERTER.toLowerCase())
                                    ? _setAssorterData(model)
                                    : Container(),
                              ],
                            ),
                          ),
                        ),
            ),
          ],
        ),
      ),
    );
  }
}
