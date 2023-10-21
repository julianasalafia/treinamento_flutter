import '../invoice_model.dart';
import 'card_model.dart';

class CreditCardModel extends CardModel {
  final double limit;
  final double spentValue;
  final int expiringDay;
  final int turnDay;
  final List<InvoiceModel> invoices;
  double get availableLimit => limit - spentValue;

  CreditCardModel({
    required this.invoices,
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
