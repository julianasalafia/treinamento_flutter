import 'package:dart_project/controllers/user_controller.dart';
import 'package:dart_project/models/accounts/account_model.dart';
import 'controllers/person_controller.dart';
import 'utils/console.dart';
import 'utils/messages.dart';

void main() {
  Console.clearTerminal();

  Console.write(Messages.welcome);
  Console.writeEmpty();

  // Pessoa
  final person = PersonController.create();
  Console.writeEmpty();
  final user = UserController.create(person: person);
  List<AccountType> accountTypeList = [];
}
