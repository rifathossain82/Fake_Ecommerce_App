import 'package:fake_ecommerce_app/src/core/helpers/helper_methods.dart';
import 'package:fake_ecommerce_app/src/features/home/data/models/product_model.dart';
import 'package:fake_ecommerce_app/src/features/home/presentation/bloc/home_bloc.dart';
import 'package:fake_ecommerce_app/src/features/home/presentation/widgets/product_item_builder.dart';
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
      body: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is HomeError) {
            kPrint('Error: ${state.message}');
          }
        },
        builder: (context, state) {
          if (state is HomeError) {
            return const Text('No Data Found');
          } else if (state is HomeLoaded) {
            return GridView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.only(
                left: 15,
                right: 15,
                top: 15,
                bottom: 80,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
                childAspectRatio: 4/7,
              ),
              itemCount: state.productList.length,
              itemBuilder: (context, index) => ProductItemBuilder(
                product: state.productList[index],
              ),
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
