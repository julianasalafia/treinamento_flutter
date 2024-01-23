import 'package:aula_1/models/account/account_model.dart';

class CurrentAccountModel extends AccountModel {
  CurrentAccountModel({
    required super.balance,
    required super.accountNumber,
    required super.agencyNumber,
    required super.transactionHistory,
    required super.card,
  }) : super(accountType: AccountType.current);
}
