import 'package:diamon_assorter/util/app_color.dart';
import 'package:flutter/material.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  _buttonTiles() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.mainColor,
      ),
      child: Column(
        children: [
          Column(
            children: [
              Icon(Icons.shopping_cart_sharp),
              Text("Upcoming Orders"),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buttonTiles(),
              _buttonTiles(),
            ],
          ),
          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buttonTiles(),
              _buttonTiles(),
            ],
          ),
          Row(
            children: [
              _buttonTiles(),
            ],
          )
        ],
      ),
    );
  }
}
