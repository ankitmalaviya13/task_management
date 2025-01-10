import 'package:dio/dio.dart';
import 'package:task_management/Services/api_exeption.dart';
import 'package:task_management/Services/api_services.dart';
import 'package:task_management/core/constant/app_url.dart';
import 'package:task_management/core/constant/constant.dart';

class ProjectApi {
  final ApiService _apiService = ApiService();

  var token;

  ProjectApi() {
    token = box.read(ConstantsVariables.token);
  }

  Future<Response> getProject({Map<String, dynamic>? data, Map<String, dynamic>? headers}) async {
    try {
      final Response response = await _apiService.get(
        AppUrl.project,
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

  Future<Response> createProject({Map<String, dynamic>? data, Map<String, dynamic>? headers}) async {
    try {
      final Response response = await _apiService.post(
        AppUrl.project,
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
}
