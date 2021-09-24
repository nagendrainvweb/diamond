import 'package:diamon_assorter/app_screens/update_profile/updateCompanyProfile_screen.dart';
import 'package:diamon_assorter/app_widget/app_appbar.dart';
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
            child: UpdateCompanyProfile(),
          )
        ],
      ),
    );
  }
}
