import 'package:diamon_assorter/util/app_color.dart';
import 'package:flutter/material.dart';

class TopLeftHeaderWidget extends StatelessWidget {
  const TopLeftHeaderWidget({Key key, this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 15,
      ),
      padding: EdgeInsets.all(
        5,
      ),
      color: AppColors.whiteColor,
      child: Text(
        "$text",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black54,
        ),
      ),
    );
  }
}
