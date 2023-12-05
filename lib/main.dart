import 'package:flutter/material.dart';
import 'package:watchapp/screens/home_page.dart';
import 'package:watchapp/screens/main_page.dart';
import 'package:watchapp/screens/product_details.dart';
import 'package:watchapp/trash/imp_trash/home_trash2.dart';
import 'package:watchapp/trash/imp_trash/test1.dart';
import 'package:watchapp/trash/imp_trash/test2.dart';
import 'package:watchapp/trash/trash1.dart';

main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return  MaterialApp(home:ProductDetails(),);

  }
  //debugShowCheckedModeBanner: false,);
}