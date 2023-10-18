import 'package:aula_1/models/card/card_model.dart';
import 'package:aula_1/models/invoice/invoice_model.dart';

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
