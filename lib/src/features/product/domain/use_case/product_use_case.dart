import 'package:fake_ecommerce_app/src/features/product/data/models/product_model.dart';
import 'package:fake_ecommerce_app/src/features/product/domain/repository/product_repository.dart';

class ProductUseCase {
  final ProductRepository productRepository;

  ProductUseCase({required this.productRepository});

  Future<List<ProductModel>> getProductList(Map<String, dynamic> params) async {
    return await productRepository.getProductList(params);
  }

  Future<ProductModel> getProductDetails(int productId)async{
    return await productRepository.getProductDetails(productId);
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

  Future<String> addProduct(Map<String, dynamic> requestBody)async{
    return await productRepository.addProduct(requestBody);
  }

  Future<String> updateProduct(Map<String, dynamic> requestBody)async{
    return await productRepository.updateProduct(requestBody);
  }

  Future<String> deleteProduct(int productId)async{
    return await productRepository.deleteProduct(productId);
  }
}
