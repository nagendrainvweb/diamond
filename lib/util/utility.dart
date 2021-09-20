import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final String NO_INTERNET_CONN = "No internet connection";
final String SOMETHING_WRONG_TEXT =
    "Something went wrong, sorry for inconvenience cause you, Please try after some time.";

class Utility {
  static void pushToNext(BuildContext context, dynamic page) {
    Navigator.push(
      context,
      CupertinoPageRoute(builder: (context) => page),
    );
  }
  static pushToDashBoard(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil(
        '/HomePage', ModalRoute.withName('/LoginPage'));
  }
  static pushToLogin(BuildContext context) {
    Navigator.of(context)
    .pushNamedAndRemoveUntil('/LoginPage', (Route<dynamic> route) => false);
  }
}

void myPrint(String text) {
  print(text);
}
