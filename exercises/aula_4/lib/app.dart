import 'package:dart_project/printer.dart';
import 'package:dart_project/controllers/account_controller.dart';
import 'controllers/person_controller.dart';
import 'controllers/user_controller.dart';
import 'utils/messages.dart';

class App extends Printer {
  void run() {
    PersonController personController = PersonController();
    UserController userController = UserController();
    AccountController accountController = AccountController();

    clearTerminal();

    write(Messages.welcome);
    writeEmpty();

    final person = personController.create();
    writeEmpty();

    final user = userController.create(person: person);
    final account = accountController.create(person: person, turnDay: 20);

    clearTerminal();
    showUserLoginData(user: user);
    showPersonData(person: person, user: user);
    showCardData(account: account);
    showAccountTypeInfo(account: account);
    showAccountLabelInfo(account: account);
  }
}
