import 'package:diamon_assorter/app_screens/dashboard/cart_widget.dart';
import 'package:diamon_assorter/app_screens/dashboard/contact_widget.dart';
import 'package:diamon_assorter/app_screens/dashboard/profile_widget.dart';
import 'package:diamon_assorter/app_widget/app_appbar.dart';
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
       bottomNavigationBar:_SetBottomNavigationBar(),
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppAppBar(),
          Expanded(
            child: _children[_currentIndex],
          ),
          
        ],
      ), 
      

    );
  }
}
