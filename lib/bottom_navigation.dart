import 'package:flutter/material.dart';
import 'package:mission_ed/screens/_networks.dart';
import 'home_screen.dart';
import 'package:mission_ed/screens/message.dart';
import 'package:mission_ed/screens/notifications.dart';
import 'profile_screen.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int pageIndex=0;
  List<Widget>pageList = <Widget>[
    HomeScreen(),
    NetworkSection(),
    Message(),
    Notifications(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:pageList[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xff312C69),
        selectedIconTheme: IconThemeData(color: Colors.white),
        selectedItemColor: Colors.white,
        unselectedItemColor: Color(0xFFEAEAEA),
        currentIndex: pageIndex,
        onTap: (value){
          setState(() {
            pageIndex=value;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.people_rounded), label: 'Network'),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Message'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: 'Notification'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_rounded), label: 'Profile'),
        ],
      ),
    );
  }
}
