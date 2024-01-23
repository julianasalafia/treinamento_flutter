import 'card_model.dart';

class CreditCardModel extends CardModel {
  final double limit;
  final double spentValue;
  final int expiringDay;
  final int turnDay;
  final InvoiceModel invoice;

  double get availableLimit => limit - spentValue;

  CreditCardModel({
    required this.invoice,
    required this.limit,
    required this.spentValue,
    required this.expiringDay,
    required this.turnDay,
    required super.person,
    required super.cardNumber,
    required super.cvv,
    required super.flag,
    required super.expirationDate,
  });
}

class InvoiceModel {
  final double value;
  final DateTime opensAt;
  final DateTime closesAt;
  // TODO: fazer um Model
  final List transactionHistory;
  final double paidValue;
  final InvoiceStatus status;

  InvoiceModel({
    required this.value,
    required this.opensAt,
    required this.closesAt,
    required this.transactionHistory,
    required this.status,
  });
}

enum InvoiceStatus { open, paid, overdue }
