import 'package:flutter/material.dart';
import 'package:watchapp/screens/forgot_password_page.dart';
import 'package:watchapp/screens/frontpage.dart';
import 'package:watchapp/screens/home_page.dart';
import 'package:watchapp/screens/loginpage.dart';
import 'package:watchapp/screens/profile.dart';
import 'package:watchapp/screens/registrationpage.dart';
import 'package:watchapp/screens/settings_page.dart';
import 'package:watchapp/screens/splash_screen.dart';
import 'package:watchapp/trash/example1.dart';

main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return  MaterialApp(home:HomeScreen(),);

  }
  //debugShowCheckedModeBanner: false,);
}