import 'package:fake_ecommerce_app/src/core/network/api.dart';
import 'package:fake_ecommerce_app/src/core/network/network_utils.dart';
import 'package:fake_ecommerce_app/src/features/category/data/data_source/category_data_source.dart';

class CategoryDataSourceImpl implements CategoryDataSource {
  @override
  Future fetchCategoryList() async {
    dynamic responseBody = await Network.handleResponse(
      await Network.getRequest(
        api: Api.getProductCategories,
      ),
    );

    return responseBody;
  }
}
