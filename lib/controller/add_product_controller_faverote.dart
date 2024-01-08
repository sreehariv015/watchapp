import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../models/cart-model.dart';
import '../models/faverote_model.dart';
import '../models/product-model.dart';

class AddFirebaseController extends GetxController {
  User? user = FirebaseAuth.instance.currentUser;
  num totalPriceFinal = 0;
  num cartTotal = 0.0;
  @override
  void onInit() {
    super.onInit();
    // calculateCartTotal(user!.uid).then((total) {
    //   cartTotal = total;
    // });
  }

  Future<void> deleteFavoriteItem({
    required String uId,
    required String productId,
    int quantityDecrement = 1,
  }) async {
    final DocumentReference documentReference = FirebaseFirestore.instance
        .collection('favorite')
        .doc(uId)
        .collection('favoriteItems')
        .doc(productId);

    DocumentSnapshot snapshot = await documentReference.get();

    if (snapshot.exists) {
      await documentReference.delete();
      Get.snackbar(
        "Item",
        "removed from favoritefavorite",
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
      );

    }
  }

  Future<void> addFavoriteItem(
      {required String uId,
        required ProductModel productModel,
        int quantityIncrement = 1}) async {
    final DocumentReference documentReference = FirebaseFirestore.instance
        .collection('favorite')
        .doc(uId)
        .collection('favoriteItems')
        .doc(productModel.productId.toString());
    DocumentSnapshot snapshot = await documentReference.get();
    if (snapshot.exists) {
      print("Product already exist");
      print("Product quantity updated: $quantityIncrement");
      int currentQuantity = snapshot['productQuantity'];
      int updatedQuantity = currentQuantity + quantityIncrement;
      print("Product quantity updated: $updatedQuantity");
      double totalPrice = double.parse(productModel.isSale
          ? productModel.salePrice
          : productModel.fullPrice) *
          updatedQuantity;
      print("Product quantity updated: $totalPrice");
      await documentReference.update({
        'productQuantity': updatedQuantity,
        'productTotalPrice': totalPrice
      });
      Get.snackbar(
        "Product Added to favorite",
        "${productModel.productName} to favorite",
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
      );
    } else {
      await FirebaseFirestore.instance
          .collection('favorite')
          .doc(uId)
          .set({'uId': uId, 'createdAt': DateTime.now()});
      FavoriteModel favoriteModel = FavoriteModel(
        productId: productModel.productId,
        categoryId: productModel.categoryId,
        productName: productModel.productName,
        categoryName: productModel.categoryName,
        salePrice: productModel.salePrice,
        fullPrice: productModel.fullPrice,
        productImages: productModel.productImages,
        deliveryTime: productModel.deliveryTime,
        isSale: productModel.isSale,
        productDescription: productModel.productDescription,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        productQuantity: 1,
        productTotalPrice: double.parse(
          productModel.isSale
              ? productModel.salePrice.replaceAll(',', '')
              : productModel.fullPrice.replaceAll(',', ''),
        ),
      );
      await documentReference.set(favoriteModel.toMap());

      Get.snackbar(
        "Product Added to favorite",
        "You have added the ${productModel.productName}",
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
      );
      print("product added");
    }
  }

