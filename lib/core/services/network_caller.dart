import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

import '../models/network_response.dart';

class NetworkCaller {
  final Map<String, String> headers;
  final VoidCallback onUnauthorized;

  NetworkCaller({required this.headers, required this.onUnauthorized});

  // get request
  Future<NetworkResponse> getRequest(String url) async {
    try {
      Uri uri = Uri.parse(url);
      Response response = await get(uri, headers: headers);

      _logRequest(url);
      _logResponse(url, response);

      final decodedData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return NetworkResponse(
          isSuccess: true,
          statusCode: response.statusCode,
          body: decodedData,
        );
      } else if (response.statusCode == 401) {
        onUnauthorized();
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          error: "Un-authorized",
        );
      } else {
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          error: decodedData['data'],

          /// [Decouple] korte hobe
        );
      }
    } catch (e) {
      return NetworkResponse(
        isSuccess: false,
        statusCode: -1,
        error: e.toString(),
      );
    }
  }

  // post request
  Future<NetworkResponse> postRequest(
    String url, {
    Map<String, dynamic>? body,
  }) async {
    try {
      Uri uri = Uri.parse(url);

      Response response = await post(
        uri,
        headers: headers,
        body: jsonEncode(body),
      );

      _logRequest(url, body: body);
      _logResponse(url, response);

      final decodedData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return NetworkResponse(
          isSuccess: true,
          statusCode: response.statusCode,
          body: decodedData,
        );
      } else if (response.statusCode == 401) {
        onUnauthorized();
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          error: "Un-Authorized",
        );
      } else {
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          error: decodedData['data'],
        );
      }
    } catch (e) {
      return NetworkResponse(
        isSuccess: false,
        statusCode: -1,
        error: e.toString(),
      );
    }
  }

  static void _logRequest(String url, {Map<String, dynamic>? body}) {
    if (kDebugMode) {
      debugPrint(
        "\n ==================== Request ==================== \n"
        "Url: $url\n"
        "Body: $body\n"
        "==================== End Request ====================\n",
      );
    }
  }

  static void _logResponse(String url, Response response) {
    if (kDebugMode) {
      debugPrint(
        "\n ==================== Response ==================== \n"
        "Url: $url\n"
        "Status Code: ${response.statusCode}\n"
        "Body: ${response.body}\n"
        "==================== End Response ====================\n",
      );
    }
  }
}
