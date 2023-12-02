// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Watch App'),
//         ),
//         body: MyGridView(),
//       ),
//     );
//   }
// }
//
// class MyGridView extends StatelessWidget {
//   final List<String> imageUrls = [
//     'https://example.com/image1.jpg',
//     'https://example.com/image2.jpg',
//     'https://example.com/image3.jpg',
//     'https://example.com/image4.jpg',
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         crossAxisSpacing: 8.0,
//         mainAxisSpacing: 8.0,
//       ),
//       itemCount: imageUrls.length,
//       itemBuilder: (BuildContext context, int index) {
//         // Replace the following with your custom widget for each item
//         return Card(
//           child: Column(
//             children: [
//               Image.network(
//                 imageUrls[index],
//                 fit: BoxFit.cover,
//                 height: 100.0, // Adjust the height as needed
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text('Item $index'),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
