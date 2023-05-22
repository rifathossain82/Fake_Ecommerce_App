import 'package:fake_ecommerce_app/src/features/home/data/models/product_model.dart';
import 'package:fake_ecommerce_app/src/features/home/presentation/widgets/product_item_builder.dart';
import 'package:flutter/material.dart';

class ProductGridviewWidget extends StatelessWidget {
  final List<ProductModel> products;

  const ProductGridviewWidget({
    Key? key,
    required this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      ),
      padding: const EdgeInsets.only(
        left: 15,
        right: 15,
        top: 15,
        bottom: 80,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
        childAspectRatio: 4 / 7,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) => ProductItemBuilder(
        product: products[index],
      ),
    );
  }
}
