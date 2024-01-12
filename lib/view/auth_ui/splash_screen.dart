import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watchapp/view/auth_ui/welcome_screen.dart';
import 'package:watchapp/view/screens/main_page.dart';

class SplashScreen1 extends StatefulWidget {
  const SplashScreen1({super.key});

  @override
  State<SplashScreen1> createState() => _SplashScreen1State();
}

class _SplashScreen1State extends State<SplashScreen1> {

  User? user = FirebaseAuth.instance.currentUser;
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      logInCheck(context);
    });
  }

  Future logInCheck(BuildContext context) async {
    if (user != null) {
      Get.offAll(() => const MainPage1(), transition: Transition.cupertino);
    } else {
      Get.offAll(() => const WelcomeScreen1(), transition: Transition.cupertino);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Colors.white,
        body: Stack(children: [
          Align(
            alignment: Alignment.center,
            child: Image(
              height: 300,
              width: 300,
              image: AssetImage("assets/images/splash.png"),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "WatchMate",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  "www.watchmate.com!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 10,
                      fontWeight: FontWeight.w300),
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          )
        ]));
  }
}