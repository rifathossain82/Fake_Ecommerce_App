import 'package:fake_ecommerce_app/src/core/extensions/build_context_extension.dart';
import 'package:fake_ecommerce_app/src/core/utils/color.dart';
import 'package:fake_ecommerce_app/src/core/widgets/filter_widget.dart';
import 'package:fake_ecommerce_app/src/core/widgets/no_data_found.dart';
import 'package:fake_ecommerce_app/src/core/widgets/shimmer_grid_view_builder.dart';
import 'package:fake_ecommerce_app/src/features/product/presentation/bloc/product_bloc.dart';
import 'package:fake_ecommerce_app/src/features/product/presentation/widgets/product_gridview_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductPage extends StatefulWidget {
  final ProductEvent event;

  const ProductPage({
    Key? key,
    required this.event,
  }) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final limitTextController = TextEditingController();

  @override
  void initState() {
    context.read<ProductBloc>().add(widget.event);
    limitTextController.text = '${context.read<ProductBloc>().limit ?? ''}';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<ProductBloc>().isProductListLoaded = false;
          context.read<ProductBloc>().add(widget.event);
        },
        child: Column(
          children: [
            FilterWidget(
              limitTextController: limitTextController,
              onChangedLimit: (value) {
                context.read<ProductBloc>().updateLimit(int.parse(value));
              },
              selectedSortingType: context.read<ProductBloc>().selectedSorting,
              onChangedSorting: (value) {
                context.read<ProductBloc>().updateSorting(value);
              },
              onTapAddButton: () {},
            ),
            Expanded(
              child: Stack(
                children: [
                  ListView(),
                  BlocConsumer<ProductBloc, ProductState>(
                    listener: (context, state) {
                      if (state is ProductError) {
                        context.showSnackBar(
                          message: state.message,
                          bgColor: failedColor,
                        );
                      }
                    },
                    builder: (context, state) {
                      if (state is ProductInitial || state is ProductLoading) {
                        return const ShimmerGridViewBuilder();
                      } else if (state is ProductLoaded) {
                        return ProductGridviewWidget(
                            products: state.productList);
                      } else {
                        return const NoDataFound();
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
