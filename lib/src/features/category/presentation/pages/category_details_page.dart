import 'package:fake_ecommerce_app/src/core/extensions/build_context_extension.dart';
import 'package:fake_ecommerce_app/src/core/extensions/string_extension.dart';
import 'package:fake_ecommerce_app/src/core/utils/color.dart';
import 'package:fake_ecommerce_app/src/core/widgets/no_data_found.dart';
import 'package:fake_ecommerce_app/src/core/widgets/shimmer_grid_view_builder.dart';
import 'package:fake_ecommerce_app/src/features/category/presentation/bloc/category_bloc.dart';
import 'package:fake_ecommerce_app/src/features/home/presentation/widgets/product_gridview_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryDetailsPage extends StatelessWidget {
  final String categoryName;

  const CategoryDetailsPage({
    Key? key,
    required this.categoryName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<CategoryBloc>().add(
          GetCategoryWiseProduct(
            categoryName: categoryName,
          ),
        );
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName.capitalizedFirst),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<CategoryBloc>().add(
                GetCategoryWiseProduct(
                  categoryName: categoryName,
                ),
              );
        },
        child: Stack(
          children: [
            ListView(),
            BlocConsumer<CategoryBloc, CategoryState>(
              listener: (context, state) {
                if (state is CategoryError) {
                  context.showSnackBar(
                    message: state.message,
                    bgColor: failedColor,
                  );
                }
              },
              builder: (context, state) {
                if (state is CategoryInitial || state is CategoryLoading) {
                  return const ShimmerGridViewBuilder();
                } else if (state is CategoryWiseProductLoaded) {
                  return ProductGridviewWidget(products: state.productList);
                } else {
                  return const NoDataFound();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
