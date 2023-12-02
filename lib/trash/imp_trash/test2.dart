import 'package:flutter/material.dart';
class Test4 extends StatefulWidget {
  const Test4({super.key});

  @override
  State<Test4> createState() => _Test4State();
}

class _Test4State extends State<Test4> {
  final List<String> imageUrls = [
    'assets/images/img1.jpg',
    'assets/images/img2.jpg',

  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: imageUrls.length,
      itemBuilder: (BuildContext context, int index) {
        // Replace the following with your custom widget for each item
        return Card(
          elevation: 10,
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
        );
      },
    );
  }
}
