import 'persons/person_model.dart';

class UserModel {
  final String email;
  final String password;
  final PersonModel person;

  UserModel({
    required this.email,
    required this.password,
    required this.person,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'person': person.toJson(),
    };
  }
}
