import 'package:aula_1/models/account/account_model.dart';

class SavingAccountModel extends AccountModel {
  SavingAccountModel({
    required super.balance,
    required super.accountNumber,
    required super.agencyNumber,
    required super.transactionHistory,
    required super.card,
  }) : super(accountType: AccountType.saving);
}
