import 'package:diamon_assorter/app/locator.dart';
import 'package:diamon_assorter/app_widget/button_widget.dart';
import 'package:diamon_assorter/app_widget/register_textfield.dart';
import 'package:diamon_assorter/modal/assorter_modal.dart';
import 'package:diamon_assorter/services/api_services.dart';
import 'package:diamon_assorter/util/app_color.dart';
import 'package:diamon_assorter/util/app_helper.dart';
import 'package:diamon_assorter/util/common_pattern.dart';
import 'package:diamon_assorter/util/dialog_helper.dart';
import 'package:diamon_assorter/util/utility.dart';
import 'package:flutter/material.dart';

class AddAssorterWidget extends StatefulWidget {
  AddAssorterWidget({
    Key key,
    this.data,
    this.onSubmitClicked,
  }) : super(key: key);

  final AssorterModal data;
  final Function onSubmitClicked;

  @override
  _AddAssorterWidgetState createState() => _AddAssorterWidgetState();
}

class _AddAssorterWidgetState extends State<AddAssorterWidget> with AppHelper {
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _mobileController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  bool assNameError = false;

  bool assMobileError = false;

  bool assEmailError = false;
  bool emailVerified = false;
  final _apiService = locator<ApiService>();

  @override
  void initState() {
    _nameController.text = widget.data != null ? widget.data.name : "";
    _mobileController.text = widget.data != null ? widget.data.mobile : "";
    _emailController.text = widget.data != null ? widget.data.email : "";
    super.initState();
  }

  void checkUser(BuildContext context, {@required Function onSucess}) async {
    try {
      progressDialog("Please wait...", context);
      final response = await _apiService.checkUser(_emailController.text);
      hideProgressDialog(context);
      onSucess(true);
    } catch (e) {
      hideProgressDialog(context);
      onSucess(false);
      myPrint(e.toString());
      DialogHelper.showErrorDialog(context, "Error", "Email Already Exists");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
               vertical: 5,
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
                  text: "Name*",
                  controller: _nameController,
                  textInputType: TextInputType.name,
                  onChanged: (String value) {
                    setState(() {
                      assNameError =
                          !RegExp(CommonPattern.name_regex).hasMatch(value);
                    });
                  },
                  errorText: assNameError ? "Please Enter Valid Name" : null,
                ),
                SizedBox(
                  height: 20,
                ),
                RegisterTextfield(
                  text: "Mobile*",
                  controller: _mobileController,
                  textInputType: TextInputType.number,
                  onChanged: (String value) {
                    setState(() {
                      assMobileError =
                          !RegExp(CommonPattern.mobile_regex).hasMatch(value);
                    });
                  },
                  errorText:
                      assMobileError ? "Please Enter Valid Mobile" : null,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Focus(
                        onFocusChange: (hasFocus) {
                          if (!hasFocus && !assEmailError && !emailVerified) {
                            checkUser(context, onSucess: (bool value) {
                              setState(() {
                                    emailVerified = value;
                              if (!value) {
                              _emailController.text = "";
                              }
                              });
                          
                             
                            });
                          }
                        },
                        child: RegisterTextfield(
                          text: "Email*",
                          controller: _emailController,
                          textInputType: TextInputType.emailAddress,
                          onChanged: (String value) {
                            setState(() {
                              emailVerified = false;
                              assEmailError = !RegExp(CommonPattern.email_regex)
                                  .hasMatch(value);
                            });
                          },
                          errorText:
                              assEmailError ? "Please Enter Valid Email" : null,
                        ),
                      ),
                    ),
                    (emailVerified)
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
                // RegisterTextfield(
                //   text: "Email*",
                //   controller: _emailController,
                //   textInputType: TextInputType.emailAddress,
                //   onChanged: (String value) {
                //     setState(() {
                //       assEmailError =
                //           !RegExp(CommonPattern.email_regex).hasMatch(value);
                //     });
                //   },
                //   errorText: assEmailError ? "Please Enter Valid Email" : null,
                // ),
                SizedBox(
                  height: 20,
                ),
                ButtonView(
                  buttonText: "SUBMIT",
                  color: AppColors.mainLightColor,
                  onPressed: () {
                    setState(() {
                      assNameError = !RegExp(CommonPattern.name_regex)
                          .hasMatch(_nameController.text);
                      assMobileError = !RegExp(CommonPattern.mobile_regex)
                          .hasMatch(_mobileController.text);
                      assEmailError = !RegExp(CommonPattern.email_regex)
                          .hasMatch(_emailController.text);
                    });

                    if (!assNameError && !assMobileError && !assEmailError) {
                      Navigator.pop(context);
                    
                      widget.onSubmitClicked(_nameController.text,
                          _mobileController.text, _emailController.text);
                    }
                  },
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
