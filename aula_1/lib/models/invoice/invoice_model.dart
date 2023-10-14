import 'package:aula_1/models/invoice/transaction.dart';

import 'invoice_status.dart';

class InvoiceModel {
  final double value;
  final DateTime opensAt;
  final DateTime closesAt;
  final List<Transaction> transactionHistory;
  final InvoiceStatus status;

  InvoiceModel({
    required this.value,
    required this.opensAt,
    required this.closesAt,
    required this.transactionHistory,
    required this.status,
  });

  factory InvoiceModel.empty() {
    return InvoiceModel(
      value: 0,
      opensAt: DateTime.now(),
      closesAt: DateTime.now().add(Duration(days: 30)),
      transactionHistory: [],
      status: InvoiceStatus.open,
    );
  }
}
