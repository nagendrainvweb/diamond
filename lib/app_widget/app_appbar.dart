import 'package:diamon_assorter/util/app_color.dart';
import 'package:diamon_assorter/util/app_image.dart';
import 'package:diamon_assorter/util/utility.dart';
import 'package:flutter/material.dart';

class AppAppBar extends StatelessWidget {
  const AppAppBar(
      {Key key,
      this.showLogout = false,
      this.onLogoutClicked,
      this.showMenuButton = false,
      this.showBackButton = false, this.onMenuClicked})
      : super(key: key);
  final bool showLogout;
  final Function onLogoutClicked;
  final bool showBackButton;
  final bool showMenuButton;
  final Function onMenuClicked;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.mainColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(35),
          bottomRight: Radius.circular(35),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.mainLightColor.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: SafeArea(
        top: true,
        child: Container(
          child: Stack(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // SizedBox(height: 30,),
              Center(
                child: Image.asset(
                  AppImages.logo,
                  height: 80,
                  // width: 150,
                  fit: BoxFit.contain,
                ),
              ),
              (showLogout)
                  ? Align(
                      alignment: Alignment.bottomRight,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          IconButton(
                              icon: Icon(Icons.logout,
                                  color: AppColors.whiteColor),
                              onPressed: onLogoutClicked),
                        ],
                      ),
                    )
                  : Container(),
              (showBackButton)
                  ? Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                          height: 80,
                          child: Container(
                            child: IconButton(
                                icon: Icon(Icons.chevron_left_outlined,
                                    color: AppColors.whiteColor),
                                onPressed: () {
                                  Navigator.pop(context);
                                }),
                          )),
                    )
                  : Container(),
              (showMenuButton)
                  ? Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                          height: 80,
                          child: Container(
                            child: IconButton(
                                icon: Icon(Icons.menu,
                                    color: AppColors.whiteColor),
                                onPressed: onMenuClicked),
                          )),
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }
}
