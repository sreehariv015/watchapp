import 'package:flutter/material.dart';
import 'package:watchapp/login/loginpage.dart';
import 'package:watchapp/sample/registration.dart';
import 'package:watchapp/trash/sample1.dart';
import 'package:watchapp/trash/sample2.dart';
main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return  MaterialApp(home: LoginPage22(),);
  }
//debugShowCheckedModeBanner: false,);
}