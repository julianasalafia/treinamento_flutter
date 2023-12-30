
import 'package:bank_project/app/models/http_response.dart';
import 'package:dio/dio.dart';

import 'i_http_service.dart';

class HttpServiceDio implements IHttpService {
  final Dio _dio = Dio();

  @override
  Future<HttpResponse> get({required String url, Map<String, dynamic>? query, Map<String, String>? headers}) async {
    try {
      final response = await _dio.get(url, queryParameters: query, options: Options(headers: headers));
      return HttpResponse(statusCode: response.statusCode ?? 500, data: response.data);
    } on DioException catch (e) {
      return HttpResponse(statusCode: 500, data: e.response?.data);
    } catch (e) {
      return HttpResponse(statusCode: 500, data: e);
    }
  }
}