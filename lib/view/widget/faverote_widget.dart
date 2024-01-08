import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/add_product_controller_faverote.dart';
import '../../models/faverote_model.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    final addFirebaseController = Get.put(AddFirebaseController());
    User? user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('favorite')
            .doc(user!.uid) // Use the current user's UID
            .collection('favoriteItems')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CupertinoActivityIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('Favourite screen is empty.'));
          }
          final favoriteItem = snapshot.data!.docs;

          return ListView.builder(
            itemCount: favoriteItem.length,
            itemBuilder: (context, index) {
              final cartItem = favoriteItem[index];
              final cartProduct =
              FavoriteModel.fromMap(cartItem.data() as Map<String, dynamic>);
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                 child:Card(
                   elevation: 2,
                   color: Colors.white,
                   child: Column(
                     children: [
                       ClipRRect(
                         borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                         child: SizedBox(
                           height: 170,
                           width: double.infinity,
                           child: Image.network(
                             "${cartProduct.productImages[0]}",
                             fit: BoxFit.cover,
                           ),
                         ),
                       ),
                       Text(
                         cartProduct.productName,
                         style: const TextStyle(
                           color: Colors.black,
                           fontSize: 15,
                           fontWeight: FontWeight.w400,
                         ),
                       ),
                       Text(
                         ' ₹ ${cartProduct.fullPrice}',
                         style: const TextStyle(
                           color: Colors.red,
                           fontSize: 15,
                         ),
                       ),
                       IconButton(
                         onPressed: () async {
                           await addFirebaseController.deleteFavoriteItem(
                             uId: user!.uid,
                             productId: cartProduct.productId,
                           );
                         },
                         icon: const Icon(
                           Icons.delete,
                           color: Color(0xFFCF1919),
                         ),
                       ),
                     ],
                   ),
                 ),
              );
            },
          );
        },
      ),
    );
  }
}
