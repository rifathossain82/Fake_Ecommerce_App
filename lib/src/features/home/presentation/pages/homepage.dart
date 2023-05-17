import 'package:fake_ecommerce_app/src/core/extensions/build_context_extension.dart';
import 'package:fake_ecommerce_app/src/core/utils/color.dart';
import 'package:fake_ecommerce_app/src/core/widgets/no_data_found.dart';
import 'package:fake_ecommerce_app/src/core/widgets/shimmer_grid_view_builder.dart';
import 'package:fake_ecommerce_app/src/features/home/presentation/bloc/home_bloc.dart';
import 'package:fake_ecommerce_app/src/features/home/presentation/widgets/product_gridview_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<HomeBloc>().add(GetProductList());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Homepage'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<HomeBloc>().add(GetProductList());
        },
        child: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {
            if (state is HomeError) {
              context.showSnackBar(
                message: state.message,
                bgColor: failedColor,
              );
            }
          },
          builder: (context, state) {
            if (state is HomeInitial || state is HomeLoading) {
              return const ShimmerGridViewBuilder();
            } else if (state is HomeLoaded) {
              return ProductGridviewWidget(products: state.productList);
            } else {
              return const NoDataFound();
            }
          },
        ),
      ),
    );
  }
}
