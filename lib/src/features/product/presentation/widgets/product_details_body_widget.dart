import 'package:fake_ecommerce_app/src/core/extensions/build_context_extension.dart';
import 'package:fake_ecommerce_app/src/core/utils/color.dart';
import 'package:fake_ecommerce_app/src/core/widgets/cached_network_image_builder.dart';
import 'package:fake_ecommerce_app/src/core/widgets/star_rating_builder.dart';
import 'package:fake_ecommerce_app/src/features/product/data/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductDetailsBodyWidget extends StatelessWidget {
  final ProductModel product;

  const ProductDetailsBodyWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImageBuilder(
                height: 200,
                imgURl: product.image!,
                borderRadius: BorderRadius.circular(8),
              ),
              const SizedBox(height: 15),
              Text(
                product.title!,
                maxLines: 1,
                style: context.textTheme.titleMedium,
              ),
              const SizedBox(height: 3),
              Text(
                product.description!,
                maxLines: 1,
                style: context.textTheme.bodySmall,
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  StarRatingBuilder(
                    color: kOrange,
                    rating: product.rating?.rate ?? 0.0,
                    starSize: 20,
                  ),
                  Text(
                    ' (${product.rating?.count})',
                    style: context.textTheme.bodyMedium,
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.favorite_border_rounded,
                    ),
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
