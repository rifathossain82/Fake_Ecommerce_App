import 'package:fake_ecommerce_app/src/features/category/data/data_source/category_data_source.dart';
import 'package:fake_ecommerce_app/src/features/category/domain/repository/category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryDataSource dataSource;

  const CategoryRepositoryImpl({required this.dataSource});

  @override
  Future<List<String>> getCategoryList() async {
    dynamic responseBody = await dataSource.fetchCategoryList();

    final List<String> categoryList = [];
    if (responseBody != null) {
      for (var category in responseBody) {
        categoryList.add(category);
      }
    }

    return categoryList;
  }
}
