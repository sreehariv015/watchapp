import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:watchapp/screens/home_page.dart';
import 'package:watchapp/screens/product_details.dart';
class CodeZero11 extends StatefulWidget {
  const CodeZero11({super.key});

  @override
  State<CodeZero11> createState() => _CodeZero11State();
}

class _CodeZero11State extends State<CodeZero11> {
  final _advancedDrawerController = AdvancedDrawerController();
  CarouselController carouselController = CarouselController();
  int currentindex=0;
  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _advancedDrawerController.dispose();
    super.dispose();
  }
  final List<String> watchNames = [
    'Fastrack',
    'CASIO ',
    'G-SHOCK',
    'Titan',
  ];
  final List<String> watchName2 = [
    "Bare Basics 2020 Analog-Digital Watch-For Men",
    "(AEQ-110W-1BVDF)Analog-Digital Watch-For Men AD218",
    "(GG-1000-1A3DR)Analog-Digital Watch-For Men G662",
    "Analog-Digital Watch-For Men NH1578SM04 "
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
    "assets/images/pro1.webp",
    "assets/images/add4.webp"
  ];

  final List<String> imageList = [
    'assets/images/photo1.avif',
    'assets/images/photo2.avif',
    'assets/images/photo3.avif',
    'assets/images/photo4.avif',
    'assets/images/photo6.avif',
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AdvancedDrawer(
      backdrop: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blue, Colors.red.withOpacity(0.2)],
          ),
        ),
      ),
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      // openScale: 1.0,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        // NOTICE: Uncomment if you want to add shadow behind the page.
        // Keep in mind that it may cause animation jerks.
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            blurRadius: 0.0,
          ),
        ],
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      drawer: SafeArea(
        child: ListTileTheme(
          textColor: Colors.white,
          iconColor: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(height: 50,),
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
                    fontWeight: FontWeight.w500,
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
              ListTile(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const Homepage();
                  },));
                },
                leading: const Icon(Icons.home),
                title: const Text('Home'),
              ),
              ListTile(
                onTap: () {

                },
                leading: const Icon(Icons.shopping_cart_outlined),
                title: const Text('My Orders'

                ),
              ),
              ListTile(
                onTap: () {

                },
                leading: const Icon(Icons.account_box),
                title: const Text('Profile'),
              ),
              ListTile(
                onTap: () {

                },
                leading: const Icon(Icons.favorite),
                title: const Text('Favourites'),
              ),
              ListTile(
                onTap: () {

                },
                leading: const Icon(Icons.settings),
                title: const Text('Settings'),
              ),
              ListTile(
                onTap: () {

                },
                leading: const Icon(Icons.logout),
                title: const Text('Logout'),
              ),
              const Spacer(),
              DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white54,
                ),
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 16.0,
                  ),
                  child: const Text('Terms of Service | Privacy Policy',
                    style: TextStyle(
                      color: Colors.black
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          toolbarHeight: 65.0,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: _handleMenuButtonPressed,
              );
            },
          ),
          actions: [
            Container(
              margin: const EdgeInsets.all(10),
              width: 370,
              height: 10,
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(5)
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: 'Search here...',
                    border: InputBorder.none,
                    icon: Icon(Icons.search,
                        size: 25,
                        color: Colors.black),
                  ),
                  onChanged: (value) {
                    // Handle search text changes
                  },
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
              children:[
                const Align(
                  alignment: Alignment(-0.96, 0),
                  child: Text("Trending Deals",style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
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
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
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
                                      fontSize: 11,
                                      color: Colors.black,))
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
                                      fontSize: 11,
                                      color: Colors.black,))
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
                                    fontSize: 11,
                                    color: Colors.black,),),
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
                                    'assets/images/casio.jpg',
                                  ),
                                ),
                                Text("CASIO",
                                    style:
                                    TextStyle(
                                      fontSize: 11,
                                      color: Colors.black,))
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
                                    'assets/images/rolex1.jpg',
                                  ),
                                ),
                                Text("ROLEX",
                                    style:
                                    TextStyle(
                                      fontSize: 11,
                                      color: Colors.black,)),
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
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
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
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return const ProductDetails1();
                            },));
                          });
                        },
                        child: Card(
                          elevation: 2,
                          color: Colors.white,
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                                child: SizedBox(
                                  height: 182,
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
                                    color: Colors.black,
                                    fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  watchName2[index],
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w300,
                                    color: Colors.black,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              Text(
                                watchPrice[index],
                                style: const TextStyle(
                                  color: Colors.red,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),

                        ),
                      );
                  },
                )
              ]
          ),
        ),
      ),
    );
  }
  void _handleMenuButtonPressed() {
    _advancedDrawerController.showDrawer();
  }
}
