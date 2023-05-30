import 'package:fake_ecommerce_app/src/features/product/data/models/product_model.dart';

abstract class ProductRepository {
  Future<List<ProductModel>> getProductList(Map<String, dynamic> params);

  Future<ProductModel> getProductDetails(int productId);

  Future<List<ProductModel>> getCategoryWiseProducts({
    required String categoryName,
    Map<String, dynamic>? params,
  });

  Future<String> addProduct(Map<String, dynamic> requestBody);

  Future<String> updateProduct(Map<String, dynamic> requestBody);

  Future<String> deleteProduct(int productId);
}
