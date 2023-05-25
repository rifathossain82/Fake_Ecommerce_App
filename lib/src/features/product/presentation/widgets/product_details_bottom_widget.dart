import 'package:fake_ecommerce_app/src/core/extensions/build_context_extension.dart';
import 'package:fake_ecommerce_app/src/core/utils/app_constants.dart';
import 'package:fake_ecommerce_app/src/core/widgets/k_button.dart';
import 'package:fake_ecommerce_app/src/features/product/data/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductDetailsBottomWidget extends StatelessWidget {
  final ProductModel product;

  const ProductDetailsBottomWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: context.screenWidth,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: 10),
          RichText(
            maxLines: 1,
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: AppConstants.currency,
                  style: context.textTheme.titleMedium!,
                ),
                TextSpan(
                  text: ' ${product.price}',
                  style: context.textTheme.headline5!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
          const Spacer(),
          KButton(
            onPressed: addToCartMethod,
            width: context.screenWidth * 0.45,
            child: Text(
              'Add To Cart',
              style: context.buttonTextStyle,
            ),
          ),
        ],
      ),
    );
  }

  void addToCartMethod() {}
}
