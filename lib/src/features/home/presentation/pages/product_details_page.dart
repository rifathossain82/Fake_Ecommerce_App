import 'package:fake_ecommerce_app/src/core/extensions/build_context_extension.dart';
import 'package:fake_ecommerce_app/src/core/utils/app_constants.dart';
import 'package:fake_ecommerce_app/src/core/utils/color.dart';
import 'package:fake_ecommerce_app/src/core/widgets/cached_network_image_builder.dart';
import 'package:fake_ecommerce_app/src/core/widgets/star_rating_builder.dart';
import 'package:fake_ecommerce_app/src/features/home/data/models/product_model.dart';
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
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              CachedNetworkImageBuilder(
                height: 200,
                imgURl: product.image!,
                borderRadius: BorderRadius.circular(8),
              ),
              Text(
                product.title!,
                maxLines: 1,
                style: context.textTheme.titleMedium,
              ),
              const SizedBox(height: 2),
              Row(
                children: [
                  StarRatingBuilder(
                    color: kOrange,
                    rating: product.rating?.rate ?? 0.0,
                    starSize: 15,
                  ),
                  Text(
                    ' (${product.rating?.count})',
                    style: context.textTheme.bodySmall,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: AppConstants.currency,
                          style: context.textTheme.titleMedium!.copyWith(
                            color: context.primaryColor,
                          ),
                        ),
                        TextSpan(
                          text: ' ${product.price}',
                          style: context.textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                  const Icon(
                    Icons.favorite_border_rounded,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
