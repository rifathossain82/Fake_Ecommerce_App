import 'package:fake_ecommerce_app/src/features/home/data/models/product_model.dart';

abstract class CategoryRepository {
  Future<List<String>> getCategoryList();

  Future<List<ProductModel>> getCategoryWiseProducts({required String categoryName});
}
