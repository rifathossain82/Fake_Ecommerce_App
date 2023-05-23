import 'package:fake_ecommerce_app/src/features/product/data/models/product_model.dart';

abstract class ProductRepository {
  Future<List<ProductModel>> getProductList();

  Future<List<ProductModel>> getCategoryWiseProducts({
    required String categoryName,
  });
}
