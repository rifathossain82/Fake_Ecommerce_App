import 'package:fake_ecommerce_app/src/core/network/api.dart';
import 'package:fake_ecommerce_app/src/core/network/network_utils.dart';
import 'package:fake_ecommerce_app/src/features/auth/root/data/data_source/auth_data_source.dart';

class AuthDataSourceImpl implements AuthDataSource {

  @override
  Future login(Map<String, dynamic> requestBody) async {
    dynamic responseBody = await Network.handleResponse(
      await Network.postRequest(
        api: Api.login,
        body: requestBody,
      ),
    );

    return responseBody;
  }

  @override
  Future signUp(Map<String, dynamic> requestBody) async {
    dynamic responseBody = await Network.handleResponse(
      await Network.postRequest(
        api: Api.login,
        body: requestBody,
      ),
    );

    return responseBody;
  }

  @override
  Future forgotPassword(Map<String, dynamic> requestBody) async {
    dynamic responseBody = await Network.handleResponse(
      await Network.postRequest(
        api: Api.login,
        body: requestBody,
      ),
    );

    return responseBody;
  }

  @override
  Future forgotPasswordUpdate(Map<String, dynamic> requestBody) async {
    dynamic responseBody = await Network.handleResponse(
      await Network.postRequest(
        api: Api.login,
        body: requestBody,
      ),
    );

    return responseBody;
  }

  @override
  Future changePassword(Map<String, dynamic> requestBody) async {
    dynamic responseBody = await Network.handleResponse(
      await Network.postRequest(
        api: Api.login,
        body: requestBody,
      ),
    );

    return responseBody;
  }

  @override
  Future logout(Map<String, dynamic> requestBody) async {
    dynamic responseBody = await Network.handleResponse(
      await Network.postRequest(
        api: Api.login,
        body: requestBody,
      ),
    );

    return responseBody;
  }
}
