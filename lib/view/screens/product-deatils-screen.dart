import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watchapp/view/screens/cart_screen.dart';
import '../../controller/add_product_controller_faverote.dart';
import '../../controller/get-cart-product-controller.dart';
import '../../models/product-model.dart';
class ProductDetailsScreen extends StatefulWidget {
  ProductModel productModel;

  ProductDetailsScreen({super.key, required this.productModel});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final CarouselController carouselController = CarouselController();
  final addFirebaseController = Get.put(AddFirebaseController());
  bool isFavorite = false;
  int currentIndex = 0;
  User? user = FirebaseAuth.instance.currentUser;
  final CartItemController _CartItemController = Get.put(CartItemController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Size halfwidth = MediaQuery.of(context).size / 2;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.all(10),
          width: size.width,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Search',
                border: InputBorder.none,
                icon: Icon(Icons.search, size: 25, color: Colors.black),
              ),
              onChanged: (value) {},
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart,
                color: Colors.black
            ), // Add to Cart icon
            onPressed: ()  {
                // Navigate to the CartScreen
                 Get.to(() => const Cart());
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
          child: Column(children: [
            const SizedBox(
              height: 10,
            ),
            Align(
                alignment: const Alignment(-0.99, 0),
                child: Text(
                  widget.productModel.productName,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w400, color: Colors.red),
                )),
            Align(
              alignment: const Alignment(-0.99, 0),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  widget.productModel.categoryName,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),
            const Row(
              children: [
                SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.star,
                  color: Colors.orangeAccent,
                ),
                Icon(
                  Icons.star,
                  color: Colors.orangeAccent,
                ),
                Icon(
                  Icons.star,
                  color: Colors.orangeAccent,
                ),
                Icon(
                  Icons.star_half,
                  color: Colors.orangeAccent,
                ),
                Icon(
                  Icons.star_border,
                  color: Colors.orangeAccent,
                ),
              ],
            ),
            Stack(
              children: [
                CarouselSlider(
                  items: widget.productModel.productImages
                      .map(
                        (imagePath) => Container(
                      margin: const EdgeInsets.all(5.0),
                      child: Stack(
                        alignment: Alignment.topRight,
                        children: [
                          Image.network(
                            widget.productModel.productImages[currentIndex],
                            fit: BoxFit.cover,
                            width: size.width,
                            height: size.height,
                            loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                              if (loadingProgress == null) {
                                return child;
                              } else {
                                return Center(
                                  child: CircularProgressIndicator(
                                    value: loadingProgress.expectedTotalBytes != null
                                        ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                                        : null,
                                  ),
                                );
                              }
                            },
                          ),

                        ],
                      ),
                    ),
                  )
                      .toList(),
                  options: CarouselOptions(
                    height: 485,
                    autoPlay: false,
                    aspectRatio: 2.0,
                    viewportFraction: 1,
                    scrollPhysics: const BouncingScrollPhysics(),
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                  ),
                ),
                Positioned(
                  top: 20,
                  left: 370,
                  child: IconButton(
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      size: 30,
                      color: Colors.redAccent,
                    ),
                    onPressed: ()  async {
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                      await addFirebaseController.addFavoriteItem(
                          uId: user!.uid,
                          productModel: widget.productModel);
                    },
                  ),
                ),
                // Positioned(
                //   top: 65,
                //   left: 370,
                //   child: IconButton(
                //     icon: const Icon(
                //       Icons.share_outlined,
                //       size: 30,
                //       color: Colors.black,
                //     ),
                //     onPressed: () {
                //       setState(() {});
                //     },
                //   ),
                // ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:
              widget.productModel.productImages.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => carouselController.animateToPage(entry.key),
                  child: Container(
                    width: currentIndex == entry.key ? 17 : 7,
                    height: 7.0,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 3.0,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color:
                      currentIndex == entry.key ? Colors.black54 : Colors.grey,
                    ),
                  ),
                );
              }).toList(),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 30, left: 10),
                child: Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            currentIndex = 0;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: SizedBox(
                            height: 80,
                            width: 80,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image(
                                      image: NetworkImage(
                                          widget.productModel.productImages[0]),
                                      fit: BoxFit.fill)),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            currentIndex = 1;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: SizedBox(
                            height: 80,
                            width: 80,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image(
                                    image: NetworkImage(
                                        widget.productModel.productImages[1],
                                        scale: 1.0
                                    ),
                                    fit: BoxFit.fill,
                                  )),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            currentIndex = 2;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: SizedBox(
                            height: 80,
                            width: 80,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image(
                                    image: NetworkImage(
                                        widget.productModel.productImages[2]),
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            currentIndex = 3;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: SizedBox(
                            height: 80,
                            width: 80,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image(
                                      image: NetworkImage(
                                          widget.productModel.productImages[3]),
                                      fit: BoxFit.fill)),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            currentIndex = 4;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: SizedBox(
                            height: 80,
                            width: 80,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image(
                                      image: NetworkImage(
                                          widget.productModel.productImages[4]),
                                      fit: BoxFit.fill)),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            currentIndex = 5;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: SizedBox(
                            height: 80,
                            width: 80,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image(
                                      image: NetworkImage(
                                          widget.productModel.productImages[5]),
                                      fit: BoxFit.fill)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                alignment: Alignment.topLeft,
                child: Row(
                  children: [
                    widget.productModel.isSale == true &&
                        widget.productModel.salePrice != ''
                        ? Text(
                      "INR: ${widget.productModel.salePrice}",
                    )
                        : Text(
                      "₹ ${widget.productModel.fullPrice}",
                      style: const TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                const Align(
                  alignment: Alignment(-0.96, 0),
                  child: Text(
                    "Description",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    widget.productModel.productDescription,
                    style:
                    const TextStyle(fontWeight: FontWeight.w300, fontSize: 15),
                  ),
                ),
              ],
            )
          ])),
      bottomNavigationBar: BottomAppBar(
        child: SingleChildScrollView(
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              width: halfwidth.width,
              height: 56,
              color: Colors.white,
              child: TextButton(
                  onPressed: () async {
                    try {
                      await _CartItemController.checkProductExistence(
                          uId: user!.uid, productModel: widget.productModel);
                      // Navigate to the CartScreen
                      // Get.to(() => const Cart());
                    } catch (e) {
                      print("Error adding to cart: $e");
                      // Handle the error, e.g., show a snackbar or display an error message.
                    }
                  },

                  child: const Text(
                    "Add to cart",
                    style: TextStyle(color: Colors.black, fontSize: 21),
                  )),
            ),
            Container(
              width: halfwidth.width,
              height: 56,
              color: Colors.red,
              child: TextButton(
                  onPressed: () {
                    Get.off(() => const Cart());
                  },
                  child: const Text(
                    "Buy now",
                    style: TextStyle(color: Colors.black, fontSize: 21),
                  )),
            ),
          ]),
        ),
      ),
    );
  }
}