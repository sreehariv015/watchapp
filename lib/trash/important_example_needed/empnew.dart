import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controller/cart-price-controller.dart';
import '../../models/cart-model.dart';


class CartPageTrash extends StatefulWidget {
  const CartPageTrash({Key? key}) : super(key: key);

  @override
  State<CartPageTrash> createState() => _CartPageTrashState();
}

class _CartPageTrashState extends State<CartPageTrash> {
  User? user = FirebaseAuth.instance.currentUser;
  final ProductPriceController _productPriceController = Get.put(ProductPriceController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: Get.width,
          height: Get.height,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('cart')
                    .doc(user!.uid)
                    .collection('cartOrders')
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return const Text(
                      "Error",
                      style:
                      TextStyle(fontSize: 20, fontFamily: 'Roboto-Regular'),
                    );
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return SizedBox(
                      height: Get.height / 5,
                      child: const Center(
                        child: CupertinoActivityIndicator(),
                      ),
                    );
                  }

                  if (snapshot.data!.docs.isEmpty) {
                    return const Text(
                      "No products found!",
                      style:
                      TextStyle(fontSize: 20, fontFamily: 'Roboto-Regular'),
                    );
                  }

                  if (snapshot.data != null) {
                    return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        final productData = snapshot.data!.docs[index];
                        CartModel cartModel = CartModel(
                          productId: productData['productId'],
                          categoryId: productData['categoryId'],
                          productName: productData['productName'],
                          categoryName: productData['categoryName'],
                          salePrice: productData['salePrice'],
                          fullPrice: productData['fullPrice'],
                          productImages: List<String>.from(
                              productData['productImages']),
                          deliveryTime: productData['deliveryTime'],
                          isSale: productData['isSale'],
                          productDescription:
                          productData['productDescription'],
                          createdAt: productData['createdAt'],
                          updatedAt: productData['updatedAt'],
                          productQuantity: productData['productQuantity'],
                          productTotalPrice: double.parse(
                              productData['productTotalPrice'].toString()),
                        );

                        // calculate price
                        _productPriceController.fetchProductPrice();
                        return SwipeActionCell(
                          key: ObjectKey(cartModel.productId),
                          trailingActions: [
                            SwipeAction(
                              title: "Delete",
                              forceAlignmentToBoundary: true,
                              performsFirstActionWithFullSwipe: true,
                              onTap: (CompletionHandler handler) async {
                                print('deleted');
                                await FirebaseFirestore.instance
                                    .collection('cart')
                                    .doc(user!.uid)
                                    .collection('cartOrders')
                                    .doc(cartModel.productId)
                                    .delete();
                              },
                            )
                          ],
                          child: Card(
                            elevation: 5,
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundImage:
                                NetworkImage(cartModel.productImages[0]),
                              ),
                              title: Text(cartModel.productName),
                              subtitle: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                      "Price : ${cartModel.productTotalPrice.toString()}"),
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () async {
                                          if (cartModel.productQuantity > 1) {
                                            await FirebaseFirestore.instance
                                                .collection('cart')
                                                .doc(user!.uid)
                                                .collection('cartOrders')
                                                .doc(cartModel.productId)
                                                .update({
                                              'productQuantity': cartModel
                                                  .productQuantity -
                                                  1,
                                              'productTotalPrice': (double.parse(
                                                  cartModel.fullPrice) *
                                                  (cartModel
                                                      .productQuantity -
                                                      1))
                                            });
                                          }
                                        },
                                        child: const CircleAvatar(
                                          radius: 14.0,
                                          child: Text('-'),
                                        ),
                                      ),
                                      SizedBox(
                                        width: Get.width / 20.0,
                                      ),
                                      GestureDetector(
                                        onTap: () async {
                                          if (cartModel.productQuantity > 0) {
                                            await FirebaseFirestore.instance
                                                .collection('cart')
                                                .doc(user!.uid)
                                                .collection('cartOrders')
                                                .doc(cartModel.productId)
                                                .update({
                                              'productQuantity': cartModel
                                                  .productQuantity +
                                                  1,
                                              'productTotalPrice':
                                              double.parse(
                                                  cartModel.fullPrice) +
                                                  double.parse(
                                                      cartModel.fullPrice) *
                                                      (cartModel
                                                          .productQuantity),
                                            });
                                          }
                                        },
                                        child: const CircleAvatar(
                                          radius: 14,
                                          child: Text('+'),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                      "Quantity : ${cartModel.productQuantity}")
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }

                  return Container();
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          margin: const EdgeInsets.only(bottom: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Obx(
                    () => Text(
                  " Total ₹ : ${_productPriceController.totalPrice.value.toStringAsFixed(1)} rs",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                  child: Container(
                    width: Get.width / 2.0,
                    height: Get.height / 18,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: TextButton(
                      child: const Text(
                        "Checkout",
                        style: TextStyle(color: Colors.red),
                      ),
                      onPressed: () async {
                        if (_productPriceController.totalPrice.value > 0) {
                          // Navigate to CheckoutPage only if the cart is not empty
                          // Get.to(() => CheckoutPage());
                        } else {
                          // Show a message or perform any action when the cart is empty
                          Get.snackbar(
                            'Empty Cart',
                            'Your cart is empty. Add some items to proceed to checkout.',
                            snackPosition: SnackPosition.BOTTOM,
                            duration: const Duration(seconds: 3),
                          );
                        }
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
