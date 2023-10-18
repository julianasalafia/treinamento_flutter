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

  final accountTypeCode = Console.readInt();
  final accountType = AccountType.fromCode(accountTypeCode);

  switch (accountType) {
    case AccountType.current:
    case AccountType.saving:
    case AccountType.salary:
    case AccountType.investment:
  }
}
