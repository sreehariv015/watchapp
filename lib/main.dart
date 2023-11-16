import 'package:flutter/material.dart';
import 'package:watchapp/login/loginpage.dart';
import 'package:watchapp/trash/sample1.dart';
main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return  MaterialApp(home: LoginPage(),);
  }
//debugShowCheckedModeBanner: false,);
}