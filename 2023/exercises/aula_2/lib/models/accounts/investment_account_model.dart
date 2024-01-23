import 'package:dart_project/models/persons/person_model.dart';

import '../cards/card_model.dart';
import '../cards/debit_card_model.dart';
import 'account_model.dart';

class InvestmentAccountModel extends AccountModel {
  InvestmentAccountModel({
    required super.balance,
    required super.accountNumber,
    required super.agencyNumber,
    required super.transactionHistory,
    required super.card,
  }) : super(accountType: AccountType.investment);

  factory InvestmentAccountModel.mock(PersonModel personModel) {
    final investmentModel = InvestmentAccountModel(
      balance: 4567.8,
      accountNumber: '4567',
      agencyNumber: '4567',
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
    return investmentModel;
  }
}
