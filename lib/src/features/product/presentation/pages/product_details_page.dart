import 'package:fake_ecommerce_app/src/core/di/injection_container.dart';
import 'package:fake_ecommerce_app/src/core/enums/app_enum.dart';
import 'package:fake_ecommerce_app/src/core/extensions/build_context_extension.dart';
import 'package:fake_ecommerce_app/src/core/utils/color.dart';
import 'package:fake_ecommerce_app/src/core/widgets/k_custom_loader.dart';
import 'package:fake_ecommerce_app/src/core/widgets/no_data_found.dart';
import 'package:fake_ecommerce_app/src/features/product/presentation/bloc/product_bloc.dart';
import 'package:fake_ecommerce_app/src/features/product/presentation/widgets/product_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsPage extends StatelessWidget {
  final int productId;

  const ProductDetailsPage({
    Key? key,
    required this.productId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<ProductBloc>().add(GetProductDetails(productId: productId));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<ProductBloc>().add(
            GetProductDetails(productId: productId),
          );
        },
        child: Stack(
          children: [
            ListView(),
            BlocConsumer<ProductBloc, ProductState>(
              listener: (context, state) {
                if (state.status == Status.failure) {
                  context.showSnackBar(
                    message: state.message,
                    bgColor: failedColor,
                  );
                }
              },
              builder: (context, state) {
                if (state.status == Status.loading) {
                  return const KCustomLoader();
                } else if (state.status == Status.success) {
                  return BlocProvider(
                    create: (context) => sl<ProductBloc>(),
                    child: ProductDetailsWidget(product: state.selectedProduct!),
                  );
                } else {
                  return const NoDataFound();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
