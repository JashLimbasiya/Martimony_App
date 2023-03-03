import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:wed_app/constant.dart';
import 'package:wed_app/screens/home_screen.dart';
import 'package:wed_app/screens/profile.dart';

import 'database_operation.dart';
import 'api_operation.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationstate();
}

class _BottomNavigationstate extends State<BottomNavigation> {
  int selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    const ApiOperationPage(),
    const DatabaseOperation(),
    UserProfile(),
  ];

  void _onItemTapped(int index) {
    selectedIndex = index;
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: _widgetOptions[selectedIndex],
        ),
        backgroundColor: Colors.white,
        bottomNavigationBar: Container(
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: GNav(
              gap: 10,
              padding: EdgeInsets.all(16),
              backgroundColor: kBackgroundColor,
              color: Colors.red,
              activeColor: Colors.white,
              tabBackgroundColor: kPrimaryColor,
              onTabChange: _onItemTapped,
              tabs: [
                GButton(
                  icon: LineIcons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: LineIcons.plus,
                  text: 'API',
                ),
                GButton(
                  icon: LineIcons.plus,
                  text: 'Database',
                ),
                GButton(
                  icon: LineIcons.user,
                  text: 'Profile',
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
