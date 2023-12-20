import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../model/product-model.dart';


class ProductDetailsScreen extends StatefulWidget {
  ProductModel productModel;
  ProductDetailsScreen({super.key, required this.productModel});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text(
          "Product Details",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          GestureDetector(
            onTap: () => Get.to(() => null),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.shopping_cart,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          //product images
          SizedBox(
            height: Get.height / 60,
          ),
          CarouselSlider(
            items: widget.productModel.productImages
                .map(
                  (imageUrls) => ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: CachedNetworkImage(
                  imageUrl: imageUrls,
                  fit: BoxFit.cover,
                  width: Get.width - 10,
                  placeholder: (context, url) => const ColoredBox(
                    color: Colors.white,
                    child: Center(
                      child: CupertinoActivityIndicator(),
                    ),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            )
                .toList(),
            options: CarouselOptions(
              scrollDirection: Axis.horizontal,
              autoPlay: true,
              aspectRatio: 2.5,
              viewportFraction: 1,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      alignment: Alignment.topLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.productModel.productName,
                          ),
                          const Icon(Icons.favorite_outline)
                        ],
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
                            "INR: ${widget.productModel.fullPrice}",
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Category: ${widget.productModel.categoryName}",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        widget.productModel.productDescription,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Material(
                          child: Container(
                            width: Get.width / 3.0,
                            height: Get.height / 16,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: TextButton(
                              child: const Text(
                                "WhatsApp",
                                style: TextStyle(color: Colors.black),
                              ),
                              onPressed: () {
                                sendMessageOnWhatsApp(
                                  productModel: widget.productModel,
                                );
                              },
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        Material(
                          child: Container(
                            width: Get.width / 3.0,
                            height: Get.height / 16,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: TextButton(
                              child: const Text(
                                "Add to cart",
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () async {
                                // Get.to(() => SignInScreen())
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  static Future<void> sendMessageOnWhatsApp({
    required ProductModel productModel,
  }) async {
    final number = "+919400377390";
    final message =
        "Hello Vineeth \n i want to know about this product \n ${productModel.productName} \n ${productModel.productId}";

    final url = 'https://wa.me/$number?text=${Uri.encodeComponent(message)}';

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}