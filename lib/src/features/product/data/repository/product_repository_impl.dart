import 'package:fake_ecommerce_app/src/features/product/data/models/product_model.dart';
import 'package:fake_ecommerce_app/src/features/product/data/data_source/product_data_source.dart';
import 'package:fake_ecommerce_app/src/features/product/domain/repository/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductDataSource dataSource;

  const ProductRepositoryImpl({required this.dataSource});

  @override
  Future<List<ProductModel>> getProductList(Map<String, dynamic> params) async {
    dynamic responseBody = await dataSource.fetchProductList(params);

    final List<ProductModel> productList = [];
    if (responseBody != null) {
      for (var product in responseBody) {
        productList.add(ProductModel.fromJson(product));
      }
    }

    return productList;
  }

  @override
  Future<ProductModel> getProductDetails(int productId) async {
    dynamic responseBody = await dataSource.fetchProductDetails(productId);

    return ProductModel.fromJson(responseBody);
  }

  @override
  Future<List<ProductModel>> getCategoryWiseProducts({
    required String categoryName,
    Map<String, dynamic>? params,
  }) async {
    dynamic responseBody = await dataSource.fetchCategoryWiseProducts(
      categoryName: categoryName,
      params: params,
    );

    final List<ProductModel> productList = [];
    if (responseBody != null) {
      for (var productJson in responseBody) {
        productList.add(ProductModel.fromJson(productJson));
      }
    }

    return productList;
  }

  @override
  Future<String> addProduct(Map<String, dynamic> requestBody) async {
    await dataSource.addProduct(requestBody);
    return 'Product Added Successfully!';
  }

  @override
  Future<String> updateProduct(Map<String, dynamic> requestBody) async {
    await dataSource.updateProduct(requestBody);
    return 'Product Updated Successfully!';
  }

  @override
  Future<String> deleteProduct(int productId) async {
    await dataSource.deleteProduct(productId);
    return 'Product Deleted Successfully!';
  }
}
