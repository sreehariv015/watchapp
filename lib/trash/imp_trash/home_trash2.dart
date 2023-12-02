import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class HomeTrash11 extends StatefulWidget {
  const HomeTrash11({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeTrash11> {
  CarouselController carouselController = CarouselController();
  int currentindex=0;
  int _selectedIndex = 0;

  final List<String> imageList = [
    'assets/images/photo1.avif',
    'assets/images/photo2.avif',
    'assets/images/photo3.avif',
    'assets/images/photo4.avif',
    'assets/images/photo5.avif',
  ];
  final List<String> imageUrls = [
    'assets/images/img1.jpg',
    'assets/images/img2.jpg',

  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: ListView(
          children:[ SizedBox(
            width: size.width,
            height: size.height,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(9.0),
                  child: Text("Trending Deals",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Color(0xFF3C3268),
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
                        child: Image.asset(
                          items,
                          fit: BoxFit.cover,
                          width: 1000.0,
                        ),
                      ),
                    );
                  }).toList(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: imageList.asMap().entries.map((entry) {
                    return GestureDetector(
                      onTap: () => carouselController.animateToPage(entry.key),
                      child: Container(
                        width: currentindex == entry.key ? 17 : 7,
                        height: 7.0,
                        margin: const EdgeInsets.symmetric(
                          horizontal: 3.0,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: currentindex == entry.key
                              ? Colors.red
                              : Colors.blue,
                        ),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 10,),
                const Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Align(alignment: Alignment(-0.96,0),
                      child: SizedBox(
                        child: Text("All Category",style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Color(0xFF3C3268),
                        ),),
                      )),
                ),
                const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,

                    children: [
                      Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 40,
                              backgroundImage: AssetImage(
                                'assets/images/fastrack.jpg',
                              ),
                            ),
                            Center(
                              child: Text("Fastrack",style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF3C3268),)),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 40,
                              backgroundImage: AssetImage(
                                'assets/images/titan.jpg',
                              ),
                            ),
                            Center(
                              child: Text("Titan",style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF3C3268),)),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 40,
                              backgroundImage: AssetImage(
                                'assets/images/logo1.png',
                              ),
                            ),
                            Center(
                              child: Text("G-SHOCK",style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF3C3268),),),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 40,
                              backgroundImage: AssetImage(
                                'assets/images/logo4.jpg',
                              ),
                            ),
                            Center(
                              child: Text("CASIO",style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF3C3268),)),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 40,
                              backgroundImage: AssetImage(
                                'assets/images/logo2.jpg',
                              ),
                            ),
                            Center(
                              child: Text("ROLEX",style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF3C3268),)),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
      GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: imageUrls.length,
        itemBuilder: (BuildContext context, int index) {
          // Replace the following with your custom widget for each item
          return SizedBox(
            width: size.width,
            height: size.height,
            child: Card(
              elevation: 5,
              child: Column(
                children: [
                  Image.asset(
                    imageUrls[index],
                    fit: BoxFit.cover,
                    height: 100.0, // Adjust the height as needed
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Item $index'),
                  ),
                ],
              ),
            ),
          );
        },
      )
              ],
            ),
          ),
          ]

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
