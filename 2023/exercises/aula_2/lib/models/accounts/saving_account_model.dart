import 'package:dart_project/models/persons/person_model.dart';

import '../cards/card_model.dart';
import '../cards/debit_card_model.dart';
import 'account_model.dart';

class SavingAccountModel extends AccountModel {
  SavingAccountModel({
    required super.balance,
    required super.accountNumber,
    required super.agencyNumber,
    required super.transactionHistory,
    required super.card,
  }) : super(accountType: AccountType.saving);

  factory SavingAccountModel.mock(PersonModel personModel) {
    final savingModel = SavingAccountModel(
      balance: 2345.6,
      accountNumber: '2345',
      agencyNumber: '2345',
      transactionHistory: [],
      card: [
        DebitCardModel(
          person: personModel,
          cardNumber: '12345',
          cvv: '123',
          flag: CardFlag.masterCard,
          expirationDate: DateTime.now(),
        ),
      ],
    );
    return savingModel;
  }
}
