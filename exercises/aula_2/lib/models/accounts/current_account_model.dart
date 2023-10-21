import 'package:dart_project/models/persons/person_model.dart';
import '../cards/card_model.dart';
import '../cards/credit_card_model.dart';
import '../cards/debit_card_model.dart';
import '../invoice_model.dart';
import 'account_model.dart';

class CurrentAccountModel extends AccountModel {
  CurrentAccountModel({
    required super.balance,
    required super.accountNumber,
    required super.agencyNumber,
    required super.transactionHistory,
    required super.card,
  }) : super(accountType: AccountType.current);

  factory CurrentAccountModel.generate(PersonModel personModel) {
    final currentModel = CurrentAccountModel(
      balance: 1234.5,
      accountNumber: '1234',
      agencyNumber: '1234',
      transactionHistory: [],
      card: [
        // receber por parametro
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
    return currentModel;
  }
}
