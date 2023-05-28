import 'dart:convert';

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

  @override
  Future addUser(Map<String, dynamic> requestBody) async {
    dynamic responseBody = await Network.handleResponse(
      await Network.postRequest(
        api: Api.adduser,
        body: jsonEncode(requestBody),
      ),
    );

    return responseBody;
  }

  @override
  Future updateUser(Map<String, dynamic> requestBody) async {
    dynamic responseBody = await Network.handleResponse(
      await Network.putRequest(
        api: Api.updateUser(requestBody['id']),
        body: jsonEncode(requestBody),
      ),
    );

    return responseBody;
  }

  @override
  Future deleteUser(Map<String, dynamic> requestBody) async {
    dynamic responseBody = await Network.handleResponse(
      await Network.deleteRequest(
        api: Api.deleteUser(requestBody['id']),
        body: jsonEncode(requestBody),
      ),
    );

    return responseBody;
  }
}
