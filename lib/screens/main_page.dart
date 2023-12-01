import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:watchapp/screens/home_page.dart';
import 'package:watchapp/screens/profile.dart';
import 'package:watchapp/screens/settings_page.dart';
class MainPage1 extends StatefulWidget {
  const MainPage1({super.key});

  @override
  State<MainPage1> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage1> {

  int _currentSelectedIndex = 0;
  final List<Widget> _pages=[
    const Homepage(),
    const Settings1(),
    const Profile(),
    const Settings1()
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //drawer: const Drawer(),
        body:_pages[_currentSelectedIndex],
        bottomNavigationBar:  CurvedNavigationBar(
          color: Colors.red,
          backgroundColor: Colors.white,
          items: const <Widget>[
            Icon(Icons.home, size: 30,),
            Icon(Icons.favorite, size: 30,),
            Icon(Icons.shopping_cart, size: 30),
            Icon(Icons.settings, size: 30),
          ],
          onTap: (index) {
            setState(() {
              _currentSelectedIndex = index;

            });
          },
        ),
      ),
    );
  }
}