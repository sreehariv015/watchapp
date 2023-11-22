import 'dart:async';

import 'package:flutter/material.dart';
import 'package:watchapp/login/loginpage.dart';
class SplashScreen1 extends StatefulWidget {
  const SplashScreen1({super.key});

  @override
  State<SplashScreen1> createState() => _SplashScreen1State();
}

class _SplashScreen1State extends State<SplashScreen1> {

  @override
  void initState() {
    super.initState();

    Timer(
      Duration(seconds: 5),
          () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Login11(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 350,
          ),
          Center(
            child: Image(image: AssetImage('assets/images/splash.png'),
              height: 200,
            ),
          ),
          CircularProgressIndicator(
            color: Colors.black,
          )
        ],
      ),
    );
  }
}
