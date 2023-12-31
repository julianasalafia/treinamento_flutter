import 'package:dart_project/models/persons/person_model.dart';

import '../cards/card_model.dart';
import '../cards/credit_card_model.dart';
import '../cards/debit_card_model.dart';
import '../invoice_model.dart';
import 'account_model.dart';

class SalaryAccountModel extends AccountModel {
  SalaryAccountModel({
    required super.balance,
    required super.accountNumber,
    required super.agencyNumber,
    required super.transactionHistory,
    required super.card,
  }) : super(accountType: AccountType.salary);

  factory SalaryAccountModel.mock(PersonModel personModel) {
    final salaryModel = SalaryAccountModel(
      balance: 3456.7,
      accountNumber: '3456',
      agencyNumber: '3456',
      transactionHistory: [],
      card: [
        DebitCardModel(
          person: personModel,
          cardNumber: '12345',
          cvv: '123',
          flag: CardFlag.masterCard,
          expirationDate: DateTime.now(),
        ),
        CreditCardModel(
          invoices: [
            InvoiceModel(
              value: 12345.6,
              opensAt: DateTime.now(),
              closesAt: DateTime.now(),
              transactionHistory: [],
              status: InvoiceStatus.open,
            ),
          ],
          limit: 123456789.0,
          spentValue: 123.0,
          expiringDay: DateTime.december,
          turnDay: 20,
          person: personModel,
          cardNumber: '12345',
          cvv: '123',
          flag: CardFlag.masterCard,
          expirationDate: DateTime.now(),
        ),
      ],
    );
    return salaryModel;
  }
}
