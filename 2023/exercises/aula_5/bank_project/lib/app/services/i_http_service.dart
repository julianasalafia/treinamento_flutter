import 'package:bank_project/app/models/http_response.dart';

abstract class IHttpService {
  Future<HttpResponse> get({required String url, Map<String, dynamic>? query, Map<String, String>? headers});
}