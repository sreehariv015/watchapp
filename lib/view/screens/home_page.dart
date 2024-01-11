import 'package:flutter/material.dart';
import '../widget/banner-widget.dart';
import '../widget/category_widget.dart';
import '../widget/product-list-widget.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                  Align(
                    alignment: Alignment(-0.96, 0),
                    child: Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Text(
                          "Top Selection",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.black,
                          )
                      ),
                    ),
                  ),
                  GetProductWidget()
                ]),
          ]),
    );
  }
}