import 'package:fake_ecommerce_app/src/core/network/api.dart';
import 'package:fake_ecommerce_app/src/core/network/network_utils.dart';
import 'package:fake_ecommerce_app/src/features/product/data/data_source/product_data_source.dart';

class ProductDataSourceImpl implements ProductDataSource {
  @override
  Future fetchProductList(Map<String, dynamic> params) async {
    dynamic responseBody = await Network.handleResponse(
      await Network.getRequest(
        api: Api.getProduct,
        params: params,
      ),
    );

    return responseBody;
  }

  @override
  Future fetchCategoryWiseProducts({
    required String categoryName,
    Map<String, dynamic>? params,
  }) async {
    dynamic responseBody = await Network.handleResponse(
      await Network.getRequest(
        api: Api.getCategoryWiseProduct(categoryName),
        params: params,
      ),
    );

    return responseBody;
  }
}
