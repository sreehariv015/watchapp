
import 'package:carousel_slider/carousel_slider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:watchapp/screens/profile.dart';
import 'package:watchapp/screens/settings_page.dart';
class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  CarouselController carouselController = CarouselController();
  int currentindex=0;
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
    "assets/images/add4.webp"
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
        backgroundColor: Colors.red,
        elevation: 0,
        iconTheme: const IconThemeData(
            color: Colors.black
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        shape: const OutlineInputBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(40),
                topRight: Radius.circular(40)
            )
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage(
                          'assets/images/profile.png',
                        ),
                      ),
                    ]),
              ),
              const Text("RDJ",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.red
                ),
              ),
              const Text("rdj@gmail.com",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return const Homepage();
                    },));
                  },
                  leading: const Icon(Icons.home,
                    size: 30,
                    color: Color(0xFF000000),
                  ),
                  title: const Text("Home",
                    style: TextStyle(
                      fontSize: 19,
                    ),),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return const Profile();
                    },));
                  },
                  leading: const Icon(Icons.account_box_outlined,
                    size: 30,
                    color: Color(0xFF000000),
                  ),
                  title: const Text("Accounts",
                    style: TextStyle(
                      fontSize: 19,
                    ),),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  onTap: () {
                  },
                  leading: const Icon(Icons.shopping_cart,
                    size: 30,
                    color: Color(0xFF000000),
                  ),
                  title: const Text("My Orders",
                    style: TextStyle(
                      fontSize: 19,
                    ),),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return const Settings1();
                    },));
                  },
                  leading: const Icon(Icons.settings,
                    size: 30,
                    color: Color(0xFF000000),
                  ),
                  title: const Text("Settings",
                    style: TextStyle(
                      fontSize: 19,
                    ),),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  onTap: () {
                  },
                  leading: const Icon(Icons.logout,
                    size: 30,
                    color: Color(0xFF000000),
                  ),
                  title: const Text("Logout",
                    style: TextStyle(
                      fontSize: 19,
                    ),),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
            children:[
              const Padding(
                padding: EdgeInsets.all(9.0),
                child: Text("Trending Deals",style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black,
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
                            : Colors.grey,
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
                      color: Colors.black,
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
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment(-0.96, 0),
                  child: Text(
                      "Top Selection",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black,
                      )
                  ),
                ),
              ),
              GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5.0,
                  mainAxisSpacing: 5.0,
                  childAspectRatio: 0.80,

                ),
                physics: const NeverScrollableScrollPhysics(),
                itemCount: watchNames.length,
                itemBuilder: (BuildContext context, int index) {
                  return
                    Card(
                      elevation: 2,
                      color: Colors.white,
                      child: Column(
                        children: [
                          ClipRect(
                            // borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                            child: SizedBox(
                              height: 200,
                              width: double.infinity,
                              child: Image.asset(
                                height: size.height,
                                width: size.width,
                                watchImages[index],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              watchNames[index],
                              style: const TextStyle(
                                  color: Colors.red,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold

                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              watchName2[index],
                              style: const TextStyle(
                                color: Color(0xFF3C3268),
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              watchPrice[index],
                              style: const TextStyle(
                                color: Colors.red,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),

                    );
                },
              )
            ]
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}