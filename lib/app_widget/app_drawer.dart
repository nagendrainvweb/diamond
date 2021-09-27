import 'package:diamon_assorter/app/app_repo.dart';
import 'package:diamon_assorter/app_screens/dashboard/profile_widget.dart';
import 'package:diamon_assorter/app_screens/profile/profile_page.dart';
import 'package:diamon_assorter/util/app_color.dart';
import 'package:diamon_assorter/util/app_image.dart';
import 'package:diamon_assorter/util/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      height: double.maxFinite,
      margin: EdgeInsets.symmetric(vertical: 25),
      decoration: BoxDecoration(
      //r  border: Border.all(color: AppColors.mainColor),
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(35), bottomRight: Radius.circular(35)),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.mainLightColor, AppColors.mainDarkColor],
        ),
      ),
      child: SingleChildScrollView(
        child: Scrollbar(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                height: 120,
                width: 120,
                child: CircleAvatar(
                    // child: SvgPicture.asset(AppImages.profile,height: 120,width: 120,),
                    ),
              ),
              SizedBox(
                height: 10,
              ),
              Consumer<AppRepo>(
                  builder: (_, repo, child) => Text(
                        "Hi, " + repo.name,
                        style: TextStyle(
                            color: AppColors.blackLight,
                            fontWeight: FontWeight.bold),
                      )),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 0.5,
                color: AppColors.blackText,
              ),
              ListTile(
                title: Text(
                  "Profile",
                  style: TextStyle(
                      color: AppColors.blackLight, fontWeight: FontWeight.bold),
                ),
                leading: Icon(
                  Icons.person_outline,
                  color: AppColors.blackLight,
                ),
                onTap: () {
                  Navigator.pop(context);
                  Utility.pushToNext(context, ProfilePage());
                },
              ),
              Container(
                height: 0.5,
                color: AppColors.blackText,
              ),
              ListTile(
                title: Text(
                  "Order",
                  style: TextStyle(
                      color: AppColors.blackLight, fontWeight: FontWeight.bold),
                ),
                leading: Icon(
                  Icons.shopping_cart_outlined,
                  color: AppColors.blackLight,
                ),
              ),
              Container(
                height: 0.5,
                color: AppColors.blackText,
              ),
              ListTile(
                title: Text(
                  "Request",
                  style: TextStyle(
                      color: AppColors.blackLight, fontWeight: FontWeight.bold),
                ),
                leading: Icon(
                  Icons.request_page_outlined,
                  color: AppColors.blackLight,
                ),
              ),
              Container(
                height: 0.5,
                color: AppColors.blackText,
              ),
              ListTile(
                title: Text(
                  "Help",
                  style: TextStyle(
                      color: AppColors.blackLight, fontWeight: FontWeight.bold),
                ),
                leading: Icon(
                  Icons.help_center_outlined,
                  color: AppColors.blackLight,
                ),
              ),
              Container(
                height: 0.5,
                color: AppColors.blackText,
              ),
              ListTile(
                title: Text(
                  "Terms & Condition",
                  style: TextStyle(
                      color: AppColors.blackLight, fontWeight: FontWeight.bold),
                ),
                leading: Icon(
                  Icons.file_present_rounded,
                  color: AppColors.blackLight,
                ),
              ),
              Container(
                height: 0.5,
                color: AppColors.blackText,
              ),
              ListTile(
                title: Text(
                  "Version",
                  style: TextStyle(
                      color: AppColors.blackLight, fontWeight: FontWeight.bold),
                ),
                leading: Icon(
                  Icons.phone_android_outlined,
                  color: AppColors.blackLight,
                ),
              ),
              Container(
                height: 0.5,
                color: AppColors.blackText,
              ),
              ListTile(
                title: Text(
                  "Logout",
                  style: TextStyle(
                      color: AppColors.blackLight, fontWeight: FontWeight.bold),
                ),
                leading: Icon(
                  Icons.logout_outlined,
                  color: AppColors.blackLight,
                ),
              ),
              Container(
                height: 0.5,
                color: AppColors.blackText,
              ),

              // Expanded(
              //   child: ListView.builder(
              //       itemCount: 5,
              //       itemBuilder: (context, index) {
              //         return Column(
              //           children: [
              //             ListTile(
              //               title: Text("index $index"),
              //             ),
              //             Container(height:0.5,color: AppColors.whiteColor,),
              //           ],
              //         );
              //       }),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
