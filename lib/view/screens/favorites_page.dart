import 'package:flutter/material.dart';
import 'package:watchapp/view/screens/product-deatils-screen.dart';

import '../widget/faverote_widget.dart';

class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: FavouriteScreen(),
    );
  }
}
