import 'package:fake_ecommerce_app/src/core/network/api.dart';
import 'package:fake_ecommerce_app/src/core/network/network_utils.dart';
import 'package:fake_ecommerce_app/src/features/home/data/data_source/home_data_source.dart';

class HomeDataSourceImpl extends HomeDataSource {
  @override
  Future fetchProductList() async {
    dynamic responseBody = await Network.handleResponse(
      await Network.getRequest(
        api: Api.getProduct,
      ),
    );

    return responseBody;
  }
}
