import 'package:dart_project/controllers/user_controller.dart';
import 'package:dart_project/models/accounts/account_model.dart';
import 'package:dart_project/models/accounts/current_account_model.dart';
import 'package:dart_project/models/accounts/investment_account_model.dart';
import 'package:dart_project/models/accounts/salary_account_model.dart';
import 'package:dart_project/models/accounts/saving_account_model.dart';
import 'package:dart_project/models/persons/person_model.dart';
import 'package:dart_project/models/persons/physical_person_model.dart';
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

  if (person is PhysicalPersonModel) {
    accountTypeList = [
      AccountType.current,
      AccountType.salary,
      AccountType.saving,
      AccountType.investment,
    ];

    Console.writeEmpty();
    Console.write(Messages.chooseAccountTypePhysical);
  } else {
    accountTypeList = [
      AccountType.current,
      AccountType.saving,
    ];

    Console.writeEmpty();
    Console.write(Messages.chooseAccountTypeLegal);
  }

  final accountTypeCode = Console.readInt();
  final accountType = AccountType.fromCode(accountTypeCode);

  dynamic getAccountModel({
    required AccountType accountType,
    required PersonModel personModel,
  }) {
    switch (accountType) {
      case AccountType.current:
        return CurrentAccountModel.mock(personModel);
      case AccountType.saving:
        return SavingAccountModel.mock(personModel);
      case AccountType.salary:
        return SalaryAccountModel.mock(personModel);
      case AccountType.investment:
        return InvestmentAccountModel.mock(personModel);
    }
  }

  final userAccount =
      getAccountModel(accountType: accountType, personModel: person);
  print(userAccount);
}
