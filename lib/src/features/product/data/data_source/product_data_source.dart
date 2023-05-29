abstract class ProductDataSource {
  Future fetchProductList(Map<String, dynamic> params);

  Future fetchCategoryWiseProducts({
    required String categoryName,
    Map<String, dynamic>? params,
  });
}
