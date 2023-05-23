abstract class ProductDataSource {
  Future fetchProductList();

  Future fetchCategoryWiseProducts({required String categoryName});
}
