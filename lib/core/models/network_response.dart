part of '../services/network_caller.dart';

class NetworkResponse {
  final bool isSuccess;
  final int statusCode;
  final dynamic body;
  final String errorMessage;

  NetworkResponse({
    required this.isSuccess,
    required this.statusCode,
    this.body,
    this.errorMessage = "Something Went Wrong",
  });
}
