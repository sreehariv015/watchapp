// IconButton(
// onPressed: () async {
// bool isFavorite = isFavoriteList[index]; // Check if item is already favorited
//
// String uId = user!.uid; // Define the uId variable
//
// if (isFavorite) {
// // If the item is already favorited, delete it
// await FirebaseFirestore.instance
//     .collection('cart')
//     .doc(uId)
//     .collection('cartOrders')
//     .doc(productModel.productId.toString()) // Provide the document ID to be deleted
//     .delete();
//
// setState(() {
// isFavoriteList[index] = false;
// });
// } else {
// // If the item is not favorited, add it to the favorites
// await FirebaseFirestore.instance
//     .collection('cart')
//     .doc(uId)
//     .collection('cartOrders')
//     .doc(productModel.productId.toString()) // Provide the document ID to be added
//     .set({
// // Here, you can set data for the favorite item if needed
// // For example:
// 'productId': productModel.productId,
// 'categoryId': productModel.categoryId,
// 'productName': productModel.productName,
// 'categoryName': productModel.categoryName,
// 'salePrice': productModel.salePrice,
// 'fullPrice': productModel.fullPrice,
// 'isSale': productModel.isSale,
// 'deliveryTime': productModel.deliveryTime,
// 'productDescription': productModel.productDescription,
// 'createdAt': productModel.createdAt,
// 'updatedAt': productModel.updatedAt,
// 'productQuantity': productModel.productQuantity,
// 'productTotalPrice': productModel.productTotalPrice,
// });
//
// setState(() {
// isFavoriteList[index] = true;
// });
// }
// },
// icon: Icon(
// isFavoriteList[index] ? Icons.favorite : Icons.favorite_border,
// color: isFavoriteList[index] ? Colors.red : null,
// size: 30,
// ),
// ),