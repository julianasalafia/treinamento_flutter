import 'dart:convert';

import 'package:dart_project/models/user_model.dart';
import 'package:dio/dio.dart';

class UserRepository {
  final _dio = Dio();

  UserRepository() {
    _dio.options.headers['X-Parse-Application-Id'] =
        '7T3LMu5EyWtjxsl4AgFUtiueUvTL6fNR8YVQ9LpV';
    _dio.options.headers['X-Parse-REST-API-Key'] =
        'S30aSSrxnzA08CPnZgS5JUieuplDBcdbz8l3w2Hy';
    _dio.options.headers['Content-Type'] = 'application/json';
    _dio.options.baseUrl = 'https://parseapi.back4app.com/classes';
  }

  Future<void> create({
    required UserModel user,
  }) async {
    final userJson = user.toJson();
    final map = jsonEncode(userJson);

    final response = await _dio.post('/NewUser', data: userJson);
    return response.data;
  }
}
