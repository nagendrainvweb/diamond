import 'package:diamon_assorter/app_screens/dashboard/dashboard.dart';
import 'package:diamon_assorter/app_widget/button_widget.dart';
import 'package:diamon_assorter/app_widget/register_textfield.dart';
import 'package:diamon_assorter/modal/assorter_modal.dart';
import 'package:diamon_assorter/register/registerViewModel/agentRegisterViewModel.dart';
import 'package:diamon_assorter/util/app_color.dart';
import 'package:diamon_assorter/util/common_pattern.dart';
import 'package:diamon_assorter/util/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      BuildContext context, AgentRegisterViewModel model, AssorterModal data) {
    final _nameController =
        TextEditingController(text: data != null ? data.name : "");
    final _mobileController =
        TextEditingController(text: data != null ? data.mobile : "");
    final _emailController =
        TextEditingController(text: data != null ? data.email : "");
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    // vertical: 5,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Add Assorter",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
                Divider(),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Column(
                    children: [
                      RegisterTextfield(
                        text: "Name",
                        controller: _nameController,
                        textInputType: TextInputType.name,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      RegisterTextfield(
                        text: "Mobile",
                        controller: _mobileController,
                        textInputType: TextInputType.number,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      RegisterTextfield(
                        text: "Email",
                        controller: _emailController,
                        textInputType: TextInputType.emailAddress,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ButtonView(
                        buttonText: "SUBMIT",
                        color: AppColors.mainLightColor,
                        onPressed: () {
                          Navigator.pop(context);
                          if (data == null) {
                            model.onAseerterAddedClicked(_nameController.text,
                                _mobileController.text, _emailController.text);
                          } else {
                            data.name = _nameController.text;
                            data.mobile = _mobileController.text;
                            data.email = _emailController.text;
                            model.onEditAseertor(data);
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AgentRegisterViewModel>.reactive(
      viewModelBuilder: () => AgentRegisterViewModel(),
      builder: (_, model, child) => ListView(
        children: [
          RegisterTextfield(
            text: "Name*",
            controller: model.nameController,
            textInputType: TextInputType.name,
            onChanged: (String value) {
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
              model.companyNameError =
                  !RegExp(CommonPattern.name_regex).hasMatch(value);
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
              model.mobileError =
                  !RegExp(CommonPattern.mobile_regex).hasMatch(value);
              model.notifyListeners();
            },
            errorText: model.mobileError ? "Please Enter Valid Number" : null,
          ),
          SizedBox(
            height: 20,
          ),
          RegisterTextfield(
            text: "Email*",
            textInputType: TextInputType.emailAddress,
            controller: model.emailController,
            onChanged: (String value) {
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
            text: "Address",
            textInputType: TextInputType.name,
            controller: model.addressController,
            onChanged: (String value) {
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
          Row(
            children: [
              Expanded(
                child: RegisterTextfield(
                  text: "Area",
                  textInputType: TextInputType.name,
                  controller: model.areaController,
                  onChanged: (String value) {
                    model.areaError =
                        !RegExp(CommonPattern.name_regex).hasMatch(value);
                    model.notifyListeners();
                  },
                  errorText: model.areaError ? "Please Enter Valid Area" : null,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: RegisterTextfield(
                  text: "City",
                  textInputType: TextInputType.name,
                  controller: model.cityController,
                  onChanged: (String value) {
                    model.cityError =
                        !RegExp(CommonPattern.email_regex).hasMatch(value);
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
                  text: "Pincode",
                  textInputType: TextInputType.number,
                  controller: model.pincodeController,
                  onChanged: (String value) {
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
            text: "Office Address",
            textInputType: TextInputType.name,
            controller: model.officeAddressController,
            onChanged: (String value) {
              model.officeAddressError =
                  !RegExp(CommonPattern.addressRegex).hasMatch(value);
              model.notifyListeners();
            },
            errorText:
                model.officeAddressError ? "Please Enter Valid Address" : null,
          ),
          SizedBox(
            height: 20,
          ),
          RegisterTextfield(
            text: "Commission Per asorter",
            textInputType: TextInputType.number,
            controller: model.commissionController,
            onChanged: (String value) {
              // model.commissionError =
              //     !RegExp(CommonPattern.n).hasMatch(value);
              model.notifyListeners();
            },
            errorText:
                model.pincodeError ? "Please Enter Valid Commission" : null,
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
                      child: InkWell(
                        onTap: () {
                          model.selectImage(context);
                        },
                        child: Container(
                          height: (MediaQuery.of(context).size.width - 100) / 2,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 2,
                              color: Colors.grey.shade300,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Attach BDB Id Card",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ),
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
              Utility.pushToNext(context, DashBoardPage());
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
