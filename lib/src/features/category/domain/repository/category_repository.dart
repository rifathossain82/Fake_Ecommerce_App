import 'package:fake_ecommerce_app/src/features/product/data/models/product_model.dart';

abstract class CategoryRepository {
  Future<List<String>> getCategoryList();
}
