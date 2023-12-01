import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class HomeScreen11 extends StatefulWidget {
  const HomeScreen11({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen11> {
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
      body: Column(
        children: [
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
            ),
            items: imageList.map((url) {
              return GestureDetector(
                onTap: () {
                  // Handle carousel item tap
                  print('Tapped on image: $url');
                },
                child: Container(
                  margin: const EdgeInsets.all(5.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      url,
                      fit: BoxFit.cover,
                      width: 1000.0,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 20),
          // Add other widgets or content here
        ],
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
