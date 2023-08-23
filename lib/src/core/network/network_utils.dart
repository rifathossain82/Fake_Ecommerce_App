import 'dart:convert';
import 'dart:io';
import 'package:fake_ecommerce_app/src/core/di/injection_container.dart';
import 'package:fake_ecommerce_app/src/core/enums/app_enum.dart';
import 'package:fake_ecommerce_app/src/core/errors/messages.dart';
import 'package:fake_ecommerce_app/src/core/helpers/helper_methods.dart';
import 'package:fake_ecommerce_app/src/core/services/local_storage.dart';
import 'package:fake_ecommerce_app/src/core/utils/logger.dart';
import 'package:http/http.dart' as http;

final _localStorage = sl<LocalStorage>();

class Network {
  static Future<http.Response> getRequest({required String api, params}) async {
    if (!await hasInternet) {
      throw Message.noInternet;
    }

    Log.info("\nYou hit: $api");
    Log.info("Request Params: $params");

    var headers = {
      'Accept': 'application/json',
      "Authorization":
          "Bearer ${_localStorage.getData(key: LocalStorageKey.token)}"
    };

    http.Response response = await http
        .get(
          Uri.parse(api).replace(queryParameters: params),
          headers: headers,
        )
        .timeout(
          const Duration(
            seconds: 10,
          ),
        );
    return response;
  }

  static Future<http.Response> postRequest({required String api, body}) async {
    if (!await hasInternet) {
      throw Message.noInternet;
    }

    Log.info('\nYou hit: $api');
    Log.info('Request Body: ${jsonEncode(body)}');

    var headers = {
      'Accept': 'application/json',
      "Authorization":
          "Bearer ${_localStorage.getData(key: LocalStorageKey.token)}"
    };

    http.Response response = await http.post(
      Uri.parse(api),
      body: body,
      headers: headers,
    );
    return response;
  }

  static Future<http.Response> putRequest({required String api, body}) async {
    if (!await hasInternet) {
      throw Message.noInternet;
    }

    Log.info('\nYou hit: $api');
    Log.info('Request Body: ${jsonEncode(body)}');

    var headers = {
      'Accept': 'application/json',
      "Authorization":
          "Bearer ${_localStorage.getData(key: LocalStorageKey.token)}"
    };

    http.Response response = await http.put(
      Uri.parse(api),
      body: body,
      headers: headers,
    );
    return response;
  }

  static Future<http.Response> deleteRequest(
      {required String api, body}) async {
    if (!await hasInternet) {
      throw Message.noInternet;
    }

    Log.info('\nYou hit: $api');
    Log.info('Request Body: ${jsonEncode(body)}');

    var headers = {
      'Accept': 'application/json',
      "Authorization":
          "Bearer ${_localStorage.getData(key: LocalStorageKey.token)}"
    };

    http.Response response = await http.delete(
      Uri.parse(api),
      body: body,
      headers: headers,
    );
    return response;
  }

  static multipartAddRequest({
    required String api,
    required Map<String, String> body,
    required String fileKeyName,
    required String filePath,
  }) async {
    if (!await hasInternet) {
      throw Message.noInternet;
    }

    Log.info("\nYou hit: $api");
    Log.info("Request body: $body");

    var headers = {
      'Accept': 'application/json',
      "Authorization":
          "Bearer ${_localStorage.getData(key: LocalStorageKey.token)}"
    };

    http.MultipartRequest request;
    if (filePath.isEmpty || filePath == '') {
      request = http.MultipartRequest('POST', Uri.parse(api))
        ..fields.addAll(body)
        ..headers.addAll(headers);
    } else {
      request = http.MultipartRequest('POST', Uri.parse(api))
        ..fields.addAll(body)
        ..headers.addAll(headers)
        ..files.add(await http.MultipartFile.fromPath(fileKeyName, filePath));
    }

    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);

    return response;
  }

  static handleResponse(http.Response response) async {
    try {
      if (!await hasInternet) {
        throw Message.noInternet;
      }

      if (response.statusCode >= 200 && response.statusCode <= 210) {
        Log.info('SuccessCode: ${response.statusCode}');
        Log.info('SuccessResponse: ${response.body}');

        if (response.body.isNotEmpty) {
          return json.decode(response.body);
        } else {
          return response.body;
        }
      } else if (response.statusCode == 401) {
        _logout();
        String msg = Message.error401;
        if (response.body.isNotEmpty) {
          if (json.decode(response.body)['message'] != null) {
            msg = json.decode(response.body)['message'];
          }
        }
        throw msg;
      } else if (response.statusCode == 404) {
        throw Message.error404;
      } else if (response.statusCode == 500) {
        throw Message.error500;
      } else {
        Log.error('ErrorCode: ${response.statusCode}');
        Log.error('ErrorResponse: ${response.body}');

        String msg = Message.unknown;
        if (response.body.isNotEmpty) {
          var data = jsonDecode(response.body)['errors'];
          if (data == null) {
            msg = jsonDecode(response.body)['message'] ?? msg;
          } else if (data is String) {
            msg = data;
          } else if (data is Map) {
            msg = data['email'][0];
          }
        }

        throw msg;
      }
    } on SocketException catch (_) {
      throw Message.noInternet;
    } on FormatException catch (_) {
      throw Message.badResponse;
    } catch (e) {
      throw e.toString();
    }
  }

  static void _logout() {
    _localStorage.removeData(key: LocalStorageKey.token);
  }
}
