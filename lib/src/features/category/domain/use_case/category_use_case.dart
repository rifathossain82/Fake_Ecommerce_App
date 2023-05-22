import 'package:fake_ecommerce_app/src/features/category/domain/repository/category_repository.dart';
import 'package:fake_ecommerce_app/src/features/home/data/models/product_model.dart';

class CategoryUseCase{
  final CategoryRepository categoryRepository;
  CategoryUseCase({required this.categoryRepository});

  Future<List<String>> getCategoryList() async {
    return await categoryRepository.getCategoryList();
  }

  Future<List<ProductModel>> getCategoryWiseProduct({required String categoryName}) async {
    return await categoryRepository.getCategoryWiseProducts(categoryName: categoryName);
  }
}