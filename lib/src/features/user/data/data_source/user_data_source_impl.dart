import 'package:fake_ecommerce_app/src/core/network/api.dart';
import 'package:fake_ecommerce_app/src/core/network/network_utils.dart';
import 'package:fake_ecommerce_app/src/features/user/data/data_source/user_data_source.dart';

class UserDataSourceImpl implements UserDataSource {
  @override
  Future fetchUserList() async {
    dynamic responseBody = await Network.handleResponse(
      await Network.getRequest(
        api: Api.getUsers,
      ),
    );

    return responseBody;
  }

  @override
  Future fetchUserDetails(int userId) async {
    dynamic responseBody = await Network.handleResponse(
      await Network.getRequest(
        api: Api.getUserDetails(userId),
      ),
    );

    return responseBody;
  }
}
