import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../controller/get-product-data-controller.dart';
import '../model/product-model.dart';
import '../pages/product-deatils-screen.dart';

class GetProductWidget extends StatefulWidget {
  const GetProductWidget({super.key});

  @override
  State<GetProductWidget> createState() => _GetProductWidgetState();
}

class _GetProductWidgetState extends State<GetProductWidget> {
  final GetProductDataController _getProductDataController =
  Get.put(GetProductDataController());
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<QueryDocumentSnapshot<Object?>>>(
      future: _getProductDataController.getProductData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Return a loading indicator or placeholder widget
          return SizedBox(
              width: 20.w,
              height: 20.h,
              child: const Center(child: CircularProgressIndicator()));
        } else if (snapshot.hasError) {
          // Handle error
          return Text('Error: ${snapshot.error}');
        } else {
          // Data has been loaded successfully
          List<QueryDocumentSnapshot<Object?>> data = snapshot.data!;
          int dataLength = data.length;

          // Rest of your widget tree using the 'data'

          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.height,
              height: MediaQuery.of(context).size.width,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5.0,
                  mainAxisSpacing: 5.0,
                ),
                physics: const NeverScrollableScrollPhysics(),
                itemCount: dataLength,
                itemBuilder: (BuildContext context, int index) {
                  final productData = data[index];
                  ProductModel productModel = ProductModel(
                    productId: productData['productId'],
                    categoryId: productData['categoryId'],
                    productName: productData['productName'],
                    categoryName: productData['categoryName'],
                    salePrice: productData['salePrice'].toString(),
                    fullPrice: productData['fullPrice'].toString(),
                    productImages: productData['productImages'],
                    deliveryTime: productData['deliveryTime'],
                    isSale: productData['isSale'],
                    productDescription: productData['productDescription'],
                    createdAt: productData['createdAt'],
                    updatedAt: productData['updatedAt'],
                  );
                  return GestureDetector(
                    onTap: () {
                      Get.to(() => ProductDetailsScreen(productModel:productModel));
                    },
                    child: Card(
                      elevation: 2,
                      color: Colors.white,
                      child: SizedBox(
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(10)),
                              child: SizedBox(
                                width: double.infinity,
                                height: 130,
                                child: Image.network(
                                  "${productModel.productImages[0]}",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "${productModel.productName}",
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Text(
                              "${productModel.productName}",
                              style: const TextStyle(
                                color: Colors.black87,
                                fontSize: 15,
                              ),
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Text(
                              ' ₹ ${productModel.fullPrice}',
                              style: const TextStyle(
                                color: Colors.black87,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        }
      },
    );
  }
}