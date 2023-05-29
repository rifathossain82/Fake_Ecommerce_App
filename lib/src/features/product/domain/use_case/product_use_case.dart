import 'package:fake_ecommerce_app/src/features/product/data/models/product_model.dart';
import 'package:fake_ecommerce_app/src/features/product/domain/repository/product_repository.dart';

class ProductUseCase {
  final ProductRepository productRepository;

  ProductUseCase({required this.productRepository});

  Future<List<ProductModel>> getProductList(Map<String, dynamic> params) async {
    return await productRepository.getProductList(params);
  }

  Future<List<ProductModel>> getCategoryWiseProduct({
    required String categoryName,
    Map<String, dynamic>? params,
  }) async {
    return await productRepository.getCategoryWiseProducts(
      categoryName: categoryName,
      params: params,
    );
  }
}
