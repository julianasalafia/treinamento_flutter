import '../cards/card_model.dart';
import 'account_model.dart';

class CurrentAccountModel extends AccountModel {
  CurrentAccountModel({
    required super.balance,
    required super.accountNumber,
    required super.agencyNumber,
    required super.transactionHistory,
    required super.card,
  }) : super(accountType: AccountType.current);

  @override
  CurrentAccountModel copyWith({
    double? balance,
    String? accountNumber,
    String? agencyNumber,
    List? transactionHistory,
    CardModel? card,
    AccountType? accountType,
  }) {
    return CurrentAccountModel(
      balance: balance ?? this.balance,
      accountNumber: accountNumber ?? this.accountNumber,
      agencyNumber: agencyNumber ?? this.agencyNumber,
      transactionHistory: transactionHistory ?? this.transactionHistory,
      card: card ?? this.card,
    );
  }
}
