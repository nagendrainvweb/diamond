import 'package:diamon_assorter/util/app_color.dart';
import 'package:flutter/material.dart';

class CircularBorder extends StatelessWidget {
  final Widget child;

  const CircularBorder({Key key, this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        margin: EdgeInsets.only(
          top: 15,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: AppColors.grey400,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child:child ,
        );
  }
}