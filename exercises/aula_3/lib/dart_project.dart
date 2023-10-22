import 'package:dart_project/controllers/account_controller.dart';
import 'controllers/person_controller.dart';
import 'controllers/user_controller.dart';
import 'utils/console.dart';
import 'utils/messages.dart';

void dartProject() {
  PersonController personController = PersonController();
  UserController userController = UserController();
  AccountController accountController = AccountController();

  Console.clearTerminal();

  Console.write(Messages.welcome);
  Console.writeEmpty();

  final person = personController.create();
  Console.writeEmpty();

  final user = userController.create(person: person);
  final account = accountController.create(person: person, turnDay: 20);
}
