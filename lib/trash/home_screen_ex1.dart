import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class HomeScreen11 extends StatefulWidget {
  const HomeScreen11({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen11> {
  int currentindex=0;
  int _selectedIndex = 0;

  final List<String> imageList = [
    'https://rameshwatch.com/cdn/shop/files/Ramesh_Watch-920x600_px_1944x.jpg?v=1688480707',
    'https://img.pikbest.com/origin/06/24/82/976pIkbEsTbuZ.jpg!w700wp',
    'https://i.pinimg.com/736x/0b/26/db/0b26db03dd0f2db4cf7e8b153dba6dec.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(9.0),
                child: Text("Trending Deals",style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18
                ),),
              ),
              CarouselSlider(
                options: CarouselOptions(
                  height: 200,
                  enableInfiniteScroll: true,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  pauseAutoPlayOnTouch: true,
                  enlargeCenterPage: true,
                  aspectRatio: 2.0,
                  onPageChanged: (index, reason) {
                    setState(() {
                    currentindex =index;
                    });
                  },
                ),
                items: imageList.map((items) {
                  return Container(
                    margin: const EdgeInsets.all(5.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        items,
                        fit: BoxFit.cover,
                        width: 1000.0,
                      ),
                    ),
                  );
                }).toList(),
              ),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Align(alignment: Alignment(-0.96,0),
                    child: SizedBox(
                      height: 30,
                      child: Text("All Category",style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                      ),),
                    )),
              ),
              // Add other widgets or content here
            ],
          ),
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: _selectedIndex,
        height: 50.0,
        items: const <Widget>[
          Icon(Icons.home, size: 30),
          Icon(Icons.account_box_outlined, size: 30),
          Icon(Icons.settings, size: 30),
        ],
        color: Colors.red,
        buttonBackgroundColor: Colors.red,
        backgroundColor: Colors.white,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 300),
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
