import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import 'package:watchapp/view/screens/home_page.dart';
import 'package:watchapp/view/screens/profile.dart';
import 'package:watchapp/view/screens/settings_page.dart';

import '../../controller/get_user_data_controller.dart';
import '../../controller/google_signin_controller.dart';
import 'cart_screen.dart';
import 'favorites_page.dart';

class MainPage1 extends StatefulWidget {
  const MainPage1({super.key});

  @override
  State<MainPage1> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage1> {
  int _currentSelectedIndex = 0;
  var titles = ["Home", "Favorites", "Cart", "Settings"];
  final List<Widget> _pages = [
    const HomePage(),
    Favorites(),
    const Cart(),
    const Settings1(),
  ];

  final _advancedDrawerController = AdvancedDrawerController();
  final GoogleSignInController googleSignInController = GoogleSignInController();
  final GetUserDataController _getUserDataController = Get.put(GetUserDataController());

  late final User user;
  late List<QueryDocumentSnapshot<Object?>> userData = [];

  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser!;
    _getUserData();
  }

  Future<void> _getUserData() async {
    userData = await _getUserDataController.getUserData(user.uid);
    if (mounted) {
      setState(() {});
    }
  }

  _handleMenuButtonPressed() {
    _advancedDrawerController.showDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        return AdvancedDrawer(
          backdrop: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.blue, Colors.white.withOpacity(0.2)],
              ),
            ),
          ),
          controller: _advancedDrawerController,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 300),
          animateChildDecoration: true,
          rtlOpening: false,
          childDecoration: const BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black12,
                blurRadius: 0.0,
              ),
            ],
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          drawer: SafeArea(
            child: ListTileTheme(
              textColor: Colors.white,
              iconColor: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage:
                          NetworkImage(
                              userData.isNotEmpty ? userData[0]['userImg'] ?? '' : ''
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "${userData.isNotEmpty ? userData[0]['username'] : 'N/A'}",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      color: Colors.red,
                    ),
                  ),
                  Text(
                    "${userData.isNotEmpty ? userData[0]['email'] : 'N/A'}",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return const MainPage1();
                        }),
                            (route) => false,
                      );
                    },
                    leading: const Icon(Icons.home),
                    title: const Text('Home'),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return const Profile();
                        }),
                      );
                    },
                    leading: const Icon(Icons.account_box),
                    title: const Text('Profile'),
                  ),
                  ListTile(
                    onTap: () {
                      setState(() {
                        _currentSelectedIndex = 1; // Navigate to Favorites page
                      });
                    },
                    leading: const Icon(Icons.favorite),
                    title: const Text('Favourites'),
                  ),
                  ListTile(
                    onTap: () {
                      setState(() {
                        googleSignInController.signOutGoogle();
                      });
                    },
                    leading: const Icon(Icons.logout),
                    title: const Text('Logout'),
                  ),
                  const Spacer(),
                  DefaultTextStyle(
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.white54,
                    ),
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 16.0,
                      ),
                      child: const Text(
                        'Terms of Service | Privacy Policy',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                titles[_currentSelectedIndex],
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              backgroundColor: Colors.blueAccent,
              elevation: 0,
              toolbarHeight: 65.0,
              leading: Builder(
                builder: (BuildContext context) {
                  return IconButton(
                    icon: const Icon(
                      Icons.menu,
                      color: Colors.black,
                    ),
                    onPressed: _handleMenuButtonPressed,
                  );
                },
              ),
            ),
            body: _pages[_currentSelectedIndex],
            bottomNavigationBar: CurvedNavigationBar(
              height: 52,
              color: Colors.blueAccent,
              backgroundColor: Colors.white,
              items: const <Widget>[
                Icon(Icons.home, size: 25, color: Colors.white),
                Icon(Icons.favorite, size: 25, color: Colors.white),
                Icon(Icons.shopping_cart, size: 25, color: Colors.white),
                Icon(Icons.settings, size: 25, color: Colors.white),
              ],
              onTap: (index) {
                setState(() {
                  _currentSelectedIndex = index;
                });
              },
            ),
          ),
        );
      },
    );
  }
}
