import 'package:fake_ecommerce_app/src/core/extensions/string_extension.dart';
import 'package:fake_ecommerce_app/src/features/product/presentation/bloc/product_bloc.dart';
import 'package:fake_ecommerce_app/src/features/product/presentation/pages/product_page.dart';
import 'package:flutter/material.dart';

class CategoryDetailsPage extends StatelessWidget {
  final String categoryName;

  const CategoryDetailsPage({
    Key? key,
    required this.categoryName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName.capitalizedFirst),
      ),
      body: ProductPage(
        event: GetCategoryWiseProduct(
          categoryName: categoryName,
        ),
      ),
    );
  }
}
