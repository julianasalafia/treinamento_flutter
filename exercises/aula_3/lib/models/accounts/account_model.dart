import '../cards/card_model.dart';

abstract class AccountModel {
  final double balance;
  final String accountNumber;
  final String agencyNumber;
  final List transactionHistory;
  final CardModel card;
  final AccountType accountType;

  AccountModel({
    required this.balance,
    required this.accountNumber,
    required this.agencyNumber,
    required this.transactionHistory,
    required this.card,
    required this.accountType,
  });

  Map<String, dynamic> toJson() {
    return {
      'balance': balance,
      'accountNumber': accountNumber,
      'agencyNumber': agencyNumber,
      'transactionHistory': [],
      'card': card.toJson(),
      'accountType': accountType.label,
    };
  }
}

enum AccountType {
  current(code: 1, label: 'Corrente Corrente'),
  saving(code: 2, label: 'Conta Poupança'),
  salary(code: 3, label: 'Conta Salário'),
  investment(code: 4, label: 'Conta Investimento');

  const AccountType({required this.label, required this.code});
  final int code;

  static AccountType fromCode(int code) {
    return AccountType.values.firstWhere((e) => e.code == code);
  }

  final String label;
}
