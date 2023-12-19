import 'package:flutter/material.dart';

class AddToCart extends StatefulWidget {
  const AddToCart({Key? key}) : super(key: key);

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 10, // Assuming you have only one item
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.all(8),
            child: Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(13),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/pro1.webp',
                      height: 200,
                    ),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Product Name',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 5),
                        const Text("Price: \₹10000"),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  if (quantity > 1) {
                                    quantity--;
                                  }
                                });
                              },
                              icon: Icon(Icons.remove),
                            ),
                            Text(
                              ' $quantity ',
                              style: TextStyle(fontSize: 16),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  quantity++;
                                });
                              },
                              icon: Icon(Icons.add),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                // Add your logic for the Buy button
                              },
                              child: const Text("Buy"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
