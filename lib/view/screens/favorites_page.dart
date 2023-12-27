import 'package:flutter/material.dart';
import 'package:watchapp/view/screens/product-deatils-screen.dart';

class Favorites extends StatefulWidget {
  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  List<FavoriteItem> favoriteItems = List.generate(
    8,
        (index) => FavoriteItem(
      id: index,
      productName: 'Product Name ${index + 1}',
      price: 18600,
    ),
  );

  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedList(
        key: _listKey,
        initialItemCount: favoriteItems.length,
        itemBuilder: (context, index, animation) {
          return buildFavoriteItemCard(
            favoriteItem: favoriteItems[index],
            onRemove: () => _removeItem(index),
            animation: animation,
          );
        },
      ),
    );
  }

  Widget buildFavoriteItemCard({
    required FavoriteItem favoriteItem,
    required VoidCallback onRemove,
    required Animation<double> animation,
  }) {
    return SizeTransition(
      sizeFactor: animation,
      child: FavoriteItemCard(
        favoriteItem: favoriteItem,
        onRemove: onRemove,
      ),
    );
  }

  void _removeItem(int index) {
    setState(() {
      favoriteItems.removeAt(index);
      _listKey.currentState?.removeItem(
        index,
            (context, animation) => buildFavoriteItemCard(
          favoriteItem: FavoriteItem(
            id: index,
            productName: 'Product Name ${index + 1}',
            price: 18600,
          ),
          onRemove: () {}, // Pass a placeholder callback
          animation: animation,
        ),
        duration: const Duration(milliseconds: 300),
      );
    });
  }
}

class FavoriteItem {
  final int id;
  final String productName;
  final double price;

  FavoriteItem({
    required this.id,
    required this.productName,
    required this.price,
  });
}

class FavoriteItemCard extends StatelessWidget {
  final FavoriteItem favoriteItem;
  final VoidCallback onRemove;

  const FavoriteItemCard({
    required this.favoriteItem,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
      },
      child: Card(
        margin: const EdgeInsets.all(4),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(4), // Adjust padding as needed
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Image.asset(
              'assets/images/add5.webp',
              height: size.height,
              width: 70,
              fit: BoxFit.cover,
            ),
            title: Text(favoriteItem.productName),
            subtitle: Text('Price: \$${favoriteItem.price.toString()}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: onRemove,
                ),
                IconButton(
                  icon: const Icon(Icons.shopping_cart),
                  onPressed: () {
                    // Add logic for adding to cart
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
