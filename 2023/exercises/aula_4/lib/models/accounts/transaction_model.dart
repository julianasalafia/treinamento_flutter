class TransactionModel {
  final String transactionType;
  final double transactionValue;
  final DateTime date;

  const TransactionModel({
    required this.transactionType,
    required this.transactionValue,
    required this.date,
  });
}
