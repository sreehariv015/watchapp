import 'dart:async';
import 'package:flutter/material.dart';
import 'package:watchapp/screens/frontpage.dart';
import 'package:watchapp/screens/loginpage.dart';
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
      const Duration(seconds: 2),
          () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const FrontPage1(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 330,
            ),
            Center(
              child: Image(image: AssetImage('assets/images/splash.png'),
                height: 280,
              ),
            ),
            SizedBox(height: 220,),
            CircularProgressIndicator(
              color: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
