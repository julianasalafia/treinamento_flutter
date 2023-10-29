import 'package:dart_project/models/accounts/account_model.dart';
import 'package:dart_project/models/menu/menu_model.dart';
import 'package:dart_project/models/persons/person_model.dart';
import 'package:dart_project/models/user_model.dart';

import '../printer.dart';
import '../utils/messages.dart';

class MenuController extends Printer {
  AccountModel chooseOperation({
    required PersonModel person,
    required UserModel user,
    required AccountModel account,
  }) {
    write(Messages.menuOptions);

    final menuOptionSelectedCode = readInt();
    final menuOption = MenuOption.fromCode(menuOptionSelectedCode);

    switch (menuOption) {
      case MenuOption.myData:
        showUserLoginData(user: user);
        showPersonData(person: person, user: user);
        showCardData(account: account);
        showAccountTypeInfo(account: account);
        showAccountLabelInfo(account: account);
        break;
      case MenuOption.deposit:
        account = deposit(account: account);
        break;
      case MenuOption.transfer:
        // feedback = 'transferência';
        break;
      case MenuOption.withdraw:
        account = withdraw(account: account);
        break;
      case MenuOption.statement:
        // feedback = 'extrato';
        break;
    }
    return account;
  }
}
