import 'package:flutter/material.dart';
import 'package:watchapp/firestore/widget/banner-widget.dart';
import 'package:watchapp/firestore/widget/category_widget.dart';
import 'package:watchapp/firestore/widget/product-list-widget.dart';


class MainHomePage extends StatefulWidget {
  const MainHomePage({super.key});

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  String title = "Settings";
  int currentIndex = 0;


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.all(10),
          width: size.width,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Search',
                border: InputBorder.none,
                icon: Icon(Icons.search, size: 25, color: Colors.black),
              ),
              onChanged: (value) {},
            ),
          ),
        ),
      ),
      body: ListView(
          children:  const [
        Column(
            children: [
          SizedBox(height: 10,),
          Align(
            alignment: Alignment(-0.96, 0),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Trending Deals",style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: Colors.black,
              ),),
            ),
          ),
          BannerWidget(),
          CategoryWidget(),
          GetProductWidget()
        ]),
      ]),
    );
  }
}