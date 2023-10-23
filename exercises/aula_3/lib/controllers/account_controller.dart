import 'dart:math';

import 'package:dart_project/models/accounts/account_model.dart';
import 'package:dart_project/models/accounts/current_account_model.dart';
import 'package:dart_project/models/accounts/investment_account_model.dart';
import 'package:dart_project/models/accounts/salary_account_model.dart';
import 'package:dart_project/models/accounts/saving_account_model.dart';
import 'package:dart_project/models/cards/credit_card_model.dart';
import 'package:dart_project/models/cards/debit_card_model.dart';
import 'package:dart_project/models/persons/person_model.dart';
import 'package:dart_project/models/persons/physical_person_model.dart';

import '../models/cards/card_model.dart';
import '../utils/console.dart';
import '../utils/messages.dart';

const maxAge = 25;

class AccountController {
  AccountModel create({
    required PersonModel person,
    required int turnDay,
  }) {
    final random = Random();

    Console.write(Messages.chooseTypeCard);
    final typeCard = Console.readInt();
    final chosenTypeCard =
        TypeCard.values.firstWhere((element) => element.id == typeCard);

    if (person is PhysicalPersonModel) {
      final age = DateTime.now().year - person.birthAt.year;

      if (age > maxAge) {
        Console.writeEmpty();
        Console.writeAndRead(Messages.chooseAccountTypePhysicalWithSalary);
      } else if (age < maxAge) {
        Console.writeEmpty();
        Console.write(Messages.chooseAccountTypePhysical);
      }
    } else {
      Console.writeEmpty();
      Console.write(Messages.chooseAccountTypeLegal);
    }

    final accountTypeCode = Console.readInt();
    final accountType = AccountType.fromCode(accountTypeCode);

    final double balance = double.parse(random.nextInt(100).toString());

    final String accountNumber = generateAccountNumber();
    final String agencyNumber = generateAgencyNumber();
    final List transactionHistory = [];
    final CardModel card = chosenTypeCard == TypeCard.debit
        ? DebitCardModel.create(person: person)
        : CreditCardModel.create(turnDay: turnDay, person: person);

    switch (accountType) {
      case AccountType.current:
        return CurrentAccountModel(
            balance: balance,
            accountNumber: accountNumber,
            agencyNumber: agencyNumber,
            transactionHistory: transactionHistory,
            card: card);
      case AccountType.saving:
        return SavingAccountModel(
            balance: balance,
            accountNumber: accountNumber,
            agencyNumber: agencyNumber,
            transactionHistory: transactionHistory,
            card: card);
      case AccountType.salary:
        return SalaryAccountModel(
            balance: balance,
            accountNumber: accountNumber,
            agencyNumber: agencyNumber,
            transactionHistory: transactionHistory,
            card: card);
      case AccountType.investment:
        return InvestmentAccountModel(
            balance: balance,
            accountNumber: accountNumber,
            agencyNumber: agencyNumber,
            transactionHistory: transactionHistory,
            card: card);
    }
  }

  String generateAccountNumber() {
    final random = Random();
    int randomNumber = random.nextInt(999999) + 1;
    String paddedNumber = randomNumber.toString().padLeft(6, '0');

    String formattedNumber =
        '${paddedNumber.substring(0, paddedNumber.length - 2)}-${paddedNumber[paddedNumber.length - 1]}';

    return formattedNumber;
  }

  String generateAgencyNumber() {
    final random = Random();

    int randomNumber = random.nextInt(9999) + 1;
    String paddedNumber = randomNumber.toString().padLeft(4, '0');

    return paddedNumber;
  }
}
