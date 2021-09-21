import 'package:diamon_assorter/app_screens/new_order/newOrder_screen.dart';
import 'package:diamon_assorter/util/app_color.dart';
import 'package:diamon_assorter/util/app_image.dart';
import 'package:diamon_assorter/util/utility.dart';
import 'package:flutter/material.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  _buttonTiles(String text, String image, Function onClick) {
    return InkWell(
      onTap: onClick,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 30,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [AppColors.mainDarkColor, AppColors.mainLightColor],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          children: [
            Column(
              children: [
                Image.asset(
                  image,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                // Icon(
                //   icons,
                //   size: 45.0,
                //   color: AppColors.whiteColor,
                //   ),
                Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: MediaQuery.removeViewPadding(
        removeTop: true,
        context: context,
        child: ListView(
          children: [
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Expanded(
                  child: _buttonTiles(
                    "Upcoming\nOrders",
                    AppImages.upcomingOrder,
                    (){},
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: _buttonTiles(
                    "Pending\nOrders",
                    AppImages.pendingOrder,
                    (){},
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: _buttonTiles(
                    "Ongoing\nOrders",
                    AppImages.ongoingOrder,
                    (){},
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: _buttonTiles(
                    "New\nOrders",
                    AppImages.newOrder,
                    () {
                      Utility.pushToNext(context, NewOrderPage());
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: _buttonTiles(
                    "Completed\nOrders",
                    AppImages.completeOrder,
                    (){},
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Container(),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
