import 'package:diamon_assorter/app_screens/update_profile/updateCompanyProfile_screen.dart';
import 'package:diamon_assorter/app_widget/app_appbar.dart';
import 'package:diamon_assorter/app_widget/register_textfield.dart';
import 'package:diamon_assorter/util/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({Key key}) : super(key: key);

  @override
  _UpdateProfileState createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Column(
        children: [
          AppAppBar(
            showBackButton: true,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView(
                children: [
                    RegisterTextfield(
                  text: "Type",
                  textInputType: TextInputType.name,
                ),
                SizedBox(
                  height: 20,
                ),
                RegisterTextfield(
                  text: "Name",
                  textInputType: TextInputType.name,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: RegisterTextfield(
                        text: "Mobile",
                        textInputType: TextInputType.number,
                      ),
                    ),
                   
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                RegisterTextfield(
                  text: "Email",
                  textInputType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: 20,
                ),
                
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
