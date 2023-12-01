import 'package:flutter/material.dart';
import 'package:watchapp/trash/cart_ex1.dart';
import 'package:watchapp/trash/home_screen_ex1.dart';
import 'package:watchapp/trash/imp_trash/home_trash2.dart';

main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return  MaterialApp(home:HomeTrash11(),);

  }
  //debugShowCheckedModeBanner: false,);
}