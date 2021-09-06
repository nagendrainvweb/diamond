import 'package:diamon_assorter/util/app_color.dart';
import 'package:flutter/material.dart';

class ButtonView extends StatelessWidget {
  const ButtonView({Key key, this.buttonText, this.onPressed, this.color})
      : super(key: key);

  final String buttonText;
  final Function onPressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 120,
      padding: EdgeInsets.symmetric(
        horizontal: 30,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      color: color,
      onPressed: onPressed,
      child: Text(
        buttonText,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
