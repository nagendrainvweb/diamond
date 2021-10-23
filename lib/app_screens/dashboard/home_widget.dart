import 'package:diamon_assorter/app/app_repo.dart';
import 'package:diamon_assorter/app_screens/new_order/newOrder_screen.dart';
import 'package:diamon_assorter/util/app_color.dart';
import 'package:diamon_assorter/util/app_image.dart';
import 'package:diamon_assorter/util/utility.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
        margin: EdgeInsets.symmetric(horizontal: 8),
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
                  height: 80,
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
        horizontal: 20,
      ),
      child: MediaQuery.removeViewPadding(
        removeTop: true,
        context: context,
        child: ListView(
          children: [
            SizedBox(
              height: 30,
            ),
            Consumer<AppRepo>(
                builder: (_, AppRepo repo, child) => Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(color: AppColors.grey400),
                          color: AppColors.whiteColor),
                      padding: const EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 12),
                      child: Row(
                        children: [
                          CircleAvatar(
                            child: Icon(Icons.person_outline_outlined),
                          ),
                          SizedBox(
                            width: 14,
                          ),
                          // Container(
                          //   decoration:BoxDecoration(
                          //     shape: BoxShape.circle,
                          //     border: Border.all(color: AppColors.grey600)
                          //   ),
                          //   padding: const EdgeInsets.all(5),
                          //   child: Icon(Icons.person_outline_outlined,color: AppColors.grey600,)),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Welcome, " + repo.name,
                                  textScaleFactor: 1,
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  "Registered As : " + repo.role.toUpperCase(),
                                  textScaleFactor: 0.9,
                                  
                                ),
                                //  SizedBox(height: 8,),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Expanded(
                  child: _buttonTiles(
                    "Pending\nOrders",
                    AppImages.pendingOrder,
                    () {},
                  ),
                ),
                // SizedBox(
                //   width: 10,
                // ),
                Expanded(
                  child: _buttonTiles(
                    "Ongoing\nOrders",
                    AppImages.ongoingOrder,
                    () {},
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
                    "New\nOrders",
                    AppImages.newOrder,
                    () {
                      Utility.pushToNext(context, NewOrderPage());
                    },
                  ),
                ),
                // SizedBox(
                //   width: 20,
                // ),
                Expanded(
                  child: _buttonTiles(
                    "Completed\nOrders",
                    AppImages.completeOrder,
                    () {
                      // Utility.pushToNext(context, NewOrderPage());
                    },
                  ),
                ),
              ],
            ),
            // SizedBox(
            //   height: 20,
            // ),
            // Row(
            //   children: [
            //     Expanded(
            //       child: _buttonTiles(
            //         "Completed\nOrders",
            //         AppImages.completeOrder,
            //         (){},
            //       ),
            //     ),
            //     // SizedBox(
            //     //   width: 20,
            //     // ),
            //     Expanded(
            //       child: Container(),
            //     ),
            //   ],
            // ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
