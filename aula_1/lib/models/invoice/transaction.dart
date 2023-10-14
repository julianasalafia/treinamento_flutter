class Transaction {
  final String companyName;
  final double value;
  final int installments;
  final DateTime date;

  Transaction({
    required this.companyName,
    required this.value,
    required this.installments,
    required this.date,
  });
}
