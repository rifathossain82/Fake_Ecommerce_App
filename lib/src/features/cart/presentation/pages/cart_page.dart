import 'package:fake_ecommerce_app/src/core/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.remove_shopping_cart_outlined,
              size: 100,
            ),
            const SizedBox(height: 10),
            Text(
              'There is no item here!',
              style: context.textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
