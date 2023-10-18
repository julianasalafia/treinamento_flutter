import '../card/card_model.dart';

abstract class AccountModel {
  final double balance;
  final String accountNumber;
  final String agencyNumber;
  //TODO: definir o tipo da transação
  final List transactionHistory;
  final CardModel card;
  final AccountType accountType;
}

class CurrentAccountModel extends AccountModel {}

enum AccountType { current, saving, salary, investment }
