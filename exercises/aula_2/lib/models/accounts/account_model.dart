import '../cards/card_model.dart';

abstract class AccountModel {
  final double balance;
  final String accountNumber;
  final String agencyNumber;
  // TODO(danifbn): Definir o tipo da transação
  final List transactionHistory;
  final List<CardModel> card;
  final AccountType accountType;

  AccountModel({
    required this.balance,
    required this.accountNumber,
    required this.agencyNumber,
    required this.transactionHistory,
    required this.card,
    required this.accountType,
  });
}

enum AccountType {
  current(1),
  saving(2),
  salary(3),
  investment(4);

  const AccountType(this.code);
  final int code;

  static AccountType fromCode(int code) {
    return AccountType.values.firstWhere((e) => e.code == code);
  }
}
