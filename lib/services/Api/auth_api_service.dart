import 'package:dio/dio.dart';

import '../../core/constant/app_url.dart';
import '../../screens/widgets/toast.dart';
import '../execption/api_exception.dart';
import 'api_service.dart';

class AuthApiService extends ApiService {
  // Login API
  Future<Response> login({Map<String, dynamic>? data, Map<String, dynamic>? headers}) async {
    try {
      final Response response = await post(
        AppUrl.login,
        data: data,
        options: Options(headers: headers),
      );
      print(response);
      print("Fdsfhsdfjkhsfkd");
      return response;
    } on DioException catch (e) {
      print("Fdsfhsdfjkhsfkdfdsfsdfsdf");
      print(e.toString());
      print(e.response.toString());

      Toasty.showtoast(ApiException.fromDioError(e).message.toString());
      Response errorResponse = Response(
        requestOptions: RequestOptions(),
        statusMessage: e.response?.statusCode == 429 ? "" : null,
        statusCode: e.response?.statusCode ?? 0,
      );
      return errorResponse;
    }
  }

  Future<Response> signup({Map<String, dynamic>? data, Map<String, dynamic>? headers}) async {
    try {
      final Response response = await post(
        AppUrl.signup,
        data: data,
        options: Options(headers: headers),
      );
      print(response);
      print("Fdsfhsdfjkhsfkd");
      return response;
    } on DioException catch (e) {
      print("Fdsfhsdfjkhsfkdfdsfsdfsdf");
      print(e.toString());
      print(e.response.toString());

      Toasty.showtoast(ApiException.fromDioError(e).message.toString());
      Response errorResponse = Response(
        requestOptions: RequestOptions(),
        statusMessage: e.response?.statusCode == 429 ? "" : null,
        statusCode: e.response?.statusCode ?? 0,
      );
      return errorResponse;
    }
  }

  Future<Response> forgotPassword({Map<String, dynamic>? data, Map<String, dynamic>? headers}) async {
    try {
      final Response response = await post(
        AppUrl.forgetpassword,
        data: data,
        options: Options(headers: headers),
      );
      print(response);
      print("Fdsfhsdfjkhsfkd");
      return response;
    } on DioException catch (e) {
      print("Fdsfhsdfjkhsfkdfdsfsdfsdf");
      print(e.toString());
      print(e.response.toString());

      Toasty.showtoast(ApiException.fromDioError(e).message.toString());
      Response errorResponse = Response(
        requestOptions: RequestOptions(),
        statusMessage: e.response?.statusCode == 429 ? "" : null,
        statusCode: e.response?.statusCode ?? 0,
      );
      return errorResponse;
    }
  }

  Future<Response> resendOtp({Map<String, dynamic>? data, Map<String, dynamic>? headers}) async {
    try {
      final Response response = await post(
        AppUrl.forgetpassword,
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

  Future<Response> verifyOtp({Map<String, dynamic>? data, Map<String, dynamic>? headers}) async {
    try {
      final Response response = await post(
        AppUrl.verifyOtp,
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

  Future<Response> resetPassword({Map<String, dynamic>? data, Map<String, dynamic>? headers}) async {
    try {
      final Response response = await post(
        AppUrl.resetPassword,
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

  Future<Response> logOut({Map<String, dynamic>? data, Map<String, dynamic>? headers}) async {
    try {
      final Response response = await delete(
        AppUrl.logout,
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

  Future<Response> getAllUsers({Map<String, dynamic>? data, Map<String, dynamic>? headers}) async {
    try {
      final Response response = await get(
        AppUrl.getallusers,
        queryParameters: data,
        options: Options(headers: headers),
      );
      print(response);
      print("Fdsfhsdfjkhsfkd");
      return response;
    } on DioException catch (e) {
      print("Fdsfhsdfjkhsfkdfdsfsdfsdf");
      print(e.toString());
      print(e.response.toString());

      Toasty.showtoast(ApiException.fromDioError(e).message.toString());
      Response errorResponse = Response(
        requestOptions: RequestOptions(),
        statusMessage: e.response?.statusCode == 429 ? "" : null,
        statusCode: e.response?.statusCode ?? 0,
      );
      return errorResponse;
    }
  }
}
