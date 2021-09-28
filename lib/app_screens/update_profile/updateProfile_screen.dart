import 'package:diamon_assorter/app_screens/update_profile/updateCompanyProfile_screen.dart';
import 'package:diamon_assorter/app_widget/app_appbar.dart';
import 'package:diamon_assorter/app_widget/circular_widget.dart';
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
          SizedBox(height: 15,),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            child: Stack(
              children: [
                CircularBorder(
                  child: Column(
                    children: [
                      RegisterTextfield(
                          text: "Type",
                          textInputType: TextInputType.name,
                        ),SizedBox(
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
                    ],
                  ),
                ),
                 Container(
                    margin: EdgeInsets.only(
                      left: 20,
                      bottom: 20,
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
          ),
            
        ],
      ),
    );
  }
}
