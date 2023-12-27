import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/cart-model.dart';


class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('orders')
              .doc(user!.uid)
              .collection('confirmOrders')
              .snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text("Error",style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Roboto-Regular'
                ),),
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
              return const Center(
                child: Text("No products found!",style: TextStyle(
                    fontSize: 20, fontFamily: 'Roboto-Regular'),),
              );
            }

            if (snapshot.data != null) {
              return Container(
                child: Column(
                  children: [
                    ListView.builder(
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
                          productImages: productData['productImages'],
                          deliveryTime: productData['deliveryTime'],
                          isSale: productData['isSale'],
                          productDescription: productData['productDescription'],
                          createdAt: productData['createdAt'],
                          updatedAt: productData['updatedAt'],
                          productQuantity: productData['productQuantity'],
                          productTotalPrice: double.parse(
                              productData['productTotalPrice'].toString()),
                        );

                        return Card(
                          elevation: 5,
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage:
                              NetworkImage(cartModel.productImages[0]),
                            ),
                            title: Text(cartModel.productName),
                            subtitle: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(cartModel.productTotalPrice.toString()),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            }

            return Container();
          },
        ),
      ),
    );
  }
}