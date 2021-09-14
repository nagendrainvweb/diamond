import 'package:diamon_assorter/util/app_color.dart';
import 'package:diamon_assorter/util/app_image.dart';
import 'package:flutter/material.dart';
class AppAppBar extends StatelessWidget {
  const AppAppBar({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
     // height: 150,
      decoration: BoxDecoration(
        color: AppColors.mainColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(35),
          bottomRight: Radius.circular(35),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 20,),
          Image.asset(
            AppImages.logo,
            height: 130,
            // width: 150,
            fit: BoxFit.contain,
          )
        ],
      ),
    );
  }
}