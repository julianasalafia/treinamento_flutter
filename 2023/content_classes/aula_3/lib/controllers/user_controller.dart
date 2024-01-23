import 'package:dart_project/models/persons/person_model.dart';
import 'package:dart_project/models/user_model.dart';

import '../helpers/helpers.dart';
import '../utils/console.dart';

class UserController {
  static UserModel create({required PersonModel person}) {
    Console.write('Insira os dados que serão utilizados para entrar');
    Console.writeEmpty();

    final email = Console.writeAndRead('Digite seu email: ');
    final password = Console.writeAndRead('Digite sua senha: ');

    final user = UserModel(
      id: Helpers.generateID(),
      email: email,
      password: password,
      person: person,
    );

    return user;
  }
}
