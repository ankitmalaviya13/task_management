import 'dart:developer' as developer;
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';

import '../../core/constant/app_url.dart';
import '../../screens/widgets/toast.dart';

class ApiService {
  static final _options = BaseOptions(
    baseUrl: AppUrl.baseUrl,
    connectTimeout: AppUrl.connectionTimeout,
    receiveTimeout: AppUrl.receiveTimeout,
    responseType: ResponseType.json,
    //headers: 'Content-type': 'application/json',
  );

  // dio instance
  final Dio _dio = Dio(_options)..interceptors.add(LogInterceptor());

  // GET request
  Future<Response> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.get(
        url,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // POST request
  Future<Response> post(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.post(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      developer.log("dskladjaskdjsa ${response.data}");
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // PUT request
  Future<Response> put(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.put(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // DELETE request
  Future<Response> delete(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.delete(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> checkInternetConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Toasty.showtoast("Please connect your device to the internet");
      return false;
    } else {
      return true;
    }
  }
}

Future<FormData> wrapFromData(Map<String, dynamic> json) async {
  FormData formData = FormData.fromMap(json);
  return formData;
}

Future<FormData> wrapMultiPartImages(File image, FormData formData, String key) async {
  final fileName = image.path.split('/').last;

  formData.files.add(
    MapEntry(
      key,
      await MultipartFile.fromFile(image.path, filename: fileName),
    ),
  );
  return formData;
}
