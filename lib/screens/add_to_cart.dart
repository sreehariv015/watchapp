import 'package:flutter/material.dart';
class AddToCart extends StatefulWidget {
  const AddToCart({super.key});

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
     body: SingleChildScrollView(
       child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/pro1.webp',
              height: 200,
            ),
            const SizedBox(
                height: 20
            ),
            const Text('Product Name',
              style:
              TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(
                height: 10
            ),
            const Text("Price: \₹10000"),
            const SizedBox(
                height: 20
            ),
            ElevatedButton(
              onPressed: () {

              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                primary: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: const Text(
                'Add to Cart',
                style: TextStyle(
                    fontSize: 16
                ),
              ),
            ),
          ],
        ),
       ),
     )
    );
  }
}
