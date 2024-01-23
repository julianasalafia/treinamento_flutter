import 'package:dart_project/controllers/menu_controller.dart';
import 'package:dart_project/models/accounts/account_model.dart';
import 'package:dart_project/models/persons/person_model.dart';
import 'package:dart_project/models/user_model.dart';
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
    MenuController menuController = MenuController();

    clearTerminal();

    write(Messages.welcome);
    writeEmpty();

    PersonModel person = personController.create();
    writeEmpty();

    UserModel user = userController.create(person: person);
    AccountModel account =
        accountController.create(person: person, turnDay: 20);

    clearTerminal();
    print(Messages.signUpSuccess);
    clearTerminal();

    while (true) {
      account = menuController.chooseOperation(
        person: person,
        user: user,
        account: account,
      );
    }
  }
}
