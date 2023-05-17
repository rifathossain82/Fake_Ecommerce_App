import 'package:fake_ecommerce_app/src/features/category/domain/repository/category_repository.dart';

class CategoryUseCase{
  final CategoryRepository categoryRepository;
  CategoryUseCase({required this.categoryRepository});

  Future<List<String>> getCategoryList() async {
    return await categoryRepository.getCategoryList();
  }
}