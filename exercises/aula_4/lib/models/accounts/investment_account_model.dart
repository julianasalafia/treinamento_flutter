import '../cards/card_model.dart';
import 'account_model.dart';

class InvestmentAccountModel extends AccountModel<InvestmentAccountModel> {
  InvestmentAccountModel({
    required super.balance,
    required super.accountNumber,
    required super.agencyNumber,
    required super.transactionHistory,
    required super.card,
  }) : super(accountType: AccountType.investment);

  @override
  InvestmentAccountModel copyWith({
    double? balance,
    String? accountNumber,
    String? agencyNumber,
    List? transactionHistory,
    CardModel? card,
    AccountType? accountType,
  }) {
    return InvestmentAccountModel(
      balance: balance ?? this.balance,
      accountNumber: accountNumber ?? this.accountNumber,
      agencyNumber: agencyNumber ?? this.agencyNumber,
      transactionHistory: transactionHistory ?? this.transactionHistory,
      card: card ?? this.card,
    );
  }
}
