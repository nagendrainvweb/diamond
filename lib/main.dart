import 'package:diamon_assorter/app_screens/dashboard/dashboard.dart';
import 'package:diamon_assorter/prefrence_util/Prefs.dart';
import 'package:diamon_assorter/util/utility.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/app_repo.dart';
import 'app/locator.dart';
import 'app_screens/login/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //SharedPreferences.setMockInitialValues({});
  setUpLocator();
  setupDialogUi();
  final model = AppRepo();
  await model.init();
  final login = await Prefs.login;
  myPrint("start login is $login");
  runApp(MyApp(
    repo: model,
    login: login,
  ));
}

final routies = {
  '/HomePage': (BuildContext context) => DashBoardPage(),
  '/LoginPage': (BuildContext context) => LoginPage(),
};

class MyApp extends StatelessWidget {
  final AppRepo repo;
  final bool login;

  const MyApp({Key key, this.repo, this.login}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider<AppRepo>.value(value: repo)],
      child: MaterialApp(
        //title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme:
                GoogleFonts.barlowTextTheme(Theme.of(context).textTheme)),
        home: (login) ? DashBoardPage() : LoginPage(),
        routes: routies,
      ),
    );
  }
}
