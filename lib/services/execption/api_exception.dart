import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../core/navigation/navigation_service.dart';
import '../../screens/login_Screen.dart';

class ApiException implements Exception {
  ApiException.fromDioError(DioException dioError) {
    print(dioError.type);
    print(dioError.response);
    print(dioError.response?.statusMessage);
    print("fashdfkjahfkhak");
    switch (dioError.type) {
      case DioExceptionType.cancel:
        message = "Request to API server was cancelled";
        break;
      case DioExceptionType.connectionTimeout:
        message = "Connection timeout with API server";
        break;
      case DioExceptionType.receiveTimeout:
        message = "Receive timeout in connection with API server";
        break;
      case DioExceptionType.badResponse:
        message = _handleError(
          dioError.response?.statusCode,
          dioError.response?.data.toString(),
        );
        break;
      case DioExceptionType.sendTimeout:
        message = "Send timeout in connection with API server";
        break;
      case DioExceptionType.unknown:
        print(dioError.error);
        print(dioError.response);

        print(dioError.response.runtimeType);
        print(dioError.message);
        print(dioError.type);
        print("Fadlkfjlkdsfjlk");
        if (dioError.response.toString() == "null") {
          print("flkfhdkjfdf");
          message = "Unexpected error occurred";
          break;
        }
        if (dioError.message!.contains("SocketException")) {
          message = 'No Internet';
          break;
        }
        message = "Unexpected error occurred";
        break;
      default:
        message = "Something went wrong";
        break;
    }
  }

  late String message;

  @override
  String toString() => message;

  String _handleError(int? statusCode, dynamic error) {
    print("fskdfhsfkjshfskj");
    print(error);
    switch (statusCode) {
      case 400:
        return error;
      case 401:
        return error;
      case 403:
        print("fsdfdsffdsfd");
        NavigationService.navigatorKey.currentState?.pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => LoginScreen()),
          (route) => false,
        );
        return error;
      case 404:
        return error;
      case 409:
        return error;
      case 422:
        return error;
      case 429:
        return error;
      case 500:
        return "INTERNAL_ERROR";
      case 502:
        return "BAD_GATEWAY";
      default:
        return "INVALID_GATEWAY";
      // case 403:
      //   return 'Forbidden';
      // case 404:
      //   return error['error'];
      // case 422:
      //   return error["errors"][0]["msg"];
      // case 500:
      //   return 'Internal server error';
      // case 502:
      //   return 'Bad gateway';
      // default:
      //   return 'Oops something went wrong';
    }
  }
}
