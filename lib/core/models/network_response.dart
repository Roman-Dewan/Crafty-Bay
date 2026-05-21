part of '../services/network_caller.dart';

class NetworkResponse {
  final bool isSuccess;
  final int statusCode;
  final dynamic body;
  final String error;

  NetworkResponse({
    required this.isSuccess,
    required this.statusCode,
    this.body,
    this.error = "Something Went Wrong",
  });
}
