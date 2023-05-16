import 'package:fake_ecommerce_app/src/features/home/data/models/product_model.dart';

abstract class HomeRepository{
  Future<List<ProductModel>> getProductList();
}