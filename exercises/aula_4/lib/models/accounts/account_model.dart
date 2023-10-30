import 'package:dart_project/models/error_model.dart';
import 'package:dart_project/utils/labels.dart';
import '../../utils/messages.dart';
import '../cards/card_model.dart';

abstract class AccountModel<T> {
  final double balance;
  final String accountNumber;
  final String agencyNumber;
  final List transactionHistory;
  final CardModel card;
  final AccountType accountType;
  final List<String> keysPix;
  bool get enabledDeposit => true;

  AccountModel({
    required this.balance,
    required this.accountNumber,
    required this.agencyNumber,
    required this.transactionHistory,
    required this.card,
    required this.accountType,
    this.keysPix = const [],
  });

  T copyWith({
    double? balance,
    String? accountNumber,
    String? agencyNumber,
    List? transactionHistory,
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
      'transactionHistory': [],
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
    required AccountModel account,
    required valueDeposit,
    required String destinyAccount,
    required String destinyAgency,
  }) {
    if (account.balance > valueDeposit) {
      final balance = account.balance - valueDeposit;

      account = account.copyWith(
        balance: balance,
      );

      return account;
    } else {
      throw ErrorModel(Messages.notEnoughBalance);
    }
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
