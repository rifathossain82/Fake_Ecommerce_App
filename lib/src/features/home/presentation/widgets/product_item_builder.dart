import 'package:cached_network_image/cached_network_image.dart';
import 'package:fake_ecommerce_app/src/core/extensions/build_context_extension.dart';
import 'package:fake_ecommerce_app/src/core/utils/app_constants.dart';
import 'package:fake_ecommerce_app/src/core/utils/asset_path.dart';
import 'package:fake_ecommerce_app/src/core/utils/color.dart';
import 'package:fake_ecommerce_app/src/core/widgets/box_shadow.dart';
import 'package:fake_ecommerce_app/src/core/widgets/cached_network_image_builder.dart';
import 'package:fake_ecommerce_app/src/features/home/data/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductItemBuilder extends StatelessWidget {
  final ProductModel product;

  const ProductItemBuilder({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kWhite,
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
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    product.title!,
                    maxLines: 1,
                    style: context.textTheme.titleMedium,
                  ),
                  RichText(
                    maxLines: 1,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: AppConstants.currency,
                          style: context.textTheme.titleMedium!.copyWith(
                            color: Theme.of(context).primaryColor,
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
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    product.title!,
                    maxLines: 1,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
