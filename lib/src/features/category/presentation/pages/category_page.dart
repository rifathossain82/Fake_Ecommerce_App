import 'package:fake_ecommerce_app/src/core/extensions/build_context_extension.dart';
import 'package:fake_ecommerce_app/src/core/utils/color.dart';
import 'package:fake_ecommerce_app/src/core/widgets/no_data_found.dart';
import 'package:fake_ecommerce_app/src/core/widgets/shimmer_list_view_builder.dart';
import 'package:fake_ecommerce_app/src/features/category/presentation/bloc/category_bloc.dart';
import 'package:fake_ecommerce_app/src/features/category/presentation/widgets/category_list_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<CategoryBloc>().add(GetCategoryList());
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<CategoryBloc>().isCategoryListLoaded = false;
          context.read<CategoryBloc>().add(GetCategoryList());
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
                  return const ShimmerListViewBuilder();
                } else if (state is CategoryLoaded) {
                  return CategoryListViewWidget(categoryList: state.categoryList);
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
