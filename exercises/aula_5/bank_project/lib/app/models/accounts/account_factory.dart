import 'package:bank_project/app/models/accounts/account_model.dart';
import 'package:bank_project/app/models/accounts/current_account_model.dart';
import 'package:bank_project/app/models/accounts/investment_account_model.dart';
import 'package:bank_project/app/models/accounts/salary_account_model.dart';
import 'package:bank_project/app/models/accounts/saving_account_model.dart';

class AccountFactory {
  static AccountModel fromJson(Map<String, dynamic> account) {
    final accountType = AccountType.fromCode(account['accountType']);

    switch (accountType) {
      case AccountType.current:
        return CurrentAccountModel.fromJson(account);
      case AccountType.saving:
        return SavingAccountModel.fromJson(account);
      case AccountType.investment:
        return InvestmentAccountModel.fromJson(account);
      case AccountType.salary:
        return SalaryAccountModel.fromJson(account);
    }
  }
}
