import 'package:dart_project/models/persons/person_model.dart';
import 'package:dart_project/models/user_model.dart';
import 'package:dart_project/validators/validate_email.dart';
import '../utils/console.dart';
import '../utils/messages.dart';
import '../validators/validate_password.dart';

class UserController with Console {
  UserModel create({required PersonModel person}) {
    write(Messages.loginData);
    writeEmpty();

    final email = writeAndReadWithValidator(Messages.typeEmail, validateEmail);
    final password =
        writeAndReadWithValidator(Messages.typePassword, validatePassword);

    final user = UserModel(
      email: email,
      password: password,
      person: person,
    );

    return user;
  }
}
