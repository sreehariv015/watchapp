// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   final List<String> shoeNames = [
//     'Nike',
//     'Adidas Orginals',
//     'Nike',
//     'New Balance',
//   ];
//   final List<String> shoeName2 = [
//     "Nike Air Force 1 '07",
//     "Stan Smith Sneakers",
//     "Air Jordan 1 Mid",
//     "574 Core "
//   ];
//   final List<String> shoePrice = [
//     "₹ 8195.00",
//     "₹ 8999.00",
//     "₹ 11495.00",
//     "₹ 7499.00"
//   ];
//   final List<String> shoeImages = [
//     "assets/images1/nikeaf1.webp",
//     "assets/images1/stanadi.webp",
//     "assets/images1/nikejordhan.webp",
//     "assets/images1/nikejordhan.webp"
//   ];
//   CarouselController carouselController = CarouselController();
//   int currentIndex = 0;
//   final List<String> imgList = [
//     'assets/images1/bg1.jpeg',
//     'assets/images1/bg2.jpeg',
//     "assets/images1/bg3.jpeg"
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         elevation: 0,
//         iconTheme: const IconThemeData(color: Colors.white),
//       ),
//       drawer: Drawer(
//         shape: const OutlineInputBorder(
//             borderRadius: BorderRadius.only(
//                 bottomRight: Radius.circular(40),
//                 topRight: Radius.circular(40))),
//         child: Column(
//           children: [
//             const SizedBox(
//               height: 10,
//             ),
//             const Center(
//               child: Stack(children: [
//                 CircleAvatar(
//                   backgroundColor: Colors.black,
//                   radius: 60,
//                   child: CircleAvatar(
//                     radius: 70,
//                     backgroundImage: AssetImage(
//                       'assets/images1/propic2.jpg',
//                     ),
//                   ),
//                 ),
//               ]),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             const Text(
//               "Tinu",
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                   color: Colors.black,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 30),
//             ),
//             const Text(
//               "tinu@gmail.com",
//               textAlign: TextAlign.center,
//             ),
//             const SizedBox(
//               height: 30,
//             ),
//             Card(
//               child: ListTile(
//                 leading: const Icon(Icons.home),
//                 onTap: () {
//                   setState(() {
//                     Navigator.push(context, MaterialPageRoute(
//                       builder: (context) {
//                         return const HomePage();
//                       },
//                     ));
//                   });
//                 },
//                 title: const Text(
//                   "Home",
//                   style: TextStyle(fontSize: 20),
//                 ),
//               ),
//             ),
//             Card(
//               elevation: 5,
//               child: ListTile(
//                 leading: const Icon(Icons.account_box),
//                 onTap: () {
//                   setState(() {
//                     Navigator.push(context, MaterialPageRoute(
//                       builder: (context) {
//                         return const ProfilePage();
//                       },
//                     ));
//                   });
//                 },
//                 title: const Text(
//                   "Accounts",
//                   style: TextStyle(fontSize: 20),
//                 ),
//               ),
//             ),
//             Card(
//               child: ListTile(
//                 leading: const Icon(Icons.shopping_cart),
//                 onTap: () {},
//                 title: const Text(
//                   "My Orders",
//                   style: TextStyle(fontSize: 20),
//                 ),
//               ),
//             ),
//             Card(
//               child: ListTile(
//                 leading: const Icon(Icons.settings),
//                 onTap: () {
//                   setState(() {
//                     Navigator.push(context, MaterialPageRoute(
//                       builder: (context) {
//                         return const Settings();
//                       },
//                     ));
//                   });
//                 },
//                 title: const Text(
//                   "Settings",
//                   style: TextStyle(fontSize: 20),
//                 ),
//               ),
//             ),
//             Card(
//               child: ListTile(
//                 leading: const Icon(Icons.logout),
//                 onTap: () {},
//                 title: const Text(
//                   "Logout",
//                   style: TextStyle(fontSize: 20),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(children: [
//           SizedBox(
//             height: 10,
//           ),
//           Align(
//             alignment: Alignment(-0.96, 0),
//             child: Text(
//               "Trending Deals",
//               style: TextStyle(
//                 fontSize: 15,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black,
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 5,
//           ),
//           Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: CarouselSlider(
//                 items: imgList.map((item) {
//                   return SizedBox(
//                     width: double.infinity,
//                     child: Center(
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Image.asset(item,
//                             fit: BoxFit.cover,
//                             width: double.infinity,
//                             height: 500),
//                       ),
//                     ),
//                   );
//                 }).toList(),
//                 options: CarouselOptions(
//                   scrollPhysics: const BouncingScrollPhysics(),
//                   autoPlay: true,
//                   aspectRatio: 2.0,
//                   viewportFraction: 1,
//                   autoPlayAnimationDuration: Duration(seconds: 2),
//                   onPageChanged: (index, reason) {
//                     setState(() {
//                       currentIndex = index;
//                     });
//                   },
//                 )),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: imgList.asMap().entries.map((entry) {
//               return GestureDetector(
//                 onTap: () => carouselController.animateToPage(entry.key),
//                 child: Container(
//                   width: currentIndex == entry.key ? 17 : 7,
//                   height: 7.0,
//                   margin: const EdgeInsets.symmetric(
//                     horizontal: 3.0,
//                   ),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     color: currentIndex == entry.key ? Colors.red : Colors.teal,
//                   ),
//                 ),
//               );
//             }).toList(),
//           ),
//           SizedBox(
//             height: 5,
//           ),
//           Align(
//             alignment: Alignment(-0.96, 0),
//             child: Text(
//               "All category",
//               style: TextStyle(
//                 fontSize: 15,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black,
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             child: Row(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     children: [
//                       CircleAvatar(
//                           backgroundColor: Colors.grey,
//                           radius: 40,
//                           backgroundImage:
//                           AssetImage("assets/images1/nike.jpeg")),
//                       SizedBox(
//                         height: 5,
//                       ),
//                       Text("Nike")
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     children: [
//                       CircleAvatar(
//                           backgroundColor: Colors.grey,
//                           radius: 40,
//                           backgroundImage:
//                           AssetImage("assets/images1/adidas.jpeg")),
//                       SizedBox(
//                         height: 5,
//                       ),
//                       Text("Adidas"),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     children: [
//                       CircleAvatar(
//                           backgroundColor: Colors.grey,
//                           radius: 40,
//                           backgroundImage:
//                           AssetImage("assets/images1/puma.jpeg")),
//                       SizedBox(
//                         height: 5,
//                       ),
//                       Text("Puma")
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     children: [
//                       SizedBox(
//                         child: CircleAvatar(
//                           backgroundColor: Colors.grey,
//                           radius: 40,
//                           backgroundImage:
//                           AssetImage("assets/images1/newbalance.jpeg"),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 5,
//                       ),
//                       Text("New Balance")
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     children: [
//                       CircleAvatar(
//                           backgroundColor: Colors.grey,
//                           radius: 40,
//                           backgroundImage:
//                           AssetImage("assets/images1/converse.jpeg")),
//                       SizedBox(
//                         height: 5,
//                       ),
//                       Text("Converse")
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           Align(
//             alignment: Alignment(-0.96, 0),
//             child: Text(
//               "Top Selection",
//               style: TextStyle(
//                 fontSize: 15,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.red,
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: SizedBox(
//               width: MediaQuery.of(context).size.width,
//               height: MediaQuery.of(context).size.height,
//               child: GridView.builder(
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   crossAxisSpacing: 15.0,
//                   mainAxisSpacing: 15.0,
//                 ),
//                 physics: NeverScrollableScrollPhysics(),
//                 itemCount: shoeNames.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   return Card(
//                     color: Colors.white,
//                     child: Column(
//                       children: [
//                         ClipRRect(
//                           borderRadius:
//                           BorderRadius.vertical(top: Radius.circular(10)),
//                           child: SizedBox(
//                             height: 200,
//                             width: double.infinity,
//                             child: Image.asset(
//                               height: size.height,
//                               width: size.width,
//                               shoeImages[index],
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         ),
//                         Text(
//                           shoeNames[index],
//                           style: const TextStyle(
//                             color: Colors.black,
//                             fontSize: 18,
//                           ),
//                         ),
//                         Text(
//                           shoeName2[index],
//                           style: const TextStyle(
//                             color: Colors.black87,
//                             fontSize: 15,
//                           ),
//                         ),
//                         Text(
//                           shoePrice[index],
//                           style: const TextStyle(
//                             color: Colors.black87,
//                             fontSize: 15,
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ),
//           )
//         ]),
//       ),
//       bottomNavigationBar: CurvedNavigationBar(
//         color: Colors.black,
//         backgroundColor: Colors.white,
//         items: const <Widget>[
//           Icon(
//             Icons.home,
//             size: 30,
//             color: Colors.white,
//           ),
//           Icon(
//             Icons.favorite,
//             size: 30,
//             color: Colors.white,
//           ),
//           Icon(
//             Icons.shopping_cart,
//             size: 30,
//             color: Colors.white,
//           ),
//           Icon(
//             Icons.settings,
//             size: 30,
//             color: Colors.white,
//           ),
//         ],
//       ),
//     );
//   }
// }