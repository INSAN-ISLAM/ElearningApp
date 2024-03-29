import 'package:demo_project/Screen/profile_Page.dart';
import 'package:flutter/material.dart';

import 'Home_Page.dart';
import 'Info_Page.dart';

class DashBord extends StatefulWidget {
  const DashBord({Key? key}) : super(key: key);


  @override
  State<DashBord> createState() => _DashBordState();
}

class _DashBordState extends State<DashBord> {
  int _selectedIndex = 0;
  static const List pages = [
    HomePage1(),
    InformationPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Center(
        child: pages.elementAt(_selectedIndex), //New
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,

        onTap:(index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        unselectedItemColor: Colors.white,
        backgroundColor: Colors.cyan,
        elevation:0,
        iconSize:12,
        mouseCursor:SystemMouseCursors.grab,
        selectedItemColor: Colors.amberAccent,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        unselectedIconTheme: IconThemeData(
          color: Colors.deepOrangeAccent,
        ),
        items:  <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.message),label: "InformationPage"),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: "Profile")
        ],

      ),
    );
  }
}
