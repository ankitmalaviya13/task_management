import 'package:dio/dio.dart';

import '../../core/constant/app_url.dart';
import 'api_service.dart';

class ProjectApiService extends ApiService {
  Future<Response> addProject({Map<String, dynamic>? data, Map<String, dynamic>? headers}) async {
    try {
      final Response response = await post(
        AppUrl.addProject,
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
