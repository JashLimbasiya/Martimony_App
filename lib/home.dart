import 'package:flutter/material.dart';
import 'package:matrimony_app/api/api_page.dart';
import 'package:matrimony_app/database/user_list.dart';
import 'package:matrimony_app/profile.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final tab = [
    const Center(
      child: Text(
        'Welcome To Matrimony',
        style: TextStyle(
          fontSize: 20,
          color: Colors.red,
        ),
      ),
    ),
    const UserList(),
    const AllName(),
    const UserProfile(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: tab[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          iconSize: 25,
          selectedFontSize: 15,
          backgroundColor: Colors.red,
          selectedItemColor: Colors.white,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home", backgroundColor: Colors.red),
            BottomNavigationBarItem(icon: Icon(Icons.add), label: "Database Crud", backgroundColor: Colors.red),
            BottomNavigationBarItem(icon: Icon(Icons.add), label: "Api Crud", backgroundColor: Colors.red),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile", backgroundColor: Colors.red),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
