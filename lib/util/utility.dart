import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Utility{

  static void pushToNext(BuildContext context,dynamic page){
      Navigator.push(
                context,
                CupertinoPageRoute(builder: (context) => page),
              );
  }
}