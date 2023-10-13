import 'package:aula_1/models/persons/person_model.dart';

class UserModel {
  final int id;
  final String email;
  final String password;
  final DateTime createdAt;
  final List<PersonModel> persons;

  UserModel({
    required this.id,
    required this.email,
    required this.password,
    required this.createdAt,
    required this.persons,
  });
}
