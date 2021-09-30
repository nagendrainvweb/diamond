import 'package:diamon_assorter/app_screens/dashboard/cart_widget.dart';
import 'package:diamon_assorter/app_screens/dashboard/contact_widget.dart';
import 'package:diamon_assorter/app_screens/dashboard/profile_widget.dart';
import 'package:diamon_assorter/app_widget/app_appbar.dart';
import 'package:diamon_assorter/app_widget/app_drawer.dart';
import 'package:diamon_assorter/prefrence_util/Prefs.dart';
import 'package:diamon_assorter/util/dialog_helper.dart';
import 'package:diamon_assorter/util/utility.dart';
import 'package:flutter/material.dart';

import 'home_widget.dart';

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({Key key}) : super(key: key);

  @override
  _DashBoardPageState createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomeWidget(),
    CartWidget(),
    ContactWidget(),
    ProfileWidget(),
  ];

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  _SetBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.grey.shade100,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey.shade500,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      onTap: onTabTapped,

      currentIndex: _currentIndex, // this will be set when a new tab is tapped
      items: [
        BottomNavigationBarItem(
          icon: new Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: new Icon(Icons.shopping_cart),
          label: 'Shopping',
        ),
        BottomNavigationBarItem(
          icon: new Icon(Icons.call),
          label: 'Messages',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
     // bottomNavigationBar: _SetBottomNavigationBar(),
      drawer: AppDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppAppBar(
           // showLogout: true,
            showMenuButton: true,
            onMenuClicked: () {
              _scaffoldKey.currentState.openDrawer();
            },
            onLogoutClicked: () {
              DialogHelper.showLogoutDialog(context, () {
                Navigator.pop(context);
                Prefs.clear();
                Utility.pushToLogin(context);
              });
            },
          ),
          Expanded(
            child: HomeWidget(),
            //child: _children[_currentIndex],
          ),
        ],
      ),
    );
  }
}


