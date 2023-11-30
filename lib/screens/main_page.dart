import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:watchapp/screens/home_page.dart';
import 'package:watchapp/screens/profile.dart';
import 'package:watchapp/screens/settings_page.dart';
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  static final List<Widget> _pages = <Widget>[
    const Homepage(),
    const Settings1(),
    const Profile(),
    const Settings1()
  ];
  int _currentSelectedIndex = 0;
  void _onTabTapped(int index) {
    setState(() {
      _currentSelectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const Drawer(),
        body:  Center(child: _pages[_currentSelectedIndex]),
        bottomNavigationBar:  CurvedNavigationBar(
          backgroundColor: Colors.white,
          items: const <Widget>[
            Icon(Icons.home, size: 30,),
            Icon(Icons.favorite, size: 30,),
            Icon(Icons.shopping_cart, size: 30),
            Icon(Icons.settings, size: 30),
          ],
          color: Colors.white,
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