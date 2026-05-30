import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

part '../models/network_response.dart';

class NetworkCaller {
  final Map<String, String> Function() headers;
  final VoidCallback onUnauthorized;

  NetworkCaller({required this.headers, required this.onUnauthorized});

  // get request
  Future<NetworkResponse> getRequest(String url) async {
    try {
      Uri uri = Uri.parse(url);
      Response response = await get(uri, headers: headers());

      _logRequest(url);
      _logResponse(url, response);

      final decodedData = await compute(jsonDecode, response.body);

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
          errorMessage: "Un-authorized",
        );
      } else {
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          errorMessage: decodedData['msg'],

          /// [Decouple] korte hobe
        );
      }
    } on SocketException {
      return NetworkResponse(
        isSuccess: false,
        statusCode: -1,
        errorMessage: 'No internet connection',
      );
    } catch (e) {
      return NetworkResponse(
        isSuccess: false,
        statusCode: -1,
        errorMessage: e.toString(),
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
        headers: headers(),
        body: jsonEncode(body),
      );

      _logRequest(url, body: body);
      _logResponse(url, response);

      final decodedData = jsonDecode(response.body);

      if (response.statusCode == 201 || response.statusCode == 200) {
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
          errorMessage: "Un-Authorized",
        );
      } else {
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          errorMessage: decodedData['msg'],
        );
      }
    } on SocketException {
      return NetworkResponse(
        isSuccess: false,
        statusCode: -1,
        errorMessage: 'No internet connection',
      );
    } catch (e) {
      return NetworkResponse(
        isSuccess: false,
        statusCode: -1,
        errorMessage: e.toString(),
      );
    }
  }

  void _logRequest(String url, {Map<String, dynamic>? body}) {
    if (kDebugMode) {
      log(
        "Url: $url\n"
        "Body: $body",
        name: "logRequest",
      );
    }
  }

  void _logResponse(String url, Response response) {
    if (kDebugMode) {
      log(
        "Url: $url\n"
        "Status Code: ${response.statusCode}\n"
        "Body: ${response.body}",
        name: "logResponse",
      );
    }
  }
}
