import 'package:dart_project/models/persons/person_model.dart';

import '../invoice_model.dart';
import 'card_model.dart';

class CreditCardModel extends CardModel {
  final double limit;
  final double spentValue;
  final int expiringDay;
  final int turnDay;
  final List<InvoiceModel> invoice;
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

  factory CreditCardModel.create(
      {required int turnDay, required PersonModel person}) {
    return CreditCardModel(
      invoice: [],
      limit: 300,
      spentValue: 0,
      expiringDay: turnDay + 10,
      turnDay: turnDay,
      person: person,
      cardNumber: CardModel.generateCardNumber(),
      cvv: CardModel.generateCVV(),
      flag: CardFlag.generateFlag(),
      expirationDate: DateTime.now().add(Duration(days: 1825)),
    );
  }
}
