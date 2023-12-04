import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class HomeTrash11 extends StatefulWidget {
  const HomeTrash11({Key? key}) : super(key: key);

  @override
  _HomeTrash11State createState() => _HomeTrash11State();
}

class _HomeTrash11State extends State<HomeTrash11> {
  CarouselController carouselController = CarouselController();
  int currentindex=0;
  int _selectedIndex = 0;
  final List<String> watchNames = [
    'Fastrack',
    'CASIO ',
    'G-SHOCK',
    'Titan',
  ];
  final List<String> watchName2 = [
    "Bare Basics 2020 Analog Watch",
    "Youth Combination(AEQ-110W-1BVDF)For Men AD218",
    "(GG-1000-1A3DR)Analog-Digital Watch-For Men G662",
    "Analog Watch -For Men NH1578SM04 "
  ];
  final List<String> watchPrice = [
    "₹2,950",
    "₹3,235",
    "₹17,095",
    "₹1,995"
  ];
  final List<String> watchImages = [
    "assets/images/add5.webp",
    "assets/images/add2.webp",
    "assets/images/add3.webp",
    "assets/images/add5.webp"
  ];

  final List<String> imageList = [
    'assets/images/photo1.avif',
    'assets/images/photo2.avif',
    'assets/images/photo3.avif',
    'assets/images/photo4.avif',
    'assets/images/photo5.avif',
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
       body: SingleChildScrollView(
         child: Column(
            children:[
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
            const Align(
                alignment: Alignment(-0.96,0),
                child:
                SizedBox(
                  child: Text("All Category",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Color(0xFF3C3268),
                  ),),
                )),
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
                        Text("Fastrack",
                            style:
                            TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF3C3268),))
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
                        Text("Titan",
                            style:
                            TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF3C3268),))
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
                        Text("G-SHOCK",
                          style:
                          TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF3C3268),),),
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
                        Text("CASIO",
                            style:
                            TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF3C3268),))
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
                        Text("ROLEX",
                            style:
                            TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF3C3268),)),
                      ],
                    ),
                  ),
                 ]
              )
              ),
              const SizedBox(height: 10,),
              const Align(
                alignment: Alignment(-0.96, 0),
                child: Text(
                  "Top Selection",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Color(0xFF3C3268),
                    )
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,

                  ),
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: watchNames.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      elevation: 5,
                      color: Colors.white,
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius:
                            const BorderRadius.vertical(top: Radius.circular(10)),
                            child: SizedBox(
                              height: 115,
                              width: double.infinity,
                              child: Image.asset(
                                height: size.height,
                                width: size.width,
                                watchImages[index],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Text(
                            watchNames[index],
                            style: const TextStyle(
                              color: Color(0xFF3C3268),
                              fontSize: 18,

                            ),
                          ),
                          Text(
                            watchName2[index],
                            style: const TextStyle(
                              color: Color(0xFF3C3268),
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            watchPrice[index],
                            style: const TextStyle(
                              color: Color(0xFF3C3268),
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )
            ]
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
