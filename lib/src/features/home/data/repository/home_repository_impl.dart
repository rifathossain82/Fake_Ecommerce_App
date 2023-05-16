import 'package:fake_ecommerce_app/src/core/helpers/helper_methods.dart';
import 'package:fake_ecommerce_app/src/features/home/data/data_source/home_data_source.dart';
import 'package:fake_ecommerce_app/src/features/home/data/models/product_model.dart';
import 'package:fake_ecommerce_app/src/features/home/domain/repository/home_repository.dart';
import 'package:flutter/cupertino.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeDataSource dataSource;

  const HomeRepositoryImpl({required this.dataSource});

  @override
  Future<List<ProductModel>> getProductList() async {
    dynamic responseBody = await dataSource.fetchProductList();

    final List<ProductModel> productList = [];
    if (responseBody != null) {
      for (var product in responseBody) {
        productList.add(ProductModel.fromJson(product));
      }
    }

    return productList;
  }
}
