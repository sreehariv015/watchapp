import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:watchapp/screens/add_to_cart.dart';
import 'package:watchapp/screens/home_page.dart';
import 'package:watchapp/screens/main_page.dart';
import 'package:watchapp/screens/product_details.dart';
import 'package:watchapp/screens/splash_screen.dart';
import 'package:watchapp/trash/imp_trash/home_trash2.dart';
import 'package:watchapp/trash/imp_trash/package_home.dart';
import 'package:watchapp/trash/imp_trash/package_home1.dart';
import 'package:watchapp/trash/imp_trash/test1.dart';


main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return  MaterialApp(home:MainPage1(),);

  }
  //debugShowCheckedModeBanner: false,);
}