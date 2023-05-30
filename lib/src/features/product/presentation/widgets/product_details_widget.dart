import 'package:fake_ecommerce_app/src/core/di/injection_container.dart';
import 'package:fake_ecommerce_app/src/core/enums/app_enum.dart';
import 'package:fake_ecommerce_app/src/core/extensions/build_context_extension.dart';
import 'package:fake_ecommerce_app/src/core/helpers/helper_methods.dart';
import 'package:fake_ecommerce_app/src/core/utils/color.dart';
import 'package:fake_ecommerce_app/src/core/widgets/cached_network_image_builder.dart';
import 'package:fake_ecommerce_app/src/core/widgets/k_button.dart';
import 'package:fake_ecommerce_app/src/core/widgets/k_outlined_button.dart';
import 'package:fake_ecommerce_app/src/core/widgets/star_rating_builder.dart';
import 'package:fake_ecommerce_app/src/features/product/data/models/product_model.dart';
import 'package:fake_ecommerce_app/src/features/product/presentation/bloc/product_bloc.dart';
import 'package:fake_ecommerce_app/src/features/product/presentation/pages/add_or_update_product_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsWidget extends StatelessWidget {
  final ProductModel product;

  const ProductDetailsWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildProductDetailsBody(context),
        _buildEditAndDeleteButtons(context),
      ],
    );
  }

  Widget _buildProductDetailsBody(BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: ListView(
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
    );
  }

  Widget _buildEditAndDeleteButtons(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Container(
        height: 60,
        width: context.screenWidth,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: const BoxDecoration(
          color: Colors.transparent,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            KButton(
              onPressed: () => _editMethod(context),
              width: context.screenWidth * 0.44,
              child: Row(
                children: [
                  Icon(
                    Icons.edit,
                    color: kWhite,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Edit',
                    style: context.buttonTextStyle,
                  ),
                ],
              ),
            ),
            KOutlinedButton(
              onPressed: () => _deleteMethod(context),
              width: context.screenWidth * 0.44,
              child: BlocConsumer<ProductBloc, ProductState>(
                listener: (context, state) {
                  if (state is ProductError) {
                    context.showSnackBar(
                      message: state.message,
                      bgColor: failedColor,
                    );
                  }
                  if (state is ProductDeletedSuccess) {
                    context.showSnackBar(
                      message: state.message,
                      bgColor: successColor,
                    );

                    /// when product delete success then pop the screen
                    /// with result true for reload user list in user page
                    context.pop(result: true);
                  }
                },
                builder: (context, state) {
                  if (state is ProductLoading) {
                    return const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return Row(
                      children: [
                        Icon(
                          Icons.delete,
                          color: context.isDark ? kWhite : kLightPrimaryColor,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Delete',
                          style: context.outlinedButtonTextStyle,
                        ),
                      ],
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _editMethod(BuildContext context) {
    context
        .push(
      BlocProvider(
        create: (context) => sl<ProductBloc>(),
        child: AddOrUpdateProductPage(
          pageType: PageType.update,
          product: product,
        ),
      ),
    )
        .then((value) {
      if (value != null && value == true) {
        /// reload user details after editing
        context.read<ProductBloc>().add(
              GetProductDetails(productId: product.id!),
            );

        /// clear all filtering values
        /// then reload user list to show updated user data
        context.read<ProductBloc>().clearFiltering();
      }
    });
  }

  void _deleteMethod(BuildContext context) async {
    customDialog(
      context: context,
      dialogPosition: Alignment.center,
      title: 'Delete Product?',
      content: Text(
        "Are you sure you want to delete this product? This can't be undone!",
        style: context.textTheme.bodyMedium,
      ),
      actions: [
        KOutlinedButton(
          onPressed: () => context.pop(result: true),
          width: context.screenWidth * 0.4,
          child: Text(
            'YES, DELETE',
            style: context.outlinedButtonTextStyle,
          ),
        ),
        KButton(
          onPressed: () => context.pop(result: false),
          width: context.screenWidth * 0.4,
          child: Text(
            'NO',
            style: context.buttonTextStyle,
          ),
        ),
      ],
    ).then((value) {
      if (value == true) {
        context.read<ProductBloc>().add(DeleteProduct(productId: product.id!));
      }
    });
  }
}
