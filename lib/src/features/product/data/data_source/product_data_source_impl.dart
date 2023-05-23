import 'package:fake_ecommerce_app/src/core/network/api.dart';
import 'package:fake_ecommerce_app/src/core/network/network_utils.dart';
import 'package:fake_ecommerce_app/src/features/product/data/data_source/product_data_source.dart';

class ProductDataSourceImpl extends ProductDataSource {
  @override
  Future fetchProductList() async {
    dynamic responseBody = await Network.handleResponse(
      await Network.getRequest(
        api: Api.getProduct,
      ),
    );

    return responseBody;
  }

  @override
  Future fetchCategoryWiseProducts({required String categoryName}) async {
    dynamic responseBody = await Network.handleResponse(
      await Network.getRequest(
        api: Api.getCategoryWiseProduct(categoryName),
      ),
    );

    return responseBody;
  }
}
