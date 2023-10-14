import 'package:aula_1/models/card/card_model.dart';
import 'package:aula_1/models/invoice/transaction.dart';

abstract class AccountModel {
  final double balance;
  final String accountNumber;
  final String agencyNumber;
  final List<Transaction> transactionHistory;
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
}

enum AccountType { current, saving, salary, investment }
