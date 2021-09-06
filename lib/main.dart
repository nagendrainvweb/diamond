import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_screens/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.barlowTextTheme(
          Theme.of(context).textTheme
        )
      ),
      home: LoginPage(),
    );
  }
}

