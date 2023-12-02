// import 'package:flutter/material.dart';
// class Test1 extends StatefulWidget {
//   const Test1({super.key});
//
//   @override
//   State<Test1> createState() => _Test1State();
// }
//
// class _Test1State extends State<Test1> {
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//
//   final List<String> products = [
//     'Jeep W186X LandSUV',
//     'LAND ROVER X800',
//     'Benz S Class 350CDI',
//     'AUDI Q5 40 TDI'
//   ];
//   final List<String> product_images = [
//     'assets/images/whitecar.jpg',
//     'assets/images/rangerover.jpg',
//     'assets/images/blackcar.jpg',
//     'assets/images/cargr.jpg'
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: GridView.builder(
//         padding: EdgeInsets.all(8.0),
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2, // Number of grid columns
//           crossAxisSpacing: 5.0,
//           mainAxisSpacing: 5.0,
//         ),
//         itemCount: products.length,
//         itemBuilder: (BuildContext context, int index) {
//           return ProductCard(
//               productName: products[index]
//           );
//         },
//       ),
//     );
//   }
// }
//
// class ProductCard extends StatelessWidget {
//   final String productName;
//
//   const ProductCard({super.key, required this.productName});
//
//   @override
//   Widget build(BuildContext context) {
//     // Replace this with your product card design
//     return Card(
//       elevation:10,
//       color: Colors.white70,
//       margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10.0),
//       ),
//       child: Column(
//         children: [
//           ClipRRect(
//             borderRadius:
//             BorderRadius.vertical(top: Radius.circular(10)),
//             child: SizedBox(
//               height: 200,
//               width: double.infinity,
//               child: Image.asset(
//                 productName[index],
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               productName[index],
//               style: const TextStyle(
//                 fontWeight: FontWeight.w900,
//                 fontSize: 20,
//               ),
//             ),
//           ),
//           const Padding(
//             padding: EdgeInsets.all(8.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 Row(
//                   children: [
//                     Icon(Icons.calendar_today_rounded,
//                         color: Colors.white70),
//                     Text(
//                       '2014',
//                       style: TextStyle(fontWeight: FontWeight.w900),
//                     )
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     Icon(Icons.speed_rounded,
//                         color: Color.fromARGB(1768, 255, 204, 0)),
//                     Text(
//                       '59000 KM',
//                       style: TextStyle(fontWeight: FontWeight.w900),
//                     )
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     Icon(Icons.info_outline_rounded,
//                         color: Colors.teal),
//                     Text(
//                       'Diesel',
//                       style: TextStyle(fontWeight: FontWeight.w900),
//                     )
//                   ],
//                 )
//               ],
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.all(8.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Row(
//                   children: [
//                     Icon(Icons.currency_rupee),
//                     Text(
//                       '71,00,000',
//                       style: TextStyle(fontWeight: FontWeight.w900),
//                     )
//                   ],
//                 ),
//                 Icon(
//                   Icons.favorite_border,
//                   color: Color.fromARGB(000066, 0, 0, 102),
//                 )
//               ],
//             ),
//           )
//           // Other car details here
//         ],
//       ),
//     );
//   }
// }