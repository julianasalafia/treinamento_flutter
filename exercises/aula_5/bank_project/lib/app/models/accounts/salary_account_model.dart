import 'package:bank_project/app/models/accounts/transaction_model.dart';
import '../cards/card_model.dart';
import 'account_model.dart';

class SalaryAccountModel extends AccountModel {
  const SalaryAccountModel({
    required super.balance,
    required super.accountNumber,
    required super.agencyNumber,
    required super.transactionHistory,
    super.keysPix,
    required super.card,
  }) : super(accountType: AccountType.salary);

  @override
  bool get enabledDeposit => false;

  @override
  SalaryAccountModel copyWith({
    double? balance,
    String? accountNumber,
    String? agencyNumber,
    List<TransactionModel>? transactionHistory,
    List<String>? keysPix,
    CardModel? card,
    AccountType? accountType,
  }) {
    return SalaryAccountModel(
      balance: balance ?? this.balance,
      accountNumber: accountNumber ?? this.accountNumber,
      agencyNumber: agencyNumber ?? this.agencyNumber,
      keysPix: keysPix ?? this.keysPix,
      transactionHistory: transactionHistory ?? this.transactionHistory,
      card: card ?? this.card,
    );
  }
}
