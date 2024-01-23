import 'package:dart_project/models/accounts/transaction_model.dart';
import 'package:dart_project/models/error_model.dart';
import 'package:dart_project/utils/labels.dart';
import '../../utils/messages.dart';
import '../cards/card_model.dart';

abstract class AccountModel {
  final double balance;
  final String accountNumber;
  final String agencyNumber;
  final List<TransactionModel> transactionHistory;
  final CardModel card;
  final AccountType accountType;
  final List<String> keysPix;
  bool get enabledDeposit => true;

  const AccountModel({
    required this.balance,
    required this.accountNumber,
    required this.agencyNumber,
    required this.transactionHistory,
    required this.card,
    required this.accountType,
    this.keysPix = const [],
  });

  AccountModel copyWith({
    double? balance,
    String? accountNumber,
    String? agencyNumber,
    List<TransactionModel>? transactionHistory,
    List<String>? keysPix,
    CardModel? card,
    AccountType? accountType,
  });

  Map<String, dynamic> toJson() {
    return {
      'balance': balance,
      'accountNumber': accountNumber,
      'agencyNumber': agencyNumber,
      'keysPix': keysPix,
      'transactionHistory': transactionHistory,
      'card': card.toJson(),
      'accountType': accountType.label,
    };
  }

  AccountModel withdraw(
      {required AccountModel account, required double valueWithdraw}) {
    if (account.balance > valueWithdraw) {
      final balance = account.balance - valueWithdraw;

      account = account.copyWith(
        balance: balance,
      );

      return account;
    } else {
      throw ErrorModel(Messages.notEnoughBalance);
    }
  }

  AccountModel deposit({
    required valueDeposit,
    required String destinyAccount,
    required String destinyAgency,
  }) {
    if (balance > valueDeposit) {
      final newBalance = balance - valueDeposit;

      final newAccount = copyWith(
        balance: newBalance,
      );

      return newAccount;
    } else {
      throw ErrorModel(Messages.notEnoughBalance);
    }
  }

  AccountModel transaction({required AccountModel account}) {
    if (transactionHistory.isNotEmpty) {
      account = account.copyWith(
        transactionHistory: transactionHistory,
      );
    } else {
      throw ErrorModel(Messages.transactionError);
    }

    return account;
  }
}

enum AccountType {
  current(code: 1, label: Labels.currentAccount),
  saving(code: 2, label: Labels.savingAccount),
  investment(code: 3, label: Labels.investmentAccount),
  salary(code: 4, label: Labels.salaryAccount);

  const AccountType({required this.label, required this.code});
  final int code;

  static AccountType fromCode(int code) {
    return AccountType.values.firstWhere((e) => e.code == code);
  }

  final String label;
}
