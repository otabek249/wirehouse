import 'package:flutter/material.dart';
import 'package:main/core/colors/colors_screen.dart';
import 'package:main/data/product/product_model.dart';

class ProductDetailScreen extends StatelessWidget {
  final ProductModel product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: Text(product.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name: \\${product.name}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Count: \\${product.totalCount}'),
            Text('Warehouse: \\${product.warehouse}'),
            SizedBox(height: 16),

          ],
        ),
      ),
    );
  }
}
