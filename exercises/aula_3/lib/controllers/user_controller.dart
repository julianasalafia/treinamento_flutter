import 'package:dart_project/models/persons/person_model.dart';
import 'package:dart_project/models/user_model.dart';
import 'package:dart_project/validators/validate_email.dart';
import '../utils/console.dart';
import '../utils/messages.dart';
import '../validators/validate_password.dart';

class UserController {
  UserModel create({required PersonModel person}) {
    Console.write(Messages.loginData);
    Console.writeEmpty();

    final email =
        Console.writeAndReadWithValidator(Messages.typeEmail, validateEmail);
    final password = Console.writeAndReadWithValidator(
        Messages.typePassword, validatePassword);

    final user = UserModel(
      email: email,
      password: password,
      person: person,
    );

    return user;
  }
}
