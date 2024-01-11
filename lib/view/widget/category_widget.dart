import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/get_category_data_controller.dart';
import '../../models/category_model.dart';
import '../screens/category_tap_page.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({super.key});

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  final CategoryDataController _categoryDataController = Get.put(CategoryDataController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FutureBuilder<List<QueryDocumentSnapshot<Object?>>>(
      future: _categoryDataController.getCategoryData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox(
            width: 20,
            height: 20,
            child: Center(child: CircularProgressIndicator()),
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          List<QueryDocumentSnapshot<Object?>> data = snapshot.data!;
          int dataLength = data.length;
          return SizedBox(
            height: 120,
            width: size.width,
            child: ListView.builder(
              itemCount: dataLength,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final productData = data[index];
                CategoriesModel categoryModel = CategoriesModel(
                  categoryId: productData['categoryId'],
                  categoryImg: productData['categoryImg'],
                  categoryName: productData['categoryName'],
                  createdAt: productData['createdAt'],
                  updatedAt: productData['updatedAt'],
                );
                return Padding(
                  padding: const EdgeInsets.all(.0),
                  child: GestureDetector(
                    onTap: () =>  Get.offAll(() => AllSingleCategoryProductsScreen(categoryId:categoryModel.categoryId,),
                        transition: Transition.leftToRightWithFade),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Container(
                                  width: 80, // Set a fixed width for the container
                                  height: 80, // Set a fixed height for the container
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.1),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: const Offset(0, 3), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: CircleAvatar(
                                    radius: 40,
                                    backgroundColor: Colors.white,
                                    child: ClipOval(
                                      child: CachedNetworkImage(
                                        imageUrl: categoryModel.categoryImg,
                                        fit: BoxFit.cover,
                                        placeholder: (context, url) => const ColoredBox(
                                          color: Colors.white,
                                          child: Center(
                                            child: CupertinoActivityIndicator(),
                                          ),
                                        ),
                                        errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  categoryModel.categoryName,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 13,
                                    color: Colors.black,
                                  ),
                                )
                              ],
                            ),
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
      },
    );
  }
}
