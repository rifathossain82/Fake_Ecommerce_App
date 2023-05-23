import 'package:fake_ecommerce_app/src/features/product/presentation/widgets/product_details_body_widget.dart';
import 'package:fake_ecommerce_app/src/features/product/presentation/widgets/product_details_bottom_widget.dart';
import 'package:fake_ecommerce_app/src/features/product/data/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductDetailsPage extends StatelessWidget {
  final ProductModel product;

  const ProductDetailsPage({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: Stack(
        children: [
          ProductDetailsBodyWidget(product: product),
          Positioned(
            bottom: 0,
            child: ProductDetailsBottomWidget(product: product),
          ),
        ],
      ),
    );
  }
}
