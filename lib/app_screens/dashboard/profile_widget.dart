import 'package:diamon_assorter/app_widget/button_widget.dart';
import 'package:diamon_assorter/util/app_color.dart';
import 'package:diamon_assorter/util/utility.dart';
import 'package:flutter/material.dart';

import '../update_profile/updateProfile_screen.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({Key key}) : super(key: key);

  @override
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ButtonView(
            buttonText: "Update Profile",
            color: AppColors.mainColor,
            onPressed: () {
              Utility.pushToNext(context, UpdateProfile());
            },
          ),
        ],
      ),
    );
  }
}
