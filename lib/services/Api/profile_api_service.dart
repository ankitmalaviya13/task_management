import 'package:dio/dio.dart';

import '../../core/constant/app_url.dart';
import 'api_service.dart';

class ProfileApiService extends ApiService {
  Future<Response> addRate({Map<String, dynamic>? data, Map<String, dynamic>? headers}) async {
    try {
      final Response response = await post(
        AppUrl.rate,
        data: data,
        options: Options(headers: headers),
      );
      print(response);
      print("Fdsfhsdfjkhsfkd");
      return response;
    } catch (e) {
      print("fskfhsfkjshfkdf");
      print(e.toString());

      return Response(
        requestOptions: RequestOptions(),
        statusCode: 0,
        statusMessage: e.toString(),
      );
    }
  }

  Future<Response> changePassword({Map<String, dynamic>? data, Map<String, dynamic>? headers}) async {
    try {
      final Response response = await post(
        AppUrl.changePassword,
        data: data,
        options: Options(headers: headers),
      );
      print(response);
      print("Fdsfhsdfjkhsfkd");
      return response;
    } catch (e) {
      print("fskfhsfkjshfkdf");
      print(e.toString());

      return Response(
        requestOptions: RequestOptions(),
        statusCode: 0,
        statusMessage: e.toString(),
      );
    }
  }

  Future<Response> editProfile({Map<String, dynamic>? data, Map<String, dynamic>? headers}) async {
    try {
      final Response response = await put(
        AppUrl.updateUser,
        data: data,
        options: Options(headers: headers),
      );
      print(response);
      print("Fdsfhsdfjkhsfkd");
      return response;
    } catch (e) {
      print("fskfhsfkjshfkdf");
      print(e.toString());

      return Response(
        requestOptions: RequestOptions(),
        statusCode: 0,
        statusMessage: e.toString(),
      );
    }
  }

}
