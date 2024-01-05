import 'package:flutter/material.dart';

import '../widget/product-list-widget.dart';
class CategoryTapPage extends StatefulWidget {
  const CategoryTapPage({super.key});

  @override
  State<CategoryTapPage> createState() => _CategoryTapPageState();
}

class _CategoryTapPageState extends State<CategoryTapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
      ),
      body: const GetProductWidget(),
    );
  }
}
