import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/app_repo.dart';
import 'app/locator.dart';
import 'app_screens/login/login_screen.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.setMockInitialValues({});
  setUpLocator();
  setupDialogUi();
   final model = AppRepo();
  await model.init();

  runApp(MyApp(
    repo: model,
  ));
}

class MyApp extends StatelessWidget {

  final AppRepo repo;

  const MyApp({Key key, this.repo}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AppRepo>.value(value: repo)
      ],
      child: MaterialApp(
        //title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: GoogleFonts.barlowTextTheme(
            Theme.of(context).textTheme
          )
        ),
        home: LoginPage(),
      ),
    );
  }
}

