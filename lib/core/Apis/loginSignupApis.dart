import 'package:dio/dio.dart';
import 'package:task_management/Services/api_exeption.dart';
import 'package:task_management/core/constant/app_url.dart';

import '../../../Services/api_services.dart';
import '../constant/constant.dart';

class LoginSignupApi {
  final ApiService _apiService = ApiService();

  var useToken;

  LoginSignupApi() {
    useToken = box.read(ConstantsVariables.token);
  }

  Future<Response> login({Map<String, dynamic>? data, Map<String, dynamic>? headers}) async {
    try {
      final Response response = await _apiService.post(
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

  Future<Response> signUp({data, Map<String, dynamic>? headers}) async {
    try {
      final Response response = await _apiService.post(
        AppUrl.signUp,
        data: data,
        options: Options(headers: headers),
      );
      return response;
    } on DioException catch (e) {
      Toasty.showtoast(ApiException.fromDioError(e).message.toString());
      Response errorResponse = Response(
        requestOptions: RequestOptions(),
        statusMessage: e.response?.statusCode == 429 ? "" : null,
        statusCode: e.response?.statusCode ?? 0,
      );
      return errorResponse;
    }
  }

  //
  // Future<Response> forgotPassword({Map<String, dynamic>? data, Map<String, dynamic>? headers}) async {
  //   try {
  //     final Response response = await _apiService.post(
  //       AppUrl.forgotPassword,
  //       data: data,
  //       options: Options(headers: headers),
  //     );
  //     return response;
  //   } on DioException catch (e) {
  //     Toasty.showtoast(ApiException.fromDioError(e).message.toString());
  //     Response errorResponse = Response(
  //       requestOptions: RequestOptions(),
  //       statusMessage: e.response?.statusCode == 429 ? "" : null,
  //       statusCode: e.response?.statusCode ?? 0,
  //     );
  //     return errorResponse;
  //   }
  // }
  //
  Future<Response> verifyOtp({Map<String, dynamic>? data, Map<String, dynamic>? headers}) async {
    try {
      final Response response = await _apiService.post(
        AppUrl.verifyOtp,
        data: data,
        options: Options(headers: headers),
      );
      return response;
    } on DioException catch (e) {
      Toasty.showtoast(ApiException.fromDioError(e).message.toString());
      Response errorResponse = Response(
        requestOptions: RequestOptions(),
        statusMessage: e.response?.statusCode == 429 ? "" : null,
        statusCode: e.response?.statusCode ?? 0,
      );
      return errorResponse;
    }
  }

  //
  // Future<Response> resetPassword({Map<String, dynamic>? data, Map<String, dynamic>? headers}) async {
  //   try {
  //     final Response response = await _apiService.post(
  //       AppUrl.resetPassword,
  //       data: data,
  //       options: Options(headers: headers),
  //     );
  //     return response;
  //   } on DioException catch (e) {
  //     Toasty.showtoast(ApiException.fromDioError(e).message.toString());
  //     Response errorResponse = Response(
  //       requestOptions: RequestOptions(),
  //       statusMessage: e.response?.statusCode == 429 ? "" : null,
  //       statusCode: e.response?.statusCode ?? 0,
  //     );
  //     return errorResponse;
  //   }
  // }
  //
  Future<Response> logout({Map<String, dynamic>? data, Map<String, dynamic>? headers}) async {
    try {
      final Response response = await _apiService.get(
        AppUrl.logOut,
        options: Options(headers: headers),
      );
      print(response);
      print("Fdsfhsdfjkhsfkd");
      return response;
    } on DioException catch (e) {
      print("Fdsfhsdfjkhsfkdfdsfsdfsdf");
      print(e.toString());
      print(e.response.toString());
      box.erase();
      Toasty.showtoast(ApiException.fromDioError(e).message.toString());
      Response errorResponse = Response(
        requestOptions: RequestOptions(),
        statusMessage: e.response?.statusCode == 429 ? "" : null,
        statusCode: e.response?.statusCode ?? 0,
      );
      return errorResponse;
    }
  }

  //
  Future<Response> rateUs({Map<String, dynamic>? data, Map<String, dynamic>? headers}) async {
    try {
      final Response response = await _apiService.post(
        AppUrl.RateUs,
        data: data,
        options: Options(headers: headers),
      );
      return response;
    } on DioException catch (e) {
      Toasty.showtoast(ApiException.fromDioError(e).message.toString());
      Response errorResponse = Response(
        requestOptions: RequestOptions(),
        statusMessage: e.response?.statusCode == 429 ? "" : null,
        statusCode: e.response?.statusCode ?? 0,
      );
      return errorResponse;
    }
  }
  //
  // Future<Response> userDetailUpdate({data, Map<String, dynamic>? headers, userId}) async {
  //   try {
  //     final Response response = await _apiService.put(
  //       "${AppUrl.signUp}/${userId}/",
  //       data: data,
  //       options: Options(headers: headers),
  //     );
  //     print("dsajdkhsadasda ${response.data}");
  //     return response;
  //   } on DioException catch (e) {
  //     print(e.toString());
  //     print("sdfsdhfskfsklfjljlk");
  //     Toasty.showtoast(ApiException.fromDioError(e).message.toString());
  //     Response errorResponse = Response(
  //       requestOptions: RequestOptions(),
  //       statusMessage: e.response?.statusCode == 429 ? "" : null,
  //       statusCode: e.response?.statusCode ?? 0,
  //     );
  //     return errorResponse;
  //   }
  // }
}
