abstract class CategoryDataSource {
  Future fetchCategoryList();

  Future fetchCategoryWiseProducts({required String categoryName});
}
