import 'package:diamon_assorter/util/app_color.dart';
import 'package:flutter/material.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  _buttonTiles( String text, IconData icons) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 30,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                AppColors.mainDarkColor,
                AppColors.mainLightColor
              ],
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
              Icon(
                icons,
                size: 45.0,
                color: AppColors.whiteColor,
                ),
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: EdgeInsets.symmetric(
        horizontal: 40,
      ),
      child: Column(
        children: [
          SizedBox(height: 60,),
          Row(
            children: [
              Expanded(child: _buttonTiles(
                "Upcoming\nOrders",
                Icons.shopping_cart_rounded,
              ),),
              SizedBox(width: 20,),
              Expanded(child: _buttonTiles(
                "Pending\nOrders",
                Icons.shopping_cart_rounded,
              ),),
              
            ],
          ),
          SizedBox(height: 20,),
          Row(
            children: [
              Expanded(
                child: 
                _buttonTiles(
                "Ongoing\nOrders",
                Icons.shopping_cart_rounded,
              ),
                ),
                SizedBox(width: 20,),
              Expanded(child:_buttonTiles(
                "New\nOrders",
                Icons.shopping_cart_rounded,
              ), ),
              
            ],
          ),
          SizedBox(height: 20,),
          Row(
            children: [
              Expanded(
                child: _buttonTiles(
                "Completed\nOrders",
                Icons.shopping_cart_rounded,
              ),
              ),
              SizedBox(width: 20,),
              Expanded(child: Container(),),
              
            ],
          ),
        ],
      ),
    );
  }
}