  Future<void> checkProductExistance(
      {required String uId,
        required ProductModel productModel,
        int quantityIncrement = 1}) async {
    final DocumentReference documentReference = FirebaseFirestore.instance
        .collection('cart')
        .doc(uId)
        .collection('cartOrders')
        .doc(productModel.productId.toString());
    DocumentSnapshot snapshot = await documentReference.get();
    if (snapshot.exists) {
      print("Product already exist");
      print("Product quantity updated: $quantityIncrement");
      int currentQuantity = snapshot['productQuantity'];
      int updatedQuantity = currentQuantity + quantityIncrement;
      print("Product quantity updated: $updatedQuantity");
      double totalPrice = double.parse(productModel.isSale
          ? productModel.salePrice
          : productModel.fullPrice) *
          updatedQuantity;
      print("Product quantity updated: $totalPrice");
      await documentReference.update({
        'productQuantity': updatedQuantity,
        'productTotalPrice': totalPrice
      });
      Get.snackbar(
        "Product quantity updated",
        "${productModel.productName} to the cart",
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
      );
    } else {
      await FirebaseFirestore.instance
          .collection('cart')
          .doc(uId)
          .set({'uId': uId, 'createdAt': DateTime.now()});
      CartModel cartModel = CartModel(
        productId: productModel.productId,
        categoryId: productModel.categoryId,
        productName: productModel.productName,
        categoryName: productModel.categoryName,
        salePrice: productModel.salePrice,
        fullPrice: productModel.fullPrice,
        productImages: productModel.productImages,
        deliveryTime: productModel.deliveryTime,
        isSale: productModel.isSale,
        productDescription: productModel.productDescription,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        productQuantity: 1,
        productTotalPrice: double.parse(productModel.isSale
            ? productModel.salePrice
            : productModel.fullPrice),
      );
      await documentReference.set(cartModel.toMap());

      Get.snackbar(
        "Product Added",
        "You have added the ${productModel.productName} to the cart",
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
      );
      print("product added");
    }
  }

  Future<void> incrementCartItemQuantity({
    required String uId,
    required String productId,
    int quantityIncrement = 1,
  }) async {
    final DocumentReference documentReference = FirebaseFirestore.instance
        .collection('cart')
        .doc(uId)
        .collection('cartOrders')
        .doc(productId);

    DocumentSnapshot snapshot = await documentReference.get();

    if (snapshot.exists) {
      int currentQuantity = snapshot['productQuantity'];
      print('currentQuantity: $currentQuantity');
      double productTotalPrice =
      double.parse('${snapshot['productTotalPrice']}');
      print('productTotalPrice: $productTotalPrice');
      int updatedQuantity = currentQuantity + quantityIncrement;
      bool isSale = bool.parse('${snapshot['isSale']}');
      double unitPrice = double.parse(
          isSale ? '${snapshot['salePrice']}' : '${snapshot['fullPrice']}');
      double totalPrice = unitPrice * updatedQuantity;
      await documentReference.update({
        'productQuantity': updatedQuantity,
        'productTotalPrice': totalPrice
      });
      print("Quantity incremented by $quantityIncrement");
    } else {
      print("Product not found in the cart");
    }
  }

  Future<void> decrementCartItemQuantity({
    required String uId,
    required String productId,
    int quantityDecrement = 1,
  }) async {
    final DocumentReference documentReference = FirebaseFirestore.instance
        .collection('cart')
        .doc(uId)
        .collection('cartOrders')
        .doc(productId);

    DocumentSnapshot snapshot = await documentReference.get();

    if (snapshot.exists) {
      int currentQuantity = snapshot['productQuantity'];
      print('currentQuantity: $currentQuantity');
      double productTotalPrice =
      double.parse('${snapshot['productTotalPrice']}');
      print('productTotalPrice: $productTotalPrice');
      if (currentQuantity >= quantityDecrement) {
        int updatedQuantity = currentQuantity - quantityDecrement;
        bool isSale = bool.parse('${snapshot['isSale']}');
        double unitPrice = double.parse(
            isSale ? '${snapshot['salePrice']}' : '${snapshot['fullPrice']}');
        double totalPrice = unitPrice * updatedQuantity;
        await documentReference.update({
          'productQuantity': updatedQuantity,
          'productTotalPrice': totalPrice
        });
      } else {
        // If the current quantity is 1, remove the item from the cart
        await documentReference.delete();
        print("Product removed from the cart");
      }
    } else {
      print("Product not found in the cart");
    }
  }

  Future<num> calculatingTotalPrice(String uId) async {
    double totalPrice = 0.0;
    QuerySnapshot qn = await FirebaseFirestore.instance
        .collection('cart')
        .doc(uId)
        .collection('cartOrders')
        .get();

    for (int i = 0; i < qn.docs.length; i++) {
      final productTotalPrice = qn.docs[i]["productTotalPrice"];
      if (productTotalPrice is double) {
        totalPrice += productTotalPrice;
      }
    }

    totalPriceFinal = totalPrice;
    print('totsl $totalPriceFinal');
    return totalPriceFinal;
  }
}