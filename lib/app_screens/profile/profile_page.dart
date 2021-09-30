import 'package:diamon_assorter/app/locator.dart';
import 'package:diamon_assorter/app_screens/address/address_page.dart';
import 'package:diamon_assorter/app_screens/document/document_page.dart';
import 'package:diamon_assorter/app_screens/other_details/other_details.dart';
import 'package:diamon_assorter/app_screens/update_profile/updateProfile_screen.dart';
import 'package:diamon_assorter/app_widget/app_appbar.dart';
import 'package:diamon_assorter/app_widget/button_widget.dart';
import 'package:diamon_assorter/app_widget/register_textfield.dart';
import 'package:diamon_assorter/services/api_services.dart';
import 'package:diamon_assorter/util/app_color.dart';
import 'package:diamon_assorter/util/app_helper.dart';
import 'package:diamon_assorter/util/common_pattern.dart';
import 'package:diamon_assorter/util/constants.dart';
import 'package:diamon_assorter/util/dialog_helper.dart';
import 'package:diamon_assorter/util/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with AppHelper {
  final _apiService = locator<ApiService>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppAppBar(
            showBackButton: true,
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 140,
                  width: 140,
                  child: CircleAvatar(
                      // child: SvgPicture.asset(AppImages.profile,height: 120,width: 120,),
                      ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      ProfileTile(
                        text: "Profile",
                        iconData: Icons.person_outline_outlined,
                        onClick: () {
                          Utility.pushToNext(context, UpdateProfile());
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      ProfileTile(
                        text: "Address",
                        iconData: Icons.location_city_outlined,
                        onClick: () {
                          Utility.pushToNext(context, AddressPage());
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      ProfileTile(
                        text: "Documents",
                        iconData: Icons.insert_drive_file_outlined,
                        onClick: () {
                          Utility.pushToNext(context, DocumentPage());
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      ProfileTile(
                        text: "Other Details",
                        iconData: Icons.checklist_outlined,
                        onClick: () {
                          Utility.pushToNext(context, OtherDetails());
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      ProfileTile(
                        text: "Change Password",
                        iconData: Icons.lock_open_outlined,
                        onClick: () {
                          _showChangePasswordSheet();
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
        ],
      ),
    );
  }

  _showChangePasswordSheet() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        builder: (_) => ChangePasswordWidget(
              context: context,
              onSubmitClicked: (String oldPassword, String newPassword) {
                _changePassword(oldPassword, newPassword);
              },
            ));
  }

  _changePassword(String oldPass, String newPass) async {
    try {
      progressDialog("Please wait..", context);
      final response = await _apiService.changePassword(oldPass, newPass);
      hideProgressDialog(context);
      DialogHelper.showErrorDialog(context, "Message", response.message);
    } catch (e) {
      myPrint(e.toString());
      hideProgressDialog(context);
      DialogHelper.showErrorDialog(context, "Error", e.toString());
    }
  }
}

class ChangePasswordWidget extends StatefulWidget {
  const ChangePasswordWidget({
    Key key,
    @required this.context,
    this.onSubmitClicked,
  }) : super(key: key);

  final BuildContext context;
  final Function onSubmitClicked;

  @override
  State<ChangePasswordWidget> createState() => _ChangePasswordWidgetState();
}

class _ChangePasswordWidgetState extends State<ChangePasswordWidget> {
  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _oldObsecureText = true;
  bool _newObsecureText = true;
  bool _confirmObsecureText = true;

  bool _oldError = false;
  bool _newError = false;
  bool _confirmError = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //SizedBox(width: 20,),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      "Change Password",
                      style: TextStyle(
                        fontSize: 18,
                      ),
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
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                //crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  // RegisterTextfield()

                  RegisterTextfield(
                    text: "Old Password*",
                    controller: _oldPasswordController,
                    showIcon: true,
                    textInputType: TextInputType.text,
                    onIconClicked: () {
                      setState(() {
                        _oldObsecureText = !_oldObsecureText;
                      });
                    },
                    obsecure: _oldObsecureText,
                    icon: _oldObsecureText
                        ? Icons.visibility
                        : Icons.visibility_off,
                    onChanged: (String value) {
                      setState(() {
                        _oldError = !RegExp(CommonPattern.passwordRegex)
                            .hasMatch(value);
                      });
                    },
                    errorText: _oldError ? Constants.PASSWORD_MSG : null,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RegisterTextfield(
                    text: "New Password*",
                    controller: _newPasswordController,
                    showIcon: true,
                    textInputType: TextInputType.text,
                    onIconClicked: () {
                      setState(() {
                        _newObsecureText = !_newObsecureText;
                      });
                    },
                    obsecure: _newObsecureText,
                    icon: _newObsecureText
                        ? Icons.visibility
                        : Icons.visibility_off,
                    onChanged: (String value) {
                      setState(() {
                        _newError = !RegExp(CommonPattern.passwordRegex)
                            .hasMatch(value);
                      });
                    },
                    errorText: _newError ? Constants.PASSWORD_MSG : null,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RegisterTextfield(
                    text: "Confirm Password*",
                    controller: _confirmPasswordController,
                    showIcon: true,
                    textInputType: TextInputType.text,
                    onIconClicked: () {
                      setState(() {
                        _confirmObsecureText = !_confirmObsecureText;
                      });
                    },
                    obsecure: _confirmObsecureText,
                    icon: _confirmObsecureText
                        ? Icons.visibility
                        : Icons.visibility_off,
                    onChanged: (String value) {
                      setState(() {
                        _confirmError = _newPasswordController.text != value;
                      });
                    },
                    errorText:
                        _confirmError ? Constants.CONFIRM_PASSWORD_MSG : null,
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  ButtonView(
                    buttonText: "Submit",
                    color: AppColors.mainColor,
                    onPressed: () {
                      setState(() {
                        _oldError = !RegExp(CommonPattern.passwordRegex)
                            .hasMatch(_oldPasswordController.text);

                        _newError = !RegExp(CommonPattern.passwordRegex)
                            .hasMatch(_newPasswordController.text);
                        _confirmError = _newPasswordController.text !=
                            _confirmPasswordController.text;
                      });
                      if (!_oldError && !_newError && !_confirmError) {
                        Navigator.pop(context);
                        widget.onSubmitClicked(_oldPasswordController.text,
                            _confirmPasswordController.text);
                      }
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ProfileTile extends StatelessWidget {
  const ProfileTile({
    Key key,
    this.text,
    this.iconData,
    this.onClick,
  }) : super(key: key);
  final String text;
  final IconData iconData;
  final Function onClick;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.grey500, width: 1)),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Row(
          children: [
            Icon(
              iconData,
              color: AppColors.grey600,
            ),
            SizedBox(
              width: 12,
            ),
            Expanded(
                child: Text(
              text,
              textScaleFactor: 1.1,
              style: TextStyle(
                  color: AppColors.grey700, fontWeight: FontWeight.bold),
            )),
            Icon(
              Icons.chevron_right_outlined,
              color: AppColors.grey600,
            )
          ],
        ),
      ),
    );
  }
}
