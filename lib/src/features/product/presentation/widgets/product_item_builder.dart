import 'package:fake_ecommerce_app/src/core/extensions/build_context_extension.dart';
import 'package:fake_ecommerce_app/src/core/utils/app_constants.dart';
import 'package:fake_ecommerce_app/src/core/utils/color.dart';
import 'package:fake_ecommerce_app/src/core/widgets/box_shadow.dart';
import 'package:fake_ecommerce_app/src/core/widgets/cached_network_image_builder.dart';
import 'package:fake_ecommerce_app/src/core/widgets/star_rating_builder.dart';
import 'package:fake_ecommerce_app/src/features/product/data/models/product_model.dart';
import 'package:fake_ecommerce_app/src/features/product/presentation/pages/product_details_page.dart';
import 'package:flutter/material.dart';

class ProductItemBuilder extends StatelessWidget {
  final ProductModel product;

  const ProductItemBuilder({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(ProductDetailsPage(product: product)),
      child: Container(
        decoration: BoxDecoration(
          color: context.isDark ? context.primaryColor : kWhite,
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            KBoxShadow.containerShadow(),
          ],
        ),
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: CachedNetworkImageBuilder(
                imgURl: product.image!,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(4),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
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
                                style: context.textTheme.titleMedium,
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
          ],
        ),
      ),
    );
  }
}
