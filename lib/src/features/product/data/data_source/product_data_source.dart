abstract class ProductDataSource {
  Future fetchProductList(Map<String, dynamic> params);

  Future fetchProductDetails(int productId);

  Future fetchCategoryWiseProducts({
    required String categoryName,
    Map<String, dynamic>? params,
  });

  Future addProduct(Map<String, dynamic> requestBody);

  Future updateProduct(Map<String, dynamic> requestBody);

  Future deleteProduct(int productId);
}
