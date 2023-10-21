import 'package:dart_project/models/accounts/account_model.dart';
import '../models/accounts/current_account_model.dart';
import '../models/accounts/investment_account_model.dart';
import '../models/accounts/salary_account_model.dart';
import '../models/accounts/saving_account_model.dart';
import '../models/persons/person_model.dart';
import '../models/persons/physical_person_model.dart';
import '../utils/console.dart';
import '../utils/constants.dart';
import '../utils/messages.dart';

class AccountController {
  static AccountModel create(PersonModel person) {
    List<AccountType> accountTypeList = [];

    if (person is PhysicalPersonModel) {
      final age = DateTime.now().year - person.birthAt.year;

      if (age > maxAge) {
        accountTypeList = [
          AccountType.current,
          AccountType.saving,
          AccountType.salary,
          AccountType.investment,
        ];

        Console.writeEmpty();
        Console.write(Messages.chooseAccountTypePhysicalWithSalary);
      } else if (age < maxAge) {
        // preciso verificar a posição
        accountTypeList = [
          AccountType.current,
          AccountType.saving,
          // aqui está vindo o salario na posição ainda
          AccountType.investment,
        ];

        Console.writeEmpty();
        Console.write(Messages.chooseAccountTypePhysical);
      }
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
    final userAccount =
        getAccountModel(accountType: accountType, personModel: person);

    return userAccount;
  }
}

AccountModel getAccountModel({
  required AccountType accountType,
  required PersonModel personModel,
}) {
  switch (accountType) {
    case AccountType.current:
      return CurrentAccountModel.generate(personModel);
    case AccountType.saving:
      return SavingAccountModel.mock(personModel);
    case AccountType.salary:
      return SalaryAccountModel.mock(personModel);
    case AccountType.investment:
      return InvestmentAccountModel.mock(personModel);
  }
}

// terminar a parte de inserir conta
// criar 2 tipos de cartao
// fazer as validações
