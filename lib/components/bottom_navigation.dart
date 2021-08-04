import 'package:flutter/material.dart';
import 'package:mission_ed/components/constants.dart';
import 'package:mission_ed/screens/network_screen.dart';
import '../screens/home_screen.dart';
import 'package:mission_ed/screens/notifications.dart';
import '../screens/profile_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  final user = FirebaseAuth.instance.currentUser;
  int pageIndex = 0;
  List<Widget> pageList = <Widget>[
    HomeScreen(),
    NetworkSection(),
    Notifications(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageList[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: kPrimaryColor,
        selectedIconTheme: IconThemeData(color: Colors.white),
        selectedItemColor: Colors.white,
        unselectedItemColor: kSecondaryColor,
        currentIndex: pageIndex,
        onTap: (value) {
          setState(() {
            pageIndex = value;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.people_rounded), label: 'Network'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: 'Notification'),
          BottomNavigationBarItem(
              icon: user.photoURL == null
                  ? Icon(Icons.person_rounded)
                  : CircleAvatar(
                      radius: 16,
                      backgroundImage: NetworkImage(user.photoURL),
                    ),
              label: 'Profile'),
        ],
      ),
    );
  }
}
