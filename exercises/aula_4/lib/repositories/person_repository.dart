import 'package:dart_project/models/persons/person_model.dart';
import 'package:dio/dio.dart';

class PersonRepository {
  final _dio = Dio();

  PersonRepository() {
    _dio.options.headers['X-Parse-Application-Id'] =
        '7T3LMu5EyWtjxsl4AgFUtiueUvTL6fNR8YVQ9LpV';
    _dio.options.headers['X-Parse-REST-API-Key'] =
        'S30aSSrxnzA08CPnZgS5JUieuplDBcdbz8l3w2Hy';
    _dio.options.headers['Content-Type'] = 'application/json';
    _dio.options.baseUrl = 'https://parseapi.back4app.com/classes';
  }

  Future<void> create({required PersonModel person}) async {
    final personJson = person.toJson();
    final response = await _dio.post('/Person', data: personJson);
    return response.data;
  }
}
